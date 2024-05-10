#!/usr/bin/env zx
import Mustache from "mustache";
import Configstore from "configstore";
import clear from "clear";

const shell = process.env.SHELL | "/bin/zsh";
$.shell = shell;
$.verbose = false;

clear();
console.log("Create terraform.tfvars...");

const projectName = "oradb";

const config = new Configstore(projectName, { projectName });

await generateTFVars();

async function generateTFVars() {
  const tenancyId = config.get("tenancyId");
  const regionName = config.get("regionName");
  const compartmentId = config.get("compartmentId");
  const compartmentName = config.get("compartmentName");
  const publicKeyContent = config.get("publicKeyContent");
  const sshPrivateKeyPath = config.get("privateKeyPath");
  const instanceShape = config.get("instanceShape");

  const tfVarsPath = "tf/terraform.tfvars";

  const tfvarsTemplate = await fs.readFile(`${tfVarsPath}.mustache`, "utf-8");

  const output = Mustache.render(tfvarsTemplate, {
    tenancy_id: tenancyId,
    region_name: regionName,
    compartment_id: compartmentId,
    ssh_public_key: publicKeyContent,
    ssh_private_key_path: sshPrivateKeyPath,
    project_name: projectName,
    instance_shape: instanceShape,
  });

  console.log(
    `Terraform will deploy resources in ${chalk.green(
      regionName
    )} in compartment ${
      compartmentName ? chalk.green(compartmentName) : chalk.green("root")
    }`
  );

  await fs.writeFile(tfVarsPath, output);

  console.log(`File ${chalk.green(tfVarsPath)} created`);

  console.log(`1. ${chalk.yellow("cd tf")}`);
  console.log(`2. ${chalk.yellow("terraform init")}`);
  console.log(`3. ${chalk.yellow("terraform apply -auto-approve")}`);
}

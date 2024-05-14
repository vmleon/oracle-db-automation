#!/usr/bin/env zx
import Configstore from "configstore";
import clear from "clear";

const shell = process.env.SHELL | "/bin/zsh";
$.shell = shell;
$.verbose = false;

clear();
console.log("Clean up config files, certs, ssh keys...");

const projectName = "oradb";

const config = new Configstore(projectName, { projectName });

const deployment = config.get("deployment");

// await $`rm -rf ./.artifacts`;
// console.log(`${chalk.green("Artifacts")} deleted`);
// await $`rm -rf ./.certs`;
// console.log(`${chalk.green("Certs")} deleted`);

const sshPathParam = path.join(os.homedir(), ".ssh", projectName);
await $`rm -f ${sshPathParam}*`;
console.log(`${chalk.green("SSH keys")} deleted`);

const generatedTf = path.join("tf", deployment, "generated");
await $`rm -rf ${generatedTf}`;
console.log(`${chalk.green(generatedTf)} folder deleted`);

const tfvars = path.join("tf", deployment, "terraform.tfvars");
await $`rm -f ${tfvars}`;
console.log(`${chalk.green(tfvars)} file deleted`);

config.clear();
console.log(`${chalk.green("Config file")} deleted`);

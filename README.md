# Oracle DB Automation

## Deploy solution

```bash
cd scripts/ && npm install && cd ..
```

Answer all the questions from `setenv.mjs` script:

```bash
zx scripts/setenv.mjs
```

Generate the `terraform.tfvars` file:

```bash
zx scripts/tfvars.mjs
```

Change to the terraform folder:

```bash
cd tf
```

Terraform init:

```bash
terraform init
```

Terraform Apply:

> Auto approve only for demo porpoise. Otherwise, use Terraform `plan`.

```bash
terraform apply -auto-approve
```

Come back to the root folder

```bash
cd ..
```

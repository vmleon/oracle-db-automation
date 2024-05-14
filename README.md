# Oracle DB Automation

## Deploy solution

Go to OCI Cloud Shell and clone the repository.

```bash
https://github.com/vmleon/oracle-db-automation.git
```

Go to the new folder `oracle-db-automation`

```bash
cd oracle-db-automation
```

Install the dependencies for the scripts in [Google ZX](https://google.github.io/zx/).

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

## Connect to Database

Go to the **Menu** > **Identity & Security** > **Bastion**.

Select the bastion created, called like `subnet_oradbxx`.

Create a bastion session.

- Set a name you want.
- The user is `opc`.
- Pick the compute, called `oradbxx`.
- Set your public SSH key.

Connect through the bastion session, when active, by clicking the 3 dot button and **Copy SSH command**. Paste it on Cloud Shell and change the path to your private key (around the `-i` parameter, it is in to places, don't forget the second one)

To connect, asnwer `yes` to add the fingerprint to the know hosts.

When you are in the compute instance, create the connection `adbhigh` with `connection.sql` script.

```bash
echo exit | sql /nolog @/home/opc/connection.sql
```

Connect with the ADB high service.

```bash
sql -name adbhigh
```

Run a query to test the connection.

```sql
SELECT sysdate, 'Oracle Database' FROM DUAL;
```

To exit **SQLcl**:

```sql
quit
```

## Clean up

```bash
cd tf
```

```bash
terraform destroy -auto-approve
```

```bash
cd ..
```

```bash
npx zx scripts/clean.mjs
```

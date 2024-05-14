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
npx zx scripts/setenv.mjs
```

Generate the `terraform.tfvars` file:

```bash
npx zx scripts/tfvars.mjs
```

Run the commands that `tfvars.mjs` output in yellow one by one.

Come back to the root folder:

```bash
cd ../..
```

## Connect to Database

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

To exit the SSH connection with the compute intance:

```bash
exit
```

## Clean up

Go to the folder of the deployment you selected at the `setenv.mjs`.

> For example, for ADB-S will be:
>
> ```bash
> cd tf/adb-s
> ```

Run the Terraform destroy:

```bash
terraform destroy -auto-approve
```

Come back to the root compartment:

```bash
cd ../..
```

Clean all auxiliary files:

```bash
npx zx scripts/clean.mjs
```

## Learn more

Read the [NOTES](NOTES.md).

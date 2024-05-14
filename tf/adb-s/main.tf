module "compute" {
  source = "../modules/compute"

  project_name= local.project_name
  deploy_id= local.deploy_id
  tenancy_ocid= var.tenancy_ocid
  compartment_ocid= var.compartment_ocid
  subnet_id= oci_core_subnet.app_subnet.id
  wallet_url= oci_objectstorage_preauthrequest.wallet_par.full_path
  db_service= "${local.project_name}${local.deploy_id}"
  db_password= module.adb.db_password
  instance_shape= var.instance_shape
  ssh_private_key_path= var.ssh_private_key_path
  ssh_public_key= var.ssh_public_key
}

module "adb" {
  source = "../modules/adb"

  project_name= local.project_name
  deploy_id= local.deploy_id
  whitelisted_ips = [local.anywhere]
  compartment_ocid= var.compartment_ocid
}

resource "local_file" "adb_wallet_file" {
  content_base64 = module.adb.adb_wallet_content_base64
  filename       = "${path.module}/generated/wallet.zip"
}

resource "random_string" "deploy_id" {
  length  = 2
  special = false
  upper = false
}
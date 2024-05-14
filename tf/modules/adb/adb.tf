resource "oci_database_autonomous_database" "adb" {
  compartment_id = var.compartment_ocid
  db_name        = "${var.project_name}${var.deploy_id}"

  #Optional
  admin_password              = random_password.adb_admin_password.result
  cpu_core_count              = 1
  data_storage_size_in_tbs    = 1
  db_workload                 = var.db_workload
  display_name                = "${var.project_name}${var.deploy_id}"
  is_mtls_connection_required = var.is_mtls_connection_required
  whitelisted_ips             = var.whitelisted_ips
  is_auto_scaling_enabled     = var.is_auto_scaling_enabled
  license_model               = var.license_model
}

resource "oci_database_autonomous_database_wallet" "adb_wallet" {
  autonomous_database_id = oci_database_autonomous_database.adb.id
  password               = random_password.adb_admin_password.result
  base64_encode_content  = "true"
}

resource "oci_database_autonomous_database" "adb" {
  compartment_id = var.compartment_ocid
  db_name        = "${var.project_name}${var.deploy_id}"
  display_name   = "${var.project_name}${var.deploy_id}"

  db_workload      = var.db_workload
  db_version       = coalesce(var.db_version, data.oci_database_autonomous_db_versions.adb_versions.autonomous_db_versions[0].version)
  license_model    = var.license_model
  database_edition = var.database_edition
  is_free_tier     = var.is_free_tier
  is_dedicated     = var.is_dedicated

  admin_password = random_password.adb_admin_password.result

  compute_model                       = var.compute_model
  compute_count                       = var.compute_model == "ECPU" ? var.compute_count : null
  cpu_core_count                      = var.compute_model == "OCPU" ? var.cpu_core_count : null
  data_storage_size_in_tbs            = var.data_storage_size_in_tbs
  is_auto_scaling_enabled             = var.is_auto_scaling_enabled
  is_auto_scaling_for_storage_enabled = var.is_auto_scaling_for_storage_enabled

  is_mtls_connection_required = var.is_mtls_connection_required
  whitelisted_ips             = var.whitelisted_ips

  is_local_data_guard_enabled = var.is_local_data_guard_enabled

  open_mode                  = var.open_mode
  data_safe_status           = var.data_safe_status
  permission_level           = var.permission_level
  operations_insights_status = var.operations_insights_status
  database_management_status = var.database_management_status

  character_set  = var.character_set
  ncharacter_set = var.ncharacter_set
}

resource "oci_database_autonomous_database_wallet" "adb_wallet" {
  autonomous_database_id = oci_database_autonomous_database.adb.id
  password               = random_password.adb_admin_password.result
  base64_encode_content  = "true"
}

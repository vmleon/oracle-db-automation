data "oci_database_autonomous_db_versions" "adb_versions" {
  compartment_id = var.compartment_ocid

  # filter {
  #   name   = "version"
  #   values = ["19c", "23ai"]
  # }
}

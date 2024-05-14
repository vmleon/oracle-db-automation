output "db_service" {
  value = "${var.project_name}${var.deploy_id}"
}
output "db_password" {
  value = random_password.adb_admin_password.result
  sensitive = true
}

output "adb_wallet_content_base64" {
  value = oci_database_autonomous_database_wallet.adb_wallet.content
  sensitive = true
}
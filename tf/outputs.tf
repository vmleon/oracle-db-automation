output "deployment" {
  value = "${local.project_name}${local.deploy_id}"
}

output "db_password" {
  value = random_password.adb_admin_password.result
  sensitive = true
}
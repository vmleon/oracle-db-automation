output "deployment" {
  value = "${local.project_name}${local.deploy_id}"
}

output "db_password" {
  value = module.adb.db_password
  sensitive = true
}

output "private_ip" {
  value = module.compute.private_ip
}
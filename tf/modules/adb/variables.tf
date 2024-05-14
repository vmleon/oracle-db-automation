variable "project_name" {
  type = string
}

variable "deploy_id" {
  type = string
}

variable "compartment_ocid" {
  type = string
}

variable "whitelisted_ips" {
  type = list(string)
}

variable "db_workload" {
  default = "OLTP"
  type = string
}

variable "license_model" {
  default = "BRING_YOUR_OWN_LICENSE"
  type = string
}

variable "is_auto_scaling_enabled" {
  default = true
  type = bool
}

variable "is_mtls_connection_required" {
  default = true
  type = bool
}
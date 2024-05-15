variable "project_name" {
  type = string
}

variable "deploy_id" {
  type = string
}

variable "compartment_ocid" {
  type = string
}

variable "is_free_tier" {
  default = false
  type    = string
}

variable "is_dedicated" {
  default = false
  type    = string
}

variable "whitelisted_ips" {
  type = list(string)
}

variable "db_workload" {
  default = "OLTP" // "AJD", "DW", "APEX"
  type    = string
}

variable "compute_model" {
  default = "ECPU" // "OCPU"?
  type    = string
}

variable "compute_count" {
  default = "2.0"
  type    = string
}

variable "cpu_core_count" {
  default = 1
  type    = number
}

variable "data_storage_size_in_tbs" {
  default = 1
  type    = number
}

variable "license_model" {
  default = "BRING_YOUR_OWN_LICENSE" // "LICENSE_INCLUDED"
  type    = string
}

// if not defined, it picks data.oci_database_autonomous_db_versions.adb_versions
variable "db_version" {
  default = null
  type    = string
}

variable "is_auto_scaling_enabled" {
  default = true
  type    = bool
}

variable "is_auto_scaling_for_storage_enabled" {
  default = true
  type    = bool
}

variable "is_mtls_connection_required" {
  default = true
  type    = bool
}

variable "open_mode" {
  default = "READ_WRITE" // "READ_ONLY"
  type    = string
}

variable "permission_level" {
  default = "UNRESTRICTED" // "RESTRICTED"
  type    = string
}

variable "data_safe_status" {
  default = "NOT_REGISTERED" // "REGISTERED"
  type    = string
}

variable "database_edition" {
  default = "ENTERPRISE_EDITION" // "STANDARD_EDITION"
  type    = string
}

variable "operations_insights_status" {
  default = "NOT_ENABLED" // "ENABLED"
  type    = string
}

variable "database_management_status" {
  default = "NOT_ENABLED" // "ENABLED"
  type    = string
}

variable "is_local_data_guard_enabled" {
  default = false
  type    = bool
}

variable "ncharacter_set" {
  default = "AL16UTF16"
  type    = string
}

variable "character_set" {
  default = "AL32UTF8"
  type    = string
}

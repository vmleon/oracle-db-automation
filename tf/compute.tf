locals {
  cloud_init_content = templatefile("${path.module}/userdata/bootstrap.tftpl", {
    wallet_par_full_path          = oci_objectstorage_preauthrequest.wallet_par.full_path
    db_service                    = "${local.project_name}${local.deploy_id}"
    db_password                   = random_password.adb_admin_password.result
  })
}

data "oci_core_images" "ol8_images" {
  compartment_id           = var.compartment_ocid
  shape                    = var.instance_shape
  operating_system         = "Oracle Linux"
  operating_system_version = "8"
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

resource "oci_core_instance" "app" {
  availability_domain = lookup(data.oci_identity_availability_domains.ads.availability_domains[0], "name")
  compartment_id = var.compartment_ocid
  display_name   = "${local.project_name}_${local.deploy_id}"
  shape          = var.instance_shape

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data           = base64encode(local.cloud_init_content)
  }

  agent_config {
    plugins_config {
      desired_state = "ENABLED"
      name          = "Bastion"
    }
  }

  shape_config {
    ocpus         = 1
    memory_in_gbs = 16
  }

  create_vnic_details {
    subnet_id                 = oci_core_subnet.app_subnet.id
    assign_public_ip          = false
    display_name              = "${local.project_name}${local.deploy_id}"
    assign_private_dns_record = true
    hostname_label            = "${local.project_name}${local.deploy_id}"
  }

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.ol8_images.images[0].id
  }

  timeouts {
    create = "60m"
  }
}

resource "time_sleep" "wait_for_app" {
  depends_on      = [oci_core_instance.app]
  create_duration = "2m"
}

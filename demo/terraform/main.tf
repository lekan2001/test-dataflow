# ----------------------------------------------------------------------------------------------------------------------
# Main modules
# ----------------------------------------------------------------------------------------------------------------------
module "demo-vpc" {
  source                     = "./terraform-modules/vpc"
  project_id = var.project_id
  project_number = data.google_project.project.number
} 

# Enable API's
resource "google_project_service" "enable-services" {
  for_each = toset(var.services_to_enable)

  project = var.project_id
  service = each.value
  disable_on_destroy = false
}

resource "time_sleep" "wait_X_seconds" {
    depends_on = [
        google_project_service.enable-services
        ]

    create_duration = "60s"
}

resource "google_dataflow_job" "dataflow_job" {
  project               = var.project_id
  region                = var.region
  zone                  = var.zone
  name                  = var.name
  on_delete             = var.on_delete
  max_workers           = var.max_workers
  template_gcs_path     = var.template_gcs_path
  temp_gcs_location     = "gs://${var.temp_gcs_location}/tmp_dir"
  parameters            = var.parameters
  service_account_email = var.service_account_email
  network               = var.network_self_link
  subnetwork            = var.subnetwork_self_link
  machine_type          = var.machine_type
  ip_configuration      = var.ip_configuration
  kms_key_name          = var.kms_key_name

  depends_on = [
    time_sleep.wait_X_seconds
  ]
}
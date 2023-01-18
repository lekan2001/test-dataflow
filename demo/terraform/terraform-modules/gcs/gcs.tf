# Enable API's
resource "google_project_service" "enable-services" {
  for_each = toset(var.services_to_enable)

  project = var.project_id
  service = each.value
  disable_on_destroy = false
}

# ----------------------------------------------------------------------------------------------------------------------
# Configure GCS Buckets
# ----------------------------------------------------------------------------------------------------------------------
resource "google_storage_bucket" "ingest-bucket" {
  name          = var.bucket_name
  uniform_bucket_level_access = true
  location      = var.region
  storage_class = "REGIONAL"
  project       = var.project_id
  force_destroy = var.force_destroy

  depends_on = [
    google_project_service.enable-services
  ]
}


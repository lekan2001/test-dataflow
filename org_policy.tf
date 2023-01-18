# ----------------------------------------------------------------------------------------------------------------------
# Organization policy
# ----------------------------------------------------------------------------------------------------------------------
resource "google_project_organization_policy" "gke-vpc-peering" {
    project = var.project_id
    constraint = "compute.restrictVpcPeering"

    list_policy {
        allow {
            all = true
        }
    }
}
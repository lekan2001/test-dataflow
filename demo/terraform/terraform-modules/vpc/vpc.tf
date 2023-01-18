# Enable API's
resource "google_project_service" "enable-services" {
  for_each = toset(var.services_to_enable)

  project = var.project_id
  service = each.value
  disable_on_destroy = false
}

# Providing permisison to compute service 
resource "google_project_iam_member" "iam_roles" {
 count   = length(var.gcp_iam_list)
 project = var.project_id
 role = var.gcp_iam_list[count.index]
 member  = "serviceAccount:${var.project_number}-compute@developer.gserviceaccount.com"
 depends_on = [
      google_project_service.enable-services
  ]
}

# VPC
resource "google_compute_network" "demo-vpc" {
 name = var.vpc-name    
 project = var.project_id          
 auto_create_subnetworks = true
 depends_on = [
   google_project_service.enable-services,
   google_project_iam_member.iam_roles
 ]
}
 
# Firewalls
resource "google_compute_firewall" "default" {
   
 name    = "test-firewall"
 network = google_compute_network.demo-vpc.name
 project= var.project_id
 allow {
   protocol = "icmp"
 }
 
 allow {
   protocol = "tcp"
   ports    = ["80", "8080", "1000-2000", "12345-12346"]
 }
 source_tags = ["web"]
 
 depends_on = [
   google_compute_network.demo-vpc,
   google_project_service.enable-services
 ]
}
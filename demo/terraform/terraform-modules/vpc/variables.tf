
variable "project_id" {}
variable "project_number" {
    type = number
    default = null
}

variable "vpc-name" {
    type = string
    description = "Custom VPC Name"
    default = "default"
}

variable "gcp_iam_list" {
    description = "List of IAM permission to compute service"
    type    = list(string)
    default =  [
        "roles/dataflow.worker",
        "roles/pubsub.subscriber",
        "roles/bigquery.admin",
        "roles/storage.objectAdmin"
 ]
}

# Service to enable
variable "services_to_enable" {
    description = "List of GCP Services to enable"
    type    = list(string)
    default =  [
        "compute.googleapis.com",
        "iam.googleapis.com",
        "iamcredentials.googleapis.com",
        "autoscaling.googleapis.com"
    ]
  
}
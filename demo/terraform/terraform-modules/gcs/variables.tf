
variable "project_id" {}
variable "bucket_name" {
    type        = string
    description = "The name of the bucket."
}
variable "region" {
  type        = string
  description = "The GCS bucket region. This should be the same as your dataflow job's zone to optimize performance."
  default     = "us-central1"
}

variable "force_destroy" {
  type        = bool
  description = "When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run."
  default     = true
}

# Service to enable
variable "services_to_enable" {
    description = "List of GCP Services to enable"
    type    = list(string)
    default =  [
        "compute.googleapis.com",
        # "autoscaling.googleapis.com",
    ]
}





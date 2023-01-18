# ----------------------------------------------------------------------------------------------------------------------
# CTD Required
# ----------------------------------------------------------------------------------------------------------------------
variable "project_id" {
  type        = string
  description = "project id required"
}
variable "project_name" {
  type        = string
  description = "project name in which demo deploy"
  default = ""
}
variable "project_number" {
  type        = string
  description = "project number in which demo deploy"
  default = ""
}
variable "gcp_account_name" {
  description = "user performing the demo"
  default = ""
}
variable "deployment_service_account_name" {
  description = "Cloudbuild_Service_account having permission to deploy terraform resources"
  default = ""
}
variable "org_id" {
  description = "Organization ID in which project created"
  default = ""
}
variable "data_location" {
  type        = string
  description = "Location of source data file in central bucket" 
  default = ""
}
variable "secret_stored_project" {
    type        = string
    description = "Project where secret is accessing from"
    default = ""
}

# ----------------------------------------------------------------------------------------------------------------------
# Data Flow Variables
# ----------------------------------------------------------------------------------------------------------------------
# Service to enable
variable "services_to_enable" {
    description = "List of GCP Services to enable"
    type    = list(string)
    default =  [
        "dataflow.googleapis.com",
        # "iam.googleapis.com",
        # "iamcredentials.googleapis.com",
        "autoscaling.googleapis.com",
    ]
  
}

variable "name" {
  type        = string
  description = "The name of the dataflow job"
  default = "test-olalekan"
}

variable "template_gcs_path" {
  type        = string
  description = "The GCS path to the Dataflow job template."
  default = ""
}

variable "temp_gcs_location" {
  type        = string
  description = "A writeable location on GCS for the Dataflow job to dump its temporary data."
  default = ""
}

variable "parameters" {
  type        = map(string)
  description = "Key/Value pairs to be passed to the Dataflow job (as used in the template)."
  default     = {}
}

variable "max_workers" {
  type        = number
  description = " The number of workers permitted to work on the job. More workers may improve processing speed at additional cost."
  default     = 1
}

variable "on_delete" {
  type        = string
  description = "One of drain or cancel. Specifies behavior of deletion during terraform destroy. The default is cancel."
  default     = "cancel"
}

variable "region" {
  type        = string
  description = "The region in which the created job should run. Also determines the location of the staging bucket if created."
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "The zone in which the created job should run."
  default     = "us-central1-a"
}

variable "service_account_email" {
  type        = string
  description = "The Service Account email that will be used to identify the VMs in which the jobs are running"
  default     = ""
}

variable "subnetwork_self_link" {
  type        = string
  description = "The subnetwork self link to which VMs will be assigned."
  default     = ""
}

variable "network_self_link" {
  type        = string
  description = "The network self link to which VMs will be assigned."
  default     = "default"
}

variable "machine_type" {
  type        = string
  description = "The machine type to use for the job."
  default     = "n1-standard-1"
}

variable "ip_configuration" {
  type        = string
  description = "The configuration for VM IPs. Options are 'WORKER_IP_PUBLIC' or 'WORKER_IP_PRIVATE'."
  default     = null
}

variable "kms_key_name" {
  type        = string
  description = "The name for the Cloud KMS key for the job. Key format is: projects/PROJECT_ID/locations/LOCATION/keyRings/KEY_RING/cryptoKeys/KEY"
  default     = null
}

variable "additional_experiments" {
  type        = list
  description = "The list of additional experiments"
  default = null
}

variable "inputSubscription" {
  type        = string
  description = "Input subscription for dataflow"
  default = null
}

variable "outputTableSpec" {
  type        = string
  description = "The specification of output table"
  default = null
}
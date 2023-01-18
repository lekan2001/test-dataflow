#!/bin/bash
GCP_PROJECT=$(gcloud config get project)
gsutil mb gs://$GCP_PROJECT-terraform

# Create file
echo -e 'terraform {
\tbackend "gcs" {
\t\tbucket = "'$GCP_PROJECT-terraform'"
\t\tprefix = "terraform/state"
\t}
}' >> backend.tf

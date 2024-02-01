variable "credentials" {
  description = "My Credentials"
  default     = "<Path to your Service Account json file>"
  #ex: if you have a directory where this file is called keys with your service account json file
  #saved there as my-creds.json you could use default = "./keys/my-creds.json"
}


variable "project" {
  description = "Project"
  default     = "earnest-pact-412216"
}

variable "region" {
  description = "Region"
  #Update the below to your desired region
  default     = "europe-west1"
}

variable "location" {
  description = "Project Location"
  #Update the below to your desired location
  default     = "eu"
}

variable "bq_dataset_name" {
  description = "gcs_bq_ytdata"
  #Update the below to what you want your dataset to be called
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "gcs_sb_ytdata"
  #Update the below to a unique bucket name
  default     = "terraform-demo-terra-bucket"
}

variable "gcs_storage_class" {
  description = "gcs_sc_ytdata"
  default     = "STANDARD"
}
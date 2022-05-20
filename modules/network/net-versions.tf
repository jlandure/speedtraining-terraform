terraform {
    required_version = "1.2.0"
    required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.21.0"
    }
  }
}

provider "google" {
  project     = "zenika-training-terraform"
  region      = "europe-west1"
  credentials = pathexpand("./../../service_account.json")
}
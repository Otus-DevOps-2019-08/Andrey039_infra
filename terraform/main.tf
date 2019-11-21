terraform {
  # Версия terraform
  required_version = "~> 0.12"
  required_providers {
    google = "~>2.7"
  }
}
provider "google" {
  # Версия провайдера
  version = "2.15"

  # ID проекта
  project = var.project
  region  = var.region
}

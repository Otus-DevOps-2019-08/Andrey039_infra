provider "google" {
  # Версия провайдера
  version = "~> 2.15"

  # ID проекта
  project = var.project
  region  = var.region
}
module "storage-bucket" {
  source  = "SweetOps/storage-bucket/google"
  version = "0.3.0"
  name = "storage-bucket-Andrey040"
  location      = var.region
  force_destroy = true
}

output storage-bucket_url {
  value = module.storage-bucket.url
}

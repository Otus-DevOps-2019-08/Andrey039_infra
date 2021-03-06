variable project {
  # Описание переменной
  description = "Project ID"
  # Значение по умолчанию
  default = "infra-253413"
}
variable region {
  description = "Region"
  default     = "europe-west1"
}
variable public_key_path {
  description = "Путь до публичного ключа"
  default     = "~/.ssh/appuser.pub"
}
variable disk_image {
  description = "Disk image"
  default     = "reddit-base"
}

variable privat_key_path {
  description = "Путь до приватного ключа"
  default     = "~/.ssh/appuser"
}

variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

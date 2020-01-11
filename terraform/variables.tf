variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable location {
  description = "location"
  default     = "europe-west2-1"
}

variable public_key_path {
  description = "public_key_path"
  default     = "~/.ssh/appuser.pub"
}

variable private_key_path {
  description = "private_key_path"
  default     = "~/private_key_path"
}
variable disk_image {
  description = "disk_image"
  default     = "reddit-base"
}

variable inst_count {
  description = "inst_count"
  default     = 1
}
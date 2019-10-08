variable project {
  description = "infra-253413"
}
variable region {
  description = "europe-west3"
  # Значение по умолчанию
  default = "europe-west3"
}
variable public_key_path {
  # Описание переменной
  description = "~/.ssh/appuser.pub"
}
variable disk_image {
  description = "reddit-base"
}

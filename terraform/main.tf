terraform {
  # Версия terraform
  required_version = "0.12.10"
}

provider "google" {
  # Версия провайдера
  version = "2.15"

  # ID проекта
  project = var.project
  region = "europe-west3"
}
resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"
  # Название сети, в которой действует правило
  network = "default"
  # Какой доступ разрешить
  allow {
    protocol = "tcp"
    ports = ["9292"]
  }
  # Каким адресам разрешаем доступ
  source_ranges = ["0.0.0.0/0"]
  # Правило применимо для инстансов с перечисленными тэгами
  target_tags = ["reddit-app"]
}
resource "google_compute_instance" "app" {
  name = "reddit-app"
  machine_type = "g1-small"
  zone = "europe-west3-c"
  tags = ["reddit-app"]
  # определениезагрузочногодиска
  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }
  
  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    # путь до публичного ключа
    ssh-keys = "appuser:${file("~/.ssh/appuser.pub")}"
  }
  connection {
    host        = self.network_interface[0].access_config[0].nat_ip
    type        = "ssh"
    user        = "appuser"
    agent       = false
    private_key = "${file("~/.ssh/appuser")}"
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}

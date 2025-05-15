terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Lokales Docker-Image bauen
resource "docker_image" "timeswift" {
  name = "timeswift:latest"
  build {
    context    = "${path.module}/.."
    dockerfile = "Dockerfile"
  }
  triggers = {
    dir_sha1 = sha1(join("", [for f in fileset(path.module, "../**/*") : filesha1(f)]))
  }
}

# Docker-Container erstellen und starten
resource "docker_container" "timeswift_container" {
  name  = "timeswift-container"
  image = docker_image.timeswift.image_id
  restart = "always"
  
  ports {
    internal = 80
    external = 8080
  }

  volumes {
    container_path = "/app"
    host_path      = abspath("${path.module}/..")
    read_only      = true
  }
}

output "container_id" {
  description = "ID des erstellten Containers"
  value       = docker_container.timeswift_container.id
}

output "access_url" {
  description = "URL, unter der die Webseite erreichbar ist"
  value       = "http://localhost:8080"
}
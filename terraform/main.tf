provider "docker" {
  host = "ssh://${var.username}@${var.remote_host}:22"
}
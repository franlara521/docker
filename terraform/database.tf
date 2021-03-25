resource "docker_image" "database" {
  name = "jc21/mariadb-aria:latest"
}

resource "docker_volume" "db_vol" {
  name = "db_vol"
}


resource "docker_container" "db" {
  name  = "mariadb"
  image = docker_image.database.latest
  restart = "unless-stopped"
  env = [
                "MYSQL_ROOT_PASSWORD=npm",
                "MYSQL_DATABASE=npm",
                "MYSQL_USER=npm",
                "MYSQL_PASSWORD=npm"
              ]
  volumes {
    container_path  = "/var/lib/mysql"
    read_only = false
    volume_name = "db_vol"
   #volume_name = "${docker_volume.dashing_public.name}"
    }

}

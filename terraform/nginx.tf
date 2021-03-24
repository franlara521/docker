resource "docker_image" "nginx_proxy" {
  name = "jc21/nginx-proxy-manager:latest"
}

resource "docker_container" "nginx_proxy" {
  name  = "reverse-proxy"
  image = docker_image.nginx_proxy.latest
  restart = "unless-stopped"
  env = ["DB_MYSQL_HOST= db",
        "DB_MYSQL_PORT=3306",
        "DB_MYSQL_USER=npm",
        "DB_MYSQL_PASSWORD=npm",
        "DB_MYSQL_NAME=npm"
        ]
  volumes {
    container_path  = "/data"
    read_only = false
    host_path = "./app/nginx/data"
   #volume_name = "${docker_volume.dashing_public.name}"
    }
  volumes {
    container_path  = "/etc/letsencrypt"
    read_only = false
    host_path = "./app/nginx/letsencrypt"
   #volume_name = "${docker_volume.dashing_public.name}"
    }

}

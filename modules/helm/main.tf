resource "helm_release" "boring_app_release" {
  name  = "boring_app"
  chart = "../../boring-chart/"

  set {
    name  = "image.repository"
    value = var.container_image_url
  }

  set {
    name  = "mysql.host"
    value = var.mysql_host
  }

  set {
    name  = "mysql.user"
    value = var.mysql_user
  }

  set {
    name  = "mysql.password"
    value = var.mysql_password
  }

  set {
    name  = "mysql.database"
    value = var.mysql_database
  }
}

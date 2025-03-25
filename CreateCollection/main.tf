terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = ">= 1.0.0"
    }
  }
}
provider "mongodbatlas" {
  public_key  = var.mongodb_public_key
  private_key = var.mongodb_private_key
}

data "mongodbatlas_project" "project" {
  name = var.mongodb_project_name
}

data "mongodbatlas_cluster" "cluster" {
  project_id   = data.mongodbatlas_project.project.id
  name  = var.mongodb_cluster_name
}

output "connection_string" {
  value = data.mongodbatlas_cluster.cluster.connection_strings[0].standard_srv
  description = "The connection string for the MongoDB Atlas cluster"
}

resource "mongodbatlas_project_ip_access_list" "ip_whitelist" {
  project_id   = data.mongodbatlas_project.project.id
  #cidr_block = var.public_ip
  ip_address = var.public_ip
}
 
resource "mongodbatlas_database_user" "user" {
  username           = var.mongodb_username
  password           = var.mongodb_password
  project_id         = data.mongodbatlas_project.project.id
  auth_database_name = "admin"
  roles {
    role_name     = "readWrite"
    database_name = var.mongodb_database_name
  }
}
 
resource "null_resource" "create_collection" {
  provisioner "local-exec" {
    command = <<EOT
    timeout 60s
      mongosh "${data.mongodbatlas_cluster.cluster.connection_strings[0].standard_srv}" \
        --username ${var.mongodb_username} \
        --password ${var.mongodb_password} \
        --eval 'db.getSiblingDB("${var.mongodb_database_name}").createCollection("${var.mongodb_collection_name}")'
    EOT
  }
depends_on = [mongodbatlas_project_ip_access_list.ip_whitelist]
}

terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 1.0"
    }
  }
}

provider "mongodbatlas" {
  public_key  = var.public_key
  private_key = var.private_key
}

resource "mongodbatlas_project" "my_project" {
  name   = "Rmand145"
  org_id = var.org_id
}

resource "mongodbatlas_cluster" "my_cluster" {
  project_id                 = mongodbatlas_project.my_project.id
  name                       = "my-cluster"
  provider_name              = "AZURE"  # Azure as the provider
  provider_instance_size_name = "M10"    # Free-tier cluster
  backing_provider_name      = "AZURE"
  provider_region_name       = "US_WEST" # Correct argument for Azure region
}


resource "mongodbatlas_database_user" "db_user" {
  username           = "myuser"
  password           = var.db_password
  project_id         = mongodbatlas_project.my_project.id
  auth_database_name = "admin"  # Required field

  roles {
    role_name     = "readWrite"
    database_name = "mydatabase"
  }
}

resource "null_resource" "create_db_collection" {
  provisioner "local-exec" {
    command = "mongosh mongodb+srv://${var.db_user}:${var.db_password}@${mongodbatlas_cluster.my_cluster.name}.mongodb.net --eval 'use ${var.db_name}; db.createCollection(\"${var.collection_name}\");'"
  }
}

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
  name   = "Rmand1234"
  org_id = var.org_id
}

resource "mongodbatlas_cluster" "my_cluster" {
  project_id                 = mongodbatlas_project.my_project.id
  name                       = "my-cluster"
  provider_name              = "AZURE"  # Azure as the provider
  provider_instance_size_name = "M0"    # Free-tier cluster
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
  depends_on = [mongodbatlas_cluster.my_cluster]

  provisioner "local-exec" {
    command = <<EOT
      mongosh "mongodb+srv://${var.db_user}:${var.db_password}@my-cluster.mongodb.net" --eval '
        use mydatabase;
        db.createCollection("mycollection");
      '
    EOT
  }
}

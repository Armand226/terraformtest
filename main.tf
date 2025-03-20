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

# Add Your IP Address to MongoDB Atlas Whitelist
resource "mongodbatlas_project_ip_whitelist" "ip_whitelist" {
  project_id = mongodbatlas_project.my_project.id
  cidr_block = "Y172.58.51.134/32"  # Replace with your public IP address (e.g., 203.0.113.45/32)
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

output "mongodb_connection_string" {
  value = mongodbatlas_cluster.my_cluster.connection_strings[0].standard_srv
  sensitive = true
}

resource "null_resource" "create_db_collection" {
  provisioner "local-exec" {
    command = <<EOT
      echo "Waiting for MongoDB Atlas cluster to be available..."
      sleep 120  # Wait for 2 minutes
      mongosh "${mongodbatlas_cluster.my_cluster.connection_strings[0].standard_srv}" --eval '
      use Database1;
      db.createCollection('collection1');
      '
    EOT
  }

  depends_on = [mongodbatlas_cluster.my_cluster]
}


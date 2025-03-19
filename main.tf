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
  name   = "my-mongo-project"
  org_id = var.org_id
}

resource "mongodbatlas_cluster" "my_cluster" {
  project_id   = mongodbatlas_project.my_project.id
  name         = "my-cluster"
  provider_name = "AWS"
  region_name   = "US_EAST_1"
  backing_provider_name = "AWS"
  instance_size_name = "M0" # Free-tier
}

resource "mongodbatlas_database_user" "db_user" {
  username           = "myuser"
  password           = var.db_password
  project_id         = mongodbatlas_project.my_project.id
  roles {
    role_name   = "readWrite"
    database_name = "mydatabase"
  }
}

resource "mongodbatlas_network_container" "vpc" {
  project_id     = mongodbatlas_project.my_project.id
  provider_name  = "AWS"
  region_name    = "US_EAST_1"
  atlas_cidr_block = "192.168.0.0/24"
}

resource "mongodbatlas_database" "my_database" {
  project_id  = mongodbatlas_project.my_project.id
  cluster_name = mongodbatlas_cluster.my_cluster.name
  name        = "mydatabase"
}

resource "mongodbatlas_database_collection" "my_collection" {
  project_id  = mongodbatlas_project.my_project.id
  cluster_name = mongodbatlas_cluster.my_cluster.name
  db_name     = mongodbatlas_database.my_database.name
  name        = "mycollection"
}

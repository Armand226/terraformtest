variable "mongodb_public_key" {
  description = "MongoDB Atlas Public Key"
  type        = string
}
variable "mongodb_private_key" {
  description = "MongoDB Atlas Private Key"
  type        = string
}
variable "mongodb_project_name" {
  description = "MongoDB Atlas Project Name"
  type        = string
}
variable "public_ip" {
  description = "The public IP address of the runner"
  type        = string
}
variable "mongodb_username" {
  description = "Name of the Database"
  type        = string
}
variable "mongodb_password" {
  description = "Database Password"
  type        = string
}
variable "mongodb_database_name" {
  description = "Name of the Database"
  type        = string
}
variable "mongodb_collection_name" {
  description = "Name of the Collection"
  type        = string
}
variable "mongodb_cluster_name" {
  description = "Name of the Cluster"
  type        = string
}

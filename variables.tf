variable "public_key" {
  description = "MongoDB Atlas Public API Key"
  type        = string
}

variable "private_key" {
  description = "MongoDB Atlas Private API Key"
  type        = string
  sensitive   = true
}

variable "org_id" {
  description = "MongoDB Atlas Organization ID"
  type        = string
}

variable "db_password" {
  description = "Database User Password"
  type        = string
  sensitive   = true
}

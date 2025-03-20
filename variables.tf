variable "public_key" {
  description = "MongoDB Atlas Public API Key"
  type        = string
default = "lhjgxkoj"
}

variable "private_key" {
  description = "MongoDB Atlas Private API Key"
  type        = string
  #sensitive   = true
default = "d357ed2d-9143-4483-8c7c-627083d25612"
}

variable "org_id" {
  description = "MongoDB Atlas Organization ID"
  type        = string
default = "67db4a8785bbe2297b42d298"
}

variable "db_password" {
  description = "Database User Password"
  type        = string
  #sensitive   = true
default = "admin123"
}
variable "db_user" {
  description = "MongoDB database username"
  type        = string
}

variable "db_name" {
  description = "MongoDB database username"
  type        = string
default = "Database1"
}
variable "collection_name" {
  description = "MongoDB database username"
  type        = string
default = "collection1"
}


variable "resource_group_name" {
  type = string
}
variable "namespace_id" {
  description = "namespace_id"
  type        = string
}
variable "namespace_name" {
  type = string
}
variable "topic_names" {
  description = "List of topic names"
  type        = list(string)
}
variable "max_size_in_megabytes" {
  type = number
 default     = 1024
}
variable "default_message_ttl" {
  type    = string
  default = "P14D"
}

variable "subscription" {
  description = "List of subscription names"
  type        = list(string)
}















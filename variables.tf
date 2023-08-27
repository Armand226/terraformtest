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
  default     = ["vessel", "cololo", "tramadol"]
}
variable "max_size_in_megabytes" {
  type = number
 default     = 1024
}
variable "message_ttl" {
  type    = string
  default = "PT14H"
}















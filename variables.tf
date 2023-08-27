variable "topics" {
  description = "List of topic names"
  type        = list(string)
  default     = ["vessel", "cololo", "tramadol"]
}
variable "namespace_id" {
  description = "namespace_id"
  type        = string
}


variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "namespace_name" {
  type = string
}

variable "status" {
  type    = string
  default = "Active"
}


variable "default_message_ttl" {
  type    = string
  default = "PT14H"
}

variable "enable_batched_operations" {
  type    = string
  default = "false"
}

variable "enable_express" {
  type    = string
  default = "false"
}

variable "enable_partitioning" {
  type    = string
  default = "false"
}

variable "max_size_in_megabytes" {
  type = string
}

variable "requires_duplicate_detection" {
  type    = string
  default = "false"
}

variable "support_ordering" {
  type    = string
  default = "false"
}

variable "duplicate_detection_history_time_window" {
  type    = string
  default = "PT10M"
}

variable "listen" {
  type    = string
  default = "true"
}

variable "send" {
  type    = string
  default = "true"
}

variable "manage" {
  type    = string
  default = "false"
}




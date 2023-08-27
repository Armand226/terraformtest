variable "topics" {
  description = "List of topic names"
  type        = list(string)
  default     = ["vessel", "cololo", "tramadol"]
}
variable "namespace_id" {
  description = "namespace_id"
  type        = string
}



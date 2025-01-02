variable "bucket_name" {
  description = "The name of the S3 bucket for the website."
  type        = string
}

variable "source_directory" {
  description = "The local directory containing website files."
  type        = string
}

variable "tags" {
  description = "A map of tags to apply to resources."
  type        = map(string)
  default     = {}
}

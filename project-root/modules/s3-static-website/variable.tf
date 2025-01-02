variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
}

variable "index_document" {
  description = "The name of the index document."
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "The name of the error document."
  type        = string
  default     = "error.html"
}

variable "tags" {
  description = "A map of tags to apply to the bucket."
  type        = map(string)
  default     = {}
}

variable "source_directory" {
  description = "The local directory containing website files."
  type        = string
}

variable "region" {
  default = "ap-southeast-2"
}

variable "dns_names" {
  type    = "list"
  default = ["test.dev.example.com"]
}

variable "common_name" {
  type    = "string"
  default = "dev.example.com"
}

variable "email_address" {
  type    = "string"
  default = "someone@example.com"
}

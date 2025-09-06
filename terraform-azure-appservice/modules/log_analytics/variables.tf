variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "sku" { default = "PerGB2018" }
variable "retention_in_days" { default = 30 }
variable "tags" {
  type    = map(string)
  default = {}
}



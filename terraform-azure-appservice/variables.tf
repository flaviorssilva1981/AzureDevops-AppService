variable "resource_group" {}
variable "location" { default = "Central US" }
variable "asp_name" {}
variable "asp_sku" {}
variable "app_name" {}
variable "log_analytics_name" { default = null }
variable "app_insights_name" { default = null }
variable "tags" {
  type    = map(string)
  default = {}
}

variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "service_plan_id" {}
variable "runtime" {}
variable "app_settings" {
  type    = map(string)
  default = {}
}
variable "tags" {
  type = map(string)
}

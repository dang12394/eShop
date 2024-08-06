variable "DB_pwd" {
  description = "DB Password"
  sensitive = true
  type = string
}
variable "DB_connection_string" {
  sensitive = true
  type = string
}
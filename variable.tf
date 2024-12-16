variable "name" {
  type = string
}
output "ujwal" {
  value = "Say hello , ${var.name}"
}
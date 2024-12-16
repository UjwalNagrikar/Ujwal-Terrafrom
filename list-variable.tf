variable "name" {
  type = list(string)
  default = ["Ujwal", "Neha", "Tulsi"]
}

output "name" {
  value = "Hello, ${var.name[0]}, ${var.name[1]}, ${var.name[2]}"
}
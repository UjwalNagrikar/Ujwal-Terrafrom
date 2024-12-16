# Terraform Script with Multiple Variables
variable "name" {
  type = string
  default = "Ujwal"
}

variable "age" {
  type = number
  default = 19
}

variable "DOB" {
  type = string
  default = "30/11/2005"
}

output "name" {
  value = "Hello, ${var.name}"
}

output "age" {
  value = "You are ${var.age} years old"
}

output "DOB" {
  value = "Your date of birth is ${var.DOB}"
}

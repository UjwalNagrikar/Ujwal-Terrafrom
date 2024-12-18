# Variable for Name
variable "name" {
  description = "Name of the person"
  type        = string
}

# Variable for Age
variable "age" {
  description = "Age of the person"
  type        = number
  
}

# Output the information
output "person_info" {
  value = "Hello ${var.name}! You are ${var.age} years old."
}

output "age_in_months" {
  value = "That's approximately ${var.age * 12} months!"
}

output "strring_length" {
  value = length("Hello, World! ")
}
output "string_length" {
  value = length("Hello World") # 11
}

output "upper_case" {
  value = upper("terraform") # TERRAFORM
}

output "joined_string" {
  value = join(", ", ["Terraform", "AWS", "Linux"]) # Terraform, AWS, Linux
}

output "split_string" {
  value = split(", ", "Terraform, AWS, Linux") # ["Terraform", "AWS", "Linux"]
}

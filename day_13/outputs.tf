output "vpc_id" {
  value = aws_vpc.sample.id
}


output "ec2_id" {
  value = aws_instance.example.id
}

# List of all istance ids
output "instances" {
  value = local.all_instance_ids
}

output "ec2_instance_id" {
  value = aws_instance.ec2_instance.id
}

output "ec2_instance_public_ip" {
    value = aws_instance.ec2_instance.public_ip
  
}

output "ec2_instance_type" {
    value = aws_instance.ec2_instance.instance_type
  
}

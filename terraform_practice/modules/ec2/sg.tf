resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  description = "This security allows inbound and outbound to all ip addresses"
  vpc_id = "vpc-096fa7bbf4e7364b9"
  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 22
  ip_protocol = "tcp"
  to_port = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ssh_ipv4" {
    security_group_id = aws_security_group.allow_ssh.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
  
}
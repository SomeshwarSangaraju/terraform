resource "aws_instance" "example" {
  ami           = var.aws_instance
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow-all.id]

  tags = var.ec2_tags
}

resource "aws_security_group" "allow-all" {
  name   = "allow-all"
  description = "Security group that allows all inbound and outbound traffic"

  egress {
    from_port       = var.egress_from_port
    to_port         = var.egress_to_port
    protocol        = var.egress_protocol
    cidr_blocks      = var.egress_cidr_blocks 
  }

  ingress {
    from_port       = var.ingress_from_port
    to_port         = var.ingress_to_port
    protocol        = var.ingress_protocol
    cidr_blocks      = var.ingress_cidr_blocks
 }

  tags = {
    Name = "allow-all"
  }
}
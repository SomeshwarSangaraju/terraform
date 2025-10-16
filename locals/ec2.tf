resource "aws_instance" "terraform" {
  ami = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = locals.common_tags
}

resource "aws_security_group" "allow_all" {
  name   = "${local.common_name}-allow-all"

  egress {
    from_port        = 0 
    to_port          = 0 
    protocol         = "-1" 
    cidr_blocks      = ["0.0.0.0/0"] 
  }

  dynamic "ingress" {
    for_each = toset(var.ingress_ports)
    content {
      from_port        = [locals.ingress] 
      to_port          = [locals.ingress] 
      protocol         = "-1" 
      cidr_blocks      = ["0.0.0.0/0"] # internet
  }
  }
  

  tags = {
    Name = "allow-all"
  }

}
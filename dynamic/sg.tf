resource "aws_security_group" "roboshop-allow_all" {
  name   = "roboshop-dev-allow-all"

  egress {
    from_port        = 0 
    to_port          = 0 
    protocol         = "-1" 
    cidr_blocks      = ["0.0.0.0/0"] 
  }

  dynamic "ingress" {
    for_each = toset(var.ingress_ports)
    content {
      from_port        = ingress.value 
      to_port          = ingress.value 
      protocol         = "-1" 
      cidr_blocks      = ["0.0.0.0/0"] # internet
  }
  }
  

  tags = {
    Name = "allow-all"
  }

}
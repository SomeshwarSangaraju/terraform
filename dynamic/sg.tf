resource "aws_security_group" "allow_all" {
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
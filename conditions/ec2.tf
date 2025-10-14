resource "aws_instance" "terraform" {
  ami = "ami-09c813fb71547fc4f"
  instance_type = var.aws_instance_type == "dev" ? "t3.micro" : "t3.large"
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name = "terraform"
    terraform="true"
  }
}

resource "aws_security_group" "allow_all" {
  name   = "allow-all"

  egress {
    from_port        = 0 
    to_port          = 0 
    protocol         = "-1" 
    cidr_blocks      = ["0.0.0.0/0"] 
  }

  ingress {
    from_port        = 0 
    to_port          = 0 
    protocol         = "-1" 
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }

  tags = {
    Name = "allow-all"
  }

}
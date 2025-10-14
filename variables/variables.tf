variable "aws_instance" {
  type = String
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  type = String
  default = "t3.micro"
}

variable "ec2_tags" {
  type=map
  default={
    Name = "Terraform"
    Terraform = "true"
  }
}

variable "egress_from_port" {
  type = number
  default = 0
}

variable "egress_to_port" {
  type = number
  default = 0
}

variable "egress_protocol" {
  type = string
  default = "-1"
}

variable "egress_cidr_blocks" {
  type = list
  default = ["0.0.0.0/0"] 
}

variable "ingress_from_port" {
  type = number
  default = 0
}

variable "ingress_to_port" {
  type = number
  default = 0
}

variable "ingress_protocol" {
  type = string
  default = "-1"
}

variable "ingress_cidr_blocks" {
  type = list
  default =["0.0.0.0/0"] 
}

variable "sg_tags" {
  type=map
  default={
    Name = "allow-all"
  }
}

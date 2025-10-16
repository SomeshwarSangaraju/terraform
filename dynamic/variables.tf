variable "project"{
    default = "roboshop"
}

variable "environment" {
  default = "dev"
}


variable "common_tags" {
    type = map
    default = {
        Terraform = "true"
        Project = "roboshop"
        Environment = "dev"
    }
}

variable "ingress_ports" {
    default = [80,22,8080,22017, 6379]
}
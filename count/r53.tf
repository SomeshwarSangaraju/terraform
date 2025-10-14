resource "aws_route53_record" "roboshop" {
  count = 2
  zone_id = var.zone_id
  name    = "${var.ec2_instance_name[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.terraform[count.index].private_ip]
  allow_overwrite = true
}
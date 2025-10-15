# resource "aws_route53_record" "roboshop" {
#   for_each = aws_instance.terraform
#   zone_id = var.zone_id
#   name    = "${var.ec2_instance[each.value]}" == "frontend" ? "${var.domain_name}": "${var.ec2_instance[each.value]}.${var.domain_name}"
#   type    = "A"
#   ttl     = 1
#   records =   "${var.ec2_instance[each.value]}" == "frontend" ? [aws_instance.terraform[each.value].public_ip] :  [aws_instance.terraform[each.value].private_ip]
#   allow_overwrite = true
# }
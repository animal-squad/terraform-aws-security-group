resource "aws_security_group" "sg" {
  name_prefix = "${var.name_prefix}-sg"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.name_prefix}-sg"
  }
}

resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.sg.id
  description       = "default egress ec2"

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  tags = {
    Name = "${var.name_prefix}-egress-rule"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress" {
  for_each = var.ingress_rules

  security_group_id = aws_security_group.sg.id

  from_port                    = each.value.from_port
  to_port                      = each.value.to_port
  ip_protocol                  = each.value.ip_protocol
  cidr_ipv4                    = each.value.cidr_ipv4
  referenced_security_group_id = each.value.ref_sg_id

  tags = {
    Name = "${each.key}"
  }
}

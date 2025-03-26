moved {
  from = module.security_group.aws_security_group.sg_8080
  to   = module.web_security_group.aws_security_group.this[0]
}

moved {
  from = module.security_group.aws_security_group_rule.ingress_rule
  to   = module.web_security_group.aws_security_group_rule.ingress_with_cidr_blocks[0]
}

moved {
  from = module.security_group.aws_security_group_rule.egress_rule
  to   = module.web_security_group.aws_security_group_rule.egress_with_cidr_blocks[0]
}

moved {
  from = aws_instance.example
  to = module.ec2_instance.aws_instance.example
}

moved {
  from = module.vpc
  to   = module.learn_vpc
}

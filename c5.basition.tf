module "public_basition" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"
  name="public-basition-sg"
  description="the public secruity group"
  vpc_id    =module.vpc.vpc_id
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  #egress:
  egress_rules = ["all-all"] #port should be opened to all-all
  tags=local.common_tags

}


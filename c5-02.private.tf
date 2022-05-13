module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"
  name="private_sg"
  description="the public secruity group"
  vpc_id    =module.vpc.vpc_id
  ingress_rules       = ["ssh-tcp","http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  #egress:
  egress_rules = ["all-all"] #port should be opened to all-all
  tags=local.common_tags

}


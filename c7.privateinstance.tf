module "ec2_private" {
    depends_on = [ module.vpc ]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"
  # insert the 10 required variables here
  name                   = "${var.environment}-privateinstance"
  #instance_count         = 5

  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  user_data               =file("${path.module}/app.sh")
  instance_count          =var.private_instance_count
  vpc_security_group_ids = [module.private_sg.this_security_group_id]
  subnet_ids               =[
      module.vpc.private_subnets[0],
      module.vpc.private_subnets[1],
  ]
  tags=local.common_tags
}



#public

output "public_ids" {
  description = "List of IDs of instances"
  value       = module.ec2_public.id
}

output "instance_public_ip" {
  description = "Public DNS name assigned to the EC2 instance"
  value       = module.ec2_public.public_ip
}


#private:

output "private_ids" {
  description = "List of IDs of instances"
  value       = module.ec2_private.id
}

output "instance_private_ip" {
  description = "Public DNS name assigned to the EC2 instance"
  value       = module.ec2_private.private_ip
}
##########################################
## launch template
##########################################
output "lt_id" {
  value = module.lt_and_asg.launch_template_id
}
##########################################
## auto scaling group
##########################################
output "asg_name" {
  value = module.lt_and_asg.aws_autoscaling_id
}
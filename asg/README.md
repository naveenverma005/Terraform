## Launch Template & Auto Scaling Group

 - This terraform module will create a launch template and an auto scaling group.

## Usage

```
$   cat main.tf
/*-------------------------------------------------------*/
module "lt_and_asg" {
  # details for launch template
  source                 = "git::ssh://gitlab.com/ot-client/docasap/tf-modules/asg_lt"
  lt_name                = var.launch_template_name
  ami_id                 = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  lt_tags                = var.additional_tags
  iam_instance_profile = [{
    arn = var.iam_instance_profile_arn
  }]
  lt_description = var.lt_description
  user_data      = filebase64("../script.sh")

  # details for auto scaling group
  asg_name           = var.asg_name
  max_size           = var.max_size
  min_size           = var.min_size
  desired_capacity   = var.desired_capacity
  subnet_ids         = var.pvt_subnet_ids
  asg_tags           = var.additional_tags_asg
  target_group_arn   = var.target_group_arn
}
/*-------------------------------------------------------*/
```

````
$   cat outputs.tf
/*-------------------------------------------------------*/
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
/*-------------------------------------------------------*/
````

## Inputs

| Name  | Description | Type | Default | Required |
| ------------- | ------------- | ------------- | ------------- | ------------- | 
| lt_name  | The name of the launch template  | string  | null  | yes  | 
| lt_description  | Description of the launch template  | string  | null  | yes  |
| user_data  | The Base64-encoded user data to provide when launching the instance  | string  | null  | yes  |
| image_id  | The AMI from which to launch the instance  | string  | not null  | yes  | 
| instance_type  | The type of the instance  | string  | not null  | yes  | yes 
| key_name  | The key name to use for the instance  | string  | null  | yes  | yes
| vpc_security_group_ids  | A list of security group IDs to associate with  | list(string)  | not null  | yes  |
| iam_instance_profile  | The IAM Instance Profile to launch the instance with  | list(map(string))  | null  | yes  |
| target_group_arn  | A aws_alb_target_group ARNs, for use with Application Load Balancing  | string  | null  | yes  |
| lt_tags  | The tag associated with the launch template  | map(string)  | null  | yes  | 
| asg_name  | The name of auto scaling group  | string  | null  | yes  |  
| asg_tags  | The tag associated with auto scaling group | ist(map(string))  | null  | yes  | 
| max_size  | The maximum size of the Auto Scaling Group  | string  | not null  | yes  | 
| min_size  | The minimum size of the Auto Scaling Group  | string  | not null  | yes  | 
| desired_capacity  | The number of Amazon EC2 instances that should be running in the group  | string  | not null  | yes  |
| subnet_ids  | The list of subnet ids associated with the auto scaling group  | list(string)  | not null  | yes  |


##  Outputs

| Name  | Description |
| ------------- | ------------- |
| launch_template_id  | Id of launch template  |
| aws_autoscaling_id  | Id of autoscaling group |


### Note:
- **sample folder** is created for referring the values for the main, variable and output terraform files
- **propagate_at_launch** is part of the tag argument, it enables propagation of the tag to Amazon EC2 instances launched via 
  associated ASG, this value should be modified to add suitable tags to ec2 instances
  For Example:
  ````
  {
    key                 = "Owner"
    value               = "Siddharth Gupta"
    propagate_at_launch = true
    }, {
    key                 = "Location"
    value               = "Noida"
    propagate_at_launch = true
    },
    {
      key                 = "Create_By"
      value               = "Siddharth Gupta"
      propagate_at_launch = true
    },
    {
      key                 = "Reviewed_By"
      value               = "Rajat Vats"
      propagate_at_launch = true
    }
  ````
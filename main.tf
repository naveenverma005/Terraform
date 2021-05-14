module "security_group" {
  source      = "./security_group"
  sg_name     = var.sg_name
  vpc_id      = var.vpc_id
  sg_name_tag = var.sg_name_tag 
  sg_ingress  = [
    {
      description      = "For HTTPS request at port 443"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      self             = false
      security_groups  = []
    },
    {
      description      = "For HTTP request at port 80"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      self             = false
      security_groups  = []
    }
  ]

  sg_egress = [
    {
      description      = ""
      from_port        = 0
      to_port          = 0
      protocol         = -1
      cidr_blocks      = ["0.0.0.0/0"]
      self             = false
      security_groups  = []
    }
  ]
}

module "target_group_and_target_group_attachment" {
  source                = "./target_group"
  target_group_details  = var.target_group_details
  vpc_id                = var.vpc_id
  healthy_threshold     = var.healthy_threshold
  unhealthy_threshold   = var.unhealthy_threshold
  timeout               = var.timeout
  interval              = var.interval
  health_check_path     = var.health_check_path
  health_check_port     = var.health_check_port
  deregistration_delay  = var.deregistration_delay
  slow_start            = var.slow_start
  target_ids            = var.target_ids
  port                  = 80
}
  
module "alb_and_alb_listeners" {
  source                                = "./alb"
  alb_name                              = var.alb_name
  internal_alb                          = var.internal
  alb_security_groups_ids               = [module.security_group.sg_id]
  subnets_id                            = var.subnets_id
  enable_deletion_protection            = var.enable_deletion_protection
  drop_invalid_header_fields            = var.drop_invalid_header_fields
  idle_timeout                          = var.idle_timeout
  alb_tags                              = var.alb_tags
  alb_log_bucket                        = var.alb_log_bucket
  alb_enable_logging                    = var.alb_enable_logging
  prefix				= var.prefix
}


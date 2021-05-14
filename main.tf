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
  
  
module "alb_and_alb_listeners" {
  source                                = "./alb"
  alb_name                              = var.alb_name
  internal_alb                          = var.internal
  alb_security_groups_ids               = var.alb_security_groups_ids
  subnets_id                            = var.subnets_id
  enable_deletion_protection            = var.enable_deletion_protection
  drop_invalid_header_fields            = var.drop_invalid_header_fields
  idle_timeout                          = var.idle_timeout
  alb_tags                              = var.alb_tags
  alb_log_bucket                        = var.alb_log_bucket
  alb_enable_logging                    = var.alb_enable_logging
  prefix				= var.prefix
  listener_details                      = var.listener_details
}


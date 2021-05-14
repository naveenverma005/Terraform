#Variables for Security Group
variable "sg_name" {
  description = "Name of your Security Group"
  type        = string
  default     = "cfast-alb-sg"
}

variable "vpc_id" {
  description = "Give your vpc id here"
  type        = string
  default     = "vpc-0cef057e0494947e4"
}

variable "sg_name_tag" {
  description = "Tag name for your Security Group"
  type        = string
  default     = "cfast-alb-sg"
}

#Variables for TargetGroup
variable "target_group_details" {
  description = "Some essential details of TargetGroup"
  type        = map(any)
  default     = {
    target_group_name     = "cfast-tg"
    target_group_port     = 80
    target_group_protocol = "HTTP"
    target_type           = "instance"
  }
}

variable "healthy_threshold" {
  description = "Number of healthy thresold you want"
  type        = number
  default     = 2
}

variable "unhealthy_threshold" {
  description = "Number of Un-healthy thresold you want"
  type        = number
  default     = 2
}

variable "timeout" {
  description = "Give timeout duration"
  type        = number
  default     = 3
}

variable "interval" {
  description = "Interval"
  type        = number
  default     = 30
}

variable "health_check_path" {
  description = "Path to health-check"
  type        = string
  default     = "/"
}

variable "health_check_port" {
  description = "Port to health-check"
  type        = number
  default     = 80
}

variable "deregistration_delay" {
  description = "Amount time for Load Balancing to wait before changing the state of a deregistering target from draining to unused"
  type        = number
  default     = 90
}

variable "slow_start" {
  description = "Amount time for targets to warm up before the load balancer sends them a full share of requests"
  type        = number
  default     = 100
}

#Variable for TargetGroup attachment
variable "target_ids" {
  description = "This is the TargetID where TG will attach"
  type        = list(string)
  default     = ["i-079a809f81b11e89d"]
}

# Variables for ALB
variable "alb_name" {
  description = "Name for Load Balancer"
  type        = string
  default     = "cfast-alb"
}

variable "internal" {
  description = "Internal for Load Balancer"
  type        = bool
  default     = false
}

variable "enable_deletion_protection" {
  description = "Protection from deletion"
  type        = bool
  default     = false
}

variable "subnets_id" {
  description = "Give SubnetIDs"
  type        = list(string)
  default     = ["subnet-006613823c2f2ea4d", "subnet-0b31e117f6ea1bfa2"]
}

variable "alb_tags" {
  description = "Resource Tags"
  type        = map(string)
  default = {
    Name = "cfast-alb"
  }
}

variable "drop_invalid_header_fields" {
  description = "Indicates whether invalid header fields are dropped in application load balancers. Defaults to false."
  type        = bool
  default     = false
}

variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle."
  type        = number
  default     = 60
}

variable "alb_log_bucket" {
  description = "Bucket name for alb logs store"
  type        = string
  default     = "coinsfast"
}

variable "alb_enable_logging" {
  description = "Do you want to enable logging"
  type        = bool
  default     = true
}

variable "prefix" {
  description = "The S3 bucket prefix Logs are stored in the root if not configured"
  type        = string
  default     = "alb-logs"
}

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

# Variables for ALB
variable "alb_name" {
  description = "Name for Load Balancer"
  type        = string
  default     = "da-alb"
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

#Variables for ALB Listeners
variable "listener_details" {
  description = "List of some Listener details here"
  type        = map(any)
  default     = {
    forward_protocol = "HTTP"
    ssl_policy       = ""
    certificate_arn  = ""
  }
}


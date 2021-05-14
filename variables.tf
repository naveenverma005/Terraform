#Variables for Security Group
variable "sg_name" {
  description = "Name of your Security Group"
  type        = string
  default     = "cfast-alb-sg"
}

variable "vpc_id" {
  description = "Give your vpc id here"
  type        = string
  default     = "vpc-0cef057e0494947e"
}

variable "sg_name_tag" {
  description = "Tag name for your Security Group"
  type        = string
  default     = "cfast-alb-sg"
}

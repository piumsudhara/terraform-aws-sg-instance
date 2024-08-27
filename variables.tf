variable "region" {
  description = "The AWS region to deploy the security group"
  type        = string
  default     = "ap-southeast-1"
}

variable "name" {
  description = "The name of the security group"
  type        = string
  default     = "Test-Module-SG"
}

variable "description" {
  description = "A description of the security group"
  type        = string
  default     = "Test-Module-SG-DESC"
}

variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created"
  type        = string
}

variable "ingress_rules" {
  description = "A list of ingress rules"
  type = list(object(
    {
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
  }))
  default = [
    { from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }]
}

variable "egress_rules" {
  description = "A list of egress rules"
  type = list(object(
    {
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
  }))
  default = [
    { from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }]
}

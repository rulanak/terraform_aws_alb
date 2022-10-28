variable "env" {
  type        = string
  description = "environment"
  default     = "dev"
}
variable "app_port" {
  type    = number
  default = 80
}
variable "vpc_id" {
  type    = string
  default = "vpc-004e3b70d2f1935c0"
}
variable "subnets" {
  type    = list(string)
  default = ["subnet-0e1fc95d57b265357", "subnet-09fbf9fd737f39a8e"]
}
variable "instance_type" {
  type        = string
  description = "the size of EC2 instance"
  default     = "t2.micro"
}
variable "max_size" {
  type        = number
  description = "max size of instances"
  default     = 5
}
variable "min_size" {
  type        = number
  description = "min size of instances"
  default     = 2
}
variable "desired_capacity" {
  type        = number
  description = "desired capacity of instances"
  default     = 2
}
variable "force_delete" {
  type        = bool
  description = "if its true, it will delete ec2 if u delete asg. false - will no"
  default     = true

}
variable "vpc_zone_identifier" {
  type        = list(string)
  description = "subnets to create ec2 instance on"
  default     = ["subnet-0e1fc95d57b265357", "subnet-088fe1e66ac20f627"]
}
variable "ingress_ports" {
  type        = list(string)
  description = "list for ingress ports for sg"
  default     = ["443", "80"]
}
variable "ingress_cidrs" {
  type        = list(string)
  description = "cidrs for ingress ports"
  default     = ["0.0.0.0/0", "0.0.0.0/0"]
}

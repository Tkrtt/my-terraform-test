variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "ap-southeast-1"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "The availability zone for the subnet."
  type        = string
  default     = "ap-southeast-1a"
}

variable "route_cidr_block" {
  description = "The CIDR block for the route."
  type        = string
  default     = "0.0.0.0/0"
}

variable "ingress_ssh_from_port" {
  description = "SSH ingress from-port."
  type        = number
  default     = 22
}

variable "ingress_ssh_to_port" {
  description = "SSH ingress to-port."
  type        = number
  default     = 22
}

variable "ingress_ssh_protocol" {
  description = "SSH ingress protocol."
  type        = string
  default     = "tcp"
}

variable "ingress_ssh_cidr_blocks" {
  description = "SSH ingress CIDR blocks."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ingress_http_from_port" {
  description = "HTTP ingress from-port."
  type        = number
  default     = 80
}

variable "ingress_http_to_port" {
  description = "HTTP ingress to-port."
  type        = number
  default     = 80
}

variable "ingress_http_protocol" {
  description = "HTTP ingress protocol."
  type        = string
  default     = "tcp"
}

variable "ingress_http_cidr_blocks" {
  description = "HTTP ingress CIDR blocks."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_from_port" {
  description = "Egress from-port."
  type        = number
  default     = 0
}

variable "egress_to_port" {
  description = "Egress to-port"
  type        = number
  default     = 0
}

variable "egress_protocol" {
  description = "Egress protocol."
  type        = string
  default     = "-1"
}

variable "egress_cidr_blocks" {
  description = "Egress CIDR blocks."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ami_id" {
  description = "The ID of the AMI to use for the instance."
  type        = string
  default     = "ami-0d19aa82c9a61ef2c"  # Amazon Linux 2023 AMI
}

variable "instance_type" {
  description = "The instance type to use."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the key pair to use for the instance."
  type        = string
  default     = "my-key"
}

variable "instance_name" {
  description = "The name tag for the instance."
  type        = string
  default     = "Test-Web-Server"
}

variable "db_allocated_storage" {
  description = "The allocated storage for the RDS instance."
  type        = number
  default     = 20
}

variable "db_engine" {
  description = "The database engine to use."
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "The version of the database engine."
  type        = string
  default     = "5.7"
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance."
  type        = string
  default     = "db.t2.micro"
}

variable "db_name" {
  description = "The name of the database."
  type        = string
  default     = "mydb"
}

variable "db_parameter_group_name" {
  description = "The parameter group name for the RDS instance."
  type        = string
  default     = "default.mysql5.7"
}

variable "db_skip_final_snapshot" {
  description = "Whether to skip the final snapshot when deleting the RDS instance."
  type        = bool
  default     = true
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group."
  type        = string
  default     = "main"
}

variable "db_subnet_group_tag" {
  description = "The tag name for the DB subnet group."
  type        = string
  default     = "Main"
}
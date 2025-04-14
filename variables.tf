# Template Variables
variable "tf_var" {
  description = "This variable is used in the terraform template"
  type        = string
  default     = "I am a variable"
}

# Network variables
variable "vpc_cidr" {
  description = "The cidr block range of IP addresses for the virtual private cloud"
  type        = string
  default     = "192.0.0.0/16"
}

variable "subnet_cidr" {
  description = "The cidr block range of IP addresses for the subnet"
  type        = string
  default     = "192.0.0.0/24"
}

variable "aws_availability_zone" {
  description = "The availability zone within the provider region the resources will be running, e.g. eu-west-1a and ap-southeast-1b"
  type        = string
}

# Instance variables
variable "key_name" {
  description = "The name of the AWS key pair resource"
  type        = string
}

variable "pub_key_file_path" {
  description = "Path to the public key file on the system"
  type        = string
}

variable "pri_key_file_path" {
  description = "Path to the private key file on the system"
  type        = string
}

variable "ssh_connection_user" {
  description = "The default SSH user used for the connection, determined by the AMI selected"
  type        = string
}

variable "single_instance_type" {
  description = "The size used by the single instance"
  type        = string
  default     = "t2.medium"
}

# General variables
variable "aws_region" {
  description = "AWS region to use"
  type        = string
  default     = "eu-west-2"
}

variable "project_tag" {
  description = "The tag for the name/id of the project the resource is associated with. Can also be used in the name of resources"
  type        = string
}

variable "owner_tag" {
  description = "Owner tag applied to all resources"
  type        = string
}

variable "environment_tag" {
  description = "Environment tag applied to all resources"
  type        = string
  default     = "DEV"
}

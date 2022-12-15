terraform {
  required_version = ">= 1.3.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.46.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Project     = var.project_tag
      Owner       = var.owner_tag
      Environment = var.environment_tag
      ManagedBy   = "Terraform"
    }
  }
}

# Data section
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"] # Canonical

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

# Network section
module "aws_core_network" {
  source = "git@github.com:matt-terraform-modules/terraform-aws-core-network.git?ref=v3.0.1"

  aws_core_vpc_cidr    = var.vpc_cidr
  aws_core_subnet_cidr = var.subnet_cidr
  aws_core_az          = var.aws_availability_zone
  map_public_ip        = true

  project_tag = var.project_tag
}

# Instance Section
resource "aws_key_pair" "aws_keypair" {
  key_name   = var.key_name
  public_key = file(var.pub_key_file_path)
}

resource "aws_instance" "single_instance" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.single_instance_type
  subnet_id              = module.aws_core_network.aws_subnet_id
  vpc_security_group_ids = [module.aws_core_network.aws_sg_id]
  key_name               = aws_key_pair.aws_keypair.key_name

  user_data = templatefile("${path.module}/templates/template.tftpl", {
    tf_var = var.tf_var
  })

  connection {
    host        = self.public_ip
    type        = "ssh"
    user        = var.ssh_connection_user
    private_key = file(var.pri_key_file_path)
  }

  # Copying entire directory
  provisioner "file" {
    source      = "${path.module}/scripts"
    destination = "/tmp/"
  }

  ## Recursive changing of permissions to executables
  provisioner "remote-exec" {
    inline = [
      "chmod -R 755 /tmp/scripts/",
    ]
  }

  tags = {
    Name = "${var.project_tag}_AWS_INSTANCE"
  }
}

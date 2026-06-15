variable "project_name" {
  description = "Project name prefix for AWS resources"
  type        = string
  default     = "app-translator"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "Optional custom S3 bucket name (must be globally unique)"
  type        = string
  default     = ""
}

variable "github_org" {
  description = "GitHub organization or username"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
  default     = "app-translator"
}

variable "ec2_instance_type" {
  description = "EC2 instance type for backend"
  type        = string
  default     = "t2.micro"
}

variable "ec2_key_name" {
  description = "Existing EC2 key pair name for SSH access"
  type        = string
  default     = ""
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into EC2"
  type        = string
  default     = "0.0.0.0/0"
}

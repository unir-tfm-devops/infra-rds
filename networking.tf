module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.0"

  name = "rds-vpc"
  cidr = "10.2.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.2.1.0/24", "10.2.2.0/24"]
  public_subnets  = ["10.2.101.0/24", "10.2.102.0/24"]

  map_public_ip_on_launch = true

  enable_nat_gateway = false
  single_nat_gateway = false

  tags = {
    Terraform = "true"
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name = "RDS subnet group"
  }
}

resource "aws_security_group" "postgres_sg" {
  name        = "postgres-sg"
  description = "Allow PostgreSQL access"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow PostgreSQL from my IP"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Only for testing purposes
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "PostgreSQL SG"
  }
} 
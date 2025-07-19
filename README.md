# AWS RDS Infrastructure with PostgreSQL

This repository contains Terraform configurations for managing AWS RDS instances and PostgreSQL databases. It provides a complete infrastructure setup for both test and production environments.

## 🏗️ Infrastructure Overview

This Terraform project manages:

- **AWS RDS Instances**: PostgreSQL 16.8 instances for test and production environments
- **VPC & Networking**: Custom VPC with public subnets and security groups
- **Database Management**: Automated database and user creation using PostgreSQL provider
- **Multi-Environment Support**: Separate configurations for test and production

## 📁 Project Structure

```
infra-rds/
├── main.tf                 # RDS instances configuration
├── networking.tf           # VPC, subnets, and security groups
├── providers.tf            # AWS and PostgreSQL provider configurations
├── outputs.tf              # Output values for endpoints
├── databases-test.tf       # Test environment databases
├── databases-prod.tf       # Production environment databases
├── backend.tf              # Terraform backend configuration
└── modules/
    └── database/
        ├── main.tf         # Database and user creation logic
        ├── variables.tf    # Module input variables
        ├── outputs.tf      # Module output values
        └── versions.tf     # Module version constraints
```

## 🚀 Features

### RDS Instances
- **PostgreSQL 16.8** engine
- **db.t3.micro** instance class (suitable for development/testing)
- **20GB** allocated storage
- **Public accessibility** enabled for development purposes
- **Multi-AZ** disabled (can be enabled for production)

### Networking
- Custom VPC with CIDR `10.2.0.0/16`
- Public subnets across 2 availability zones
- Security group allowing PostgreSQL access (port 5432)
- RDS subnet group for database placement

### Database Management
- Automated database creation
- User/role creation with proper permissions
- Schema-level privileges management
- Support for multiple databases per environment

## 🔧 Prerequisites

- **Terraform** >= 1.0
- **AWS CLI** configured with appropriate credentials
- **PostgreSQL provider** for Terraform

## 📋 Requirements

### AWS Requirements
- AWS account with appropriate permissions for:
  - RDS instance creation and management
  - VPC and networking resources
  - Security groups and subnet groups

### Terraform Providers
- `hashicorp/aws` - AWS provider
- `cyrilgdn/postgresql` - PostgreSQL provider

## 🚀 Quick Start

### 1. Initialize Terraform
```bash
terraform init
```

### 2. Review the Plan
```bash
terraform plan
```

### 3. Apply the Configuration
```bash
terraform apply
```

### 4. Access Database Endpoints
After successful deployment, you can retrieve the database endpoints:
```bash
terraform output rds_test_endpoint
terraform output rds_prod_endpoint
```

## 🔐 Security Considerations

⚠️ **Important Security Notes:**

- **Public Accessibility**: RDS instances are configured with `publicly_accessible = true` for development purposes
- **Security Group**: Currently allows access from `0.0.0.0/0` (all IPs) - **NOT recommended for production**
- **Default Credentials**: Uses default PostgreSQL credentials - **change for production use**

### Production Security Recommendations

1. **Disable Public Access**: Set `publicly_accessible = false`
2. **Restrict Security Group**: Limit CIDR blocks to specific IP ranges
3. **Use Secrets Management**: Store database credentials in AWS Secrets Manager
4. **Enable Encryption**: Enable RDS encryption at rest
5. **Enable Monitoring**: Set up CloudWatch monitoring
6. **Use Strong Passwords**: Implement proper password policies

## 🔄 Module Usage

The `modules/database` module can be used to create additional databases:

```hcl
module "my_database" {
  source = "./modules/database"

  database_name = "my-app-db"
  username      = "my-app-user"
  password      = "secure-password"

  providers = {
    postgresql = postgresql.test  # or postgresql.prod
  }
}
```

## 📊 Outputs

| Output | Description |
|--------|-------------|
| `rds_test_endpoint` | Test RDS instance endpoint |
| `rds_prod_endpoint` | Production RDS instance endpoint |

## 🧹 Cleanup

To destroy all resources:
```bash
terraform destroy
```

⚠️ **Warning**: This will permanently delete all RDS instances and their data.

## 🔧 Customization

### Instance Configuration
Modify `main.tf` to adjust:
- Instance class (`db.t3.micro`)
- Storage size (`allocated_storage`)
- Engine version
- Multi-AZ settings

### Networking
Modify `networking.tf` to adjust:
- VPC CIDR block
- Subnet configurations
- Security group rules

### Database Creation
Modify `databases-test.tf` and `databases-prod.tf` to:
- Add new databases
- Change database names
- Modify user credentials

## 📝 Notes

- **Wait Time**: A 30-second wait is configured after RDS creation to ensure instances are fully available
- **Dependencies**: Database modules depend on RDS instances being ready
- **Provider Aliases**: Separate PostgreSQL providers are used for test and production environments

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with `terraform plan`
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

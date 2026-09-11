# Terraform AWS Web Server 🚀

A small Terraform project that provisions a complete AWS environment for hosting a simple Nginx web server.

The entire infrastructure is created and managed using Terraform.

## 🏗️ Architecture

```text
                    Internet
                       │
                       ▼
              Internet Gateway
                       │
                       ▼
                  Route Table
                  0.0.0.0/0
                       │
                       ▼
                    Subnet
                       │
                       ▼
               Security Group
                 │       │
               :80      :22
                 │       │
                 └───┬───┘
                     ▼
                    EC2
                     │
                   Nginx
                     │
                     ▼
            Hello from Terraform
```

## ☁️ AWS Resources

This project creates the following resources:

* **VPC**
* **Public Subnet**
* **Internet Gateway**
* **Route Table**
* **Route**
* **Route Table Association**
* **Security Group**
* **EC2 Instance**
* **Nginx Web Server**

## 📁 Project Structure

```text
terraform-web-server/
│
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── user_data.sh
└── .gitignore
```

### `main.tf`

Contains the main AWS infrastructure resources.

### `variables.tf`

Defines configurable Terraform variables such as:

* AWS region
* VPC CIDR
* Subnet CIDR
* Availability Zone
* EC2 instance type

### `terraform.tfvars`

Contains the values assigned to the Terraform variables.

### `outputs.tf`

Outputs useful information after deployment:

* EC2 instance ID
* Public IP
* Website URL

### `user_data.sh`

Runs when the EC2 instance starts for the first time.

It:

1. Updates Ubuntu packages
2. Installs Nginx
3. Starts Nginx
4. Enables Nginx
5. Creates a simple web page

The page displays:

```text
Hello from Terraform 🚀
```

## 🔐 Security Group

The EC2 instance uses a security group with:

| Protocol | Port | Source      | Purpose          |
| -------- | ---: | ----------- | ---------------- |
| TCP      |   80 | `0.0.0.0/0` | HTTP             |
| TCP      |   22 | `0.0.0.0/0` | SSH              |
| All      |  All | `0.0.0.0/0` | Outbound traffic |

> **Note:** SSH from `0.0.0.0/0` is acceptable for this learning project, but is not recommended for production. In a real environment, restrict SSH to a trusted IP or use a more secure access method.

## 🚀 Deployment

### 1. Clone the repository

```bash
git clone <repository-url>
cd terraform-web-server
```

### 2. Configure AWS credentials

Make sure your AWS credentials are configured through the AWS CLI or another supported authentication method.

For example:

```bash
aws configure
```

Do **not** put AWS access keys or secret keys directly inside Terraform files.

### 3. Configure variables

Update `terraform.tfvars`:

```hcl
aws_region       
vpc_cidr         
subnet_cidr      
availability_zone
instance_type    
```

Use an Ubuntu AMI that is valid for your selected AWS region.

### 4. Run Terraform Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

Type:

```text
yes
```

when Terraform asks for confirmation.

### 8. Access the web server

After deployment, Terraform will output:

```text
instance_id = "..."
public_ip   = "..."
website_url = "http://..."
```

Open the `website_url` in a browser.

You should see:

```text
Hello from Terraform 🚀
```

## 🧹 Destroy the Infrastructure

When you're finished:

```bash
terraform destroy
```

This removes the AWS resources created by Terraform.

## 🧠 Terraform Concepts Practiced

This project covers several fundamental Terraform concepts:

* AWS provider configuration
* Terraform variables
* Terraform outputs
* VPC networking
* Subnets
* Internet Gateways
* Route Tables
* Routes
* Route Table Associations
* Security Groups
* EC2 instances
* EC2 `user_data`
* Terraform commands

# Multi-Tier Private Cloud with Bastion Host and Load Balancer

## Project Overview

This project establishes a secure and scalable cloud infrastructure utilizing AWS services. It employs Terraform to provision and manage resources within a Virtual Private Cloud (VPC) that features both public and private subnets. The architecture comprises EC2 instances, a NAT Gateway, a Bastion Host, and a Load Balancer to ensure high availability and fault tolerance.

## Project Structure

├── main.tf
├── modules
│   ├── EC2
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── IG
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── KeyPair
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── LoadBalancer
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── NAT
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── RouteTable
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── SecurityGroup
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── Subnet
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── VPC
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
└── variables.tf


## Key Components

### 1. **VPC (Virtual Private Cloud)**
   - Creates a secure and isolated environment for your resources.

### 2. **Internet Gateway (IGW)**
   - Links the VPC to the internet, allowing resources in public subnets to connect to the internet.

### 3. **Public Subnets**
   - Two public subnets are established with a corresponding public route table.
   - These subnets host internet-facing resources, such as the Bastion Host.

### 4. **Private Subnets**
   - Two private subnets are created with a private route table.
   - These subnets are insulated from direct internet access but can reach the internet through the NAT Gateway.
   - Nginx EC2 instances reside here.

### 5. **Route Tables**
   - **Public Route Table**: Manages traffic routing from the public subnets to the Internet Gateway.
   - **Private Route Table**: Directs traffic within the VPC and towards the NAT Gateway for internet access from private subnets.

### 6. **NAT Gateway**
   - Enables instances in private subnets to access the internet for updates and maintenance.
   - It utilizes an Elastic IP for public connectivity.

### 7. **Elastic IP**
   - Assigns a static public IP address to the NAT Gateway, ensuring stable internet access.

### 8. **Security Groups**
   - Function as virtual firewalls regulating inbound and outbound traffic for instances.
   - Distinct security groups are created for the Bastion Host, Nginx servers, and the Load Balancer.

### 9. **Bastion Host**
   - A single EC2 instance in the public subnet that acts as a secure entry point (SSH jump box) for managing private instances.
   - Facilitates secure SSH connections to Nginx servers in private subnets.

### 10. **Nginx Instances**
   - Two EC2 instances running Nginx, located in private subnets.
   - These instances manage web traffic but are not accessible directly from the internet.
   - They connect to the Load Balancer for high availability.

### 11. **Load Balancer**
   - Distributes incoming traffic across the Nginx instances, providing high availability, fault tolerance, and scalability.

## Architecture Diagram

![Architecture Diagram](https://github.com/hadeer-tsu/Multi_Tier_AWS_Cloud_with_Bastion_Host/raw/main/Screenshots/project.jpeg)

## Connection Instructions

1. **SSH to the Bastion Host**: 
   - Securely connect to the private Nginx servers through the Bastion Host.
   
2. **Access Nginx Servers**:
   - After connecting to the Bastion Host, you can SSH into the Nginx servers in the private subnets for management tasks.

## Advantages

- **Security**: 
   - Private subnets safeguard sensitive resources.
   - The NAT Gateway limits outbound internet access for private instances while allowing necessary updates.
   
- **Scalability**:
   - Additional Nginx instances can be added to the private subnets, with the Load Balancer automatically managing traffic distribution.

- **Manageability**:
   - The Bastion Host enables secure management of private instances without exposing them to the internet.

## Getting Started

### 1. **Install Terraform**
   - Download Terraform from [Terraform Downloads](https://www.terraform.io/downloads).

### 2. **Configure AWS Credentials**
   - Ensure that your AWS credentials are set up correctly on your machine.

### 3. **Examine the Terraform Code**
   - Review the modules and configuration files to understand how each component is deployed.

### 4. **Set Variable Values**
   - Modify `terraform.tfvars` with appropriate parameters like project name, AMI ID, and instance types.

### 5. **Initialize the Project**
   - Run `terraform init` to set up the Terraform project.

### 6. **Plan the Infrastructure**
   - Execute `terraform plan` to see a preview of the infrastructure changes.

### 7. **Deploy the Infrastructure**
   - Run `terraform apply` to provision the infrastructure on AWS.

## Screenshots
![Screenshot 1](https://github.com/hadeer-tsu/Multi_Tier_AWS_Cloud_with_Bastion_Host/raw/main/Screenshots/1.png)
![Screenshot 2](https://github.com/hadeer-tsu/Multi_Tier_AWS_Cloud_with_Bastion_Host/raw/main/Screenshots/2.png)
![Screenshot 3](https://github.com/hadeer-tsu/Multi_Tier_AWS_Cloud_with_Bastion_Host/raw/main/Screenshots/3.png)
![Screenshot 4](https://github.com/hadeer-tsu/Multi_Tier_AWS_Cloud_with_Bastion_Host/raw/main/Screenshots/4.png)
![Screenshot 5](https://github.com/hadeer-tsu/Multi_Tier_AWS_Cloud_with_Bastion_Host/raw/main/Screenshots/5.png)
![Screenshot 6](https://github.com/hadeer-tsu/Multi_Tier_AWS_Cloud_with_Bastion_Host/raw/main/Screenshots/6.png)
![Screenshot 7](https://github.com/hadeer-tsu/Multi_Tier_AWS_Cloud_with_Bastion_Host/raw/main/Screenshots/7.png)
![Screenshot 8](https://github.com/hadeer-tsu/Multi_Tier_AWS_Cloud_with_Bastion_Host/raw/main/Screenshots/8.png)
![Screenshot 9](https://github.com/hadeer-tsu/Multi_Tier_AWS_Cloud_with_Bastion_Host/raw/main/Screenshots/9.png)
![Screenshot 10](https://github.com/hadeer-tsu/Multi_Tier_AWS_Cloud_with_Bastion_Host/raw/main/Screenshots/10.png)
![Screenshot 11](https://github.com/hadeer-tsu/Multi_Tier_AWS_Cloud_with_Bastion_Host/raw/main/Screenshots/11.png)
![Screenshot 12](https://github.com/hadeer-tsu/Multi_Tier_AWS_Cloud_with_Bastion_Host/raw/main/Screenshots/12.png)

## Conclusion

This configuration creates a highly secure, scalable, and efficient cloud environment. By leveraging AWS services like EC2, VPC, NAT Gateway, and Load Balancer, the project ensures high availability and fault tolerance for web applications while protecting sensitive instances in private subnets.

### Additional Notes:
- Adhere to security best practices, such as using strong passwords and implementing proper access controls.
- Customize the setup to align with your specific project needs.


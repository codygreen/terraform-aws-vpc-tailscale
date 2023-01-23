# terraform-aws-vpc-tailscale

Creates an AWS VPC with a Tailscale jumphost.  The  jumphost leverages Tailscale SSH.

## Terraform Variables

| Variable  | Description  |
|---|---|
| aws_access_key | AWS access key |
| aws_secret_key | AWS secret key |
| instance_type  |  EC2 instance type |
| key_name | EC2 Key Pair name  |
| owner_name  | Name of user deploying Terraform - for AWS resource tagging  |
| owner_email | Email of user deploying Terraform - for AWS resource tagging |
| region  | AWS region resources will be deployed into  |
| tailscale_auth_key | Tailscale Auth key to authenticate EC2 instances to your tailscale environment |

## Usage

```bash
terraform apply
```

## Terraform Output

| Variable  | Description  |
|---|---|
| instance_ip_addr | EC2 instance private IP address |
| instance_name | EC2 instance hostname (used for SSH) |

# Connect to Jumphost

```bash
ssh instance_name -u ubuntu
```

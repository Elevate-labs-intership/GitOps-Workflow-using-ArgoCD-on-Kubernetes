module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "StackOpsVpc"
  cidr = "172.0.0.0/16"

  azs             = [var.zone1, var.zone2, var.zone3]
  private_subnets = ["172.0.1.0/24", "172.0.2.0/24", "172.0.3.0/24"]
  public_subnets  = ["172.0.101.0/24", "172.0.102.0/24", "172.0.103.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

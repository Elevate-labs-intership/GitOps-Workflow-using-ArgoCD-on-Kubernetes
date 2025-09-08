resource "aws_security_group" "K8-s_cluster" {
  name        = "K8-s_cluster"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "Kubernetes Cluster Security Group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "SSH" {
  security_group_id = aws_security_group.K8-s_cluster.id
  cidr_ipv4         = "122.161.52.133/32" # Allow SSH from a specific IP (restrict this in production)
  description       = "Allow SSH access"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_ingress_rule" "ArgoCD" {
  security_group_id = aws_security_group.K8-s_cluster.id
  cidr_ipv4         = "0.0.0.0/0" # Allow SSH from a specific IP (restrict this in production)
  description       = "Allow ArgoCD access"
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}
resource "aws_vpc_security_group_ingress_rule" "argoCD" {
  security_group_id = aws_security_group.K8-s_cluster.id
  cidr_ipv4         = "0.0.0.0/0" # Allow SSH from a specific IP (restrict this in production)
  description       = "Allow ArgoCD access"
  from_port         = 8443
  ip_protocol       = "tcp"
  to_port           = 8443
}
resource "aws_vpc_security_group_ingress_rule" "Prometheus" {
  security_group_id = aws_security_group.K8-s_cluster.id
  cidr_ipv4         = "122.161.50.249/32" # Allow SSH from a specific IP (restrict this in production)
  description       = "Allow Prometheus access"
  from_port         = 9090
  ip_protocol       = "tcp"
  to_port           = 9090
}
resource "aws_vpc_security_group_ingress_rule" "Grafana" {
  security_group_id = aws_security_group.K8-s_cluster.id
  cidr_ipv4         = "122.161.50.249/32" # Allow SSH from a specific IP (restrict this in production)
  description       = "Allow Grafana access"
  from_port         = 3000
  ip_protocol       = "tcp"
  to_port           = 3000
}
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.K8-s_cluster.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.K8-s_cluster.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

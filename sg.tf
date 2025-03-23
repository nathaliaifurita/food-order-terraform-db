resource "aws_security_group" "sg" {
  name        = "SG-${var.rds_postgres}"
  description = "Security Group do Food Order DB"
  vpc_id = local.vpc_id

  # Inbound
  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
  }

  # Outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
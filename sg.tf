resource "aws_security_group" "sg" {
  name        = "SG-${var.rds_postgres}"
  description = "Security Group do Food Order DB"
  vpc_id      = aws_vpc.main_vpc.id

  # Inbound
  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.sg.id]  # Permite acesso apenas do EKS
  }

  # Outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
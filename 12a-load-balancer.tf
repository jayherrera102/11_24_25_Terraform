resource "aws_lb" "web_server" {
  name               = "web-server-app-lb"
  internal           = false
  load_balancer_type = "application"
  # using HTTP/S = application LB
  security_groups    = [aws_security_group.web_server.id]
  subnets            = [aws_subnet.public_a.id,
                        aws_subnet.public_b.id,
                        aws_subnet.public_c.id]

  # IMPORTANT
  enable_deletion_protection = false

  tags = {
    Name = "web-server-app-lb"
  }
}
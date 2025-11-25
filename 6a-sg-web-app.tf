# resource "aws_security_group" "web_server" {
#   name        = "web_server"
#   description = "Allow inbound traffic and all outbound traffic to main"
#   vpc_id      = aws_vpc.main.id

#   tags = {
#     Name = "web_server"
#   }
# }



# resource "aws_vpc_security_group_ingress_rule" "checked_out_allow_http" {
#     security_group_id =  aws_security_group.web_server.id
#     # ALB SG ID goes here (ALB is the source of HTTP traffic for web apps)
#     # referenced_security_group_id = aws_security_group.web_server.id
#     from_port      = 80
#     ip_protocol    = "tcp"
#     to_port        = 80
#     cidr_ipv4      = "0.0.0.0/0"
# }

# resource "aws_vpc_security_group_ingress_rule" "incoming_ssh" {
#     security_group_id    = aws_security_group.web_server.id
#     cidr_ipv4            = "0.0.0.0/0"
#     from_port            = 22
#     ip_protocol          = "tcp"
#     to_port              = 22 
# }

# resource "aws_vpc_security_group_egress_rule" "all_traffic_ipv4" {
#     security_group_id    = aws_security_group.web_server.id
#     cidr_ipv4            = "0.0.0.0/0"
#     ip_protocol          = "-1" #semantically equivalent to all ports
# }


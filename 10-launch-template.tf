resource "aws_launch_template" "web_server" {
  name = "web-app-template"
  description = "launch template for the web tier's apps"
  image_id = "ami-0c5f78ca5e1169a1a"
  instance_type = "t3.micro"
  # key_name = 
  vpc_security_group_ids = [aws_security_group.web_server.id]
  
#   network_interfaces {
#     security_groups = [ aws_security_group.web_server.id ]
#   }

  user_data = filebase64("./user_data.sh")

  tag_specifications {
    resource_type = "instance"
    tags = {
      ManagedBy = "terraform"
    }
  }


  
}



# name
# description
# ami
# instance type
# key
# SG
# user data
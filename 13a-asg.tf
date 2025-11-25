resource "aws_autoscaling_group" "web_server" {
  vpc_zone_identifier = [ aws_subnet.private_a.id,
                          aws_subnet.private_b.id,
                          aws_subnet.private_c.id ]
  # not an idealy argument for dynamic scaling 
  desired_capacity   = 3
  max_size           = 6
  min_size           = 1

  # shorten values for demo purposes (optional)
  #default_cooldown   = 60
  #default_instance_warmup = 60
  health_check_grace_period = 300

  # where is the asg health check config from (for autohealing)
  health_check_type = "ELB"

  force_delete = true 

  target_group_arns = [ aws_lb_target_group.web_server.arn ]

  # using latest rather than default version for simplicity 
  launch_template {
    id      = aws_launch_template.web_server.id
    version = "$Latest"
  }

  # tags for instances created by ASG
  tag {
    key = "Name"
    value = "web-app"
    propagate_at_launch = true
  }
}
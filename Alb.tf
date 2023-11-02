# Create a target group
resource "aws_lb_target_group" "alb-target-group4" {
  name     = "application-lb-tg4"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.Group4Project.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 10
    matcher             = 200
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 6
    unhealthy_threshold = 3
  }
}

# Attach the target group to the AWS instances
resource "aws_lb_target_group_attachment" "attach-app1" {
  target_group_arn = aws_lb_target_group.alb-target-group4.arn
  target_id        = aws_instance.ec2-1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "attach-app2" {
  target_group_arn = aws_lb_target_group.alb-target-group4.arn
  target_id        = aws_instance.ec2-2.id
  port             = 80
}

# Create a listener for load balancer
resource "aws_lb_listener" "alb-http-listener4" {
    load_balancer_arn = aws_lb.application-lb4.arn
    port              = "80"
    protocol          = "HTTP"
  
    default_action {
      type             = "forward"
      target_group_arn = aws_lb_target_group.alb-target-group4.arn
    }
  }

# Create the load balancer
resource "aws_lb" "application-lb4" {
  name               = "application-lb4"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.G4-lb.id]
  subnets            = ["${aws_subnet.PublicSubnet1.id }", "${aws_subnet.PublicSubnet2.id }"]

  enable_deletion_protection = false

  tags = {
    Environment = "application-lb"
    Name        = "Application-lb4"
    
  }
}
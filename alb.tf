#Public ALB
resource "aws_lb" "my-alb-wp" {
  name               = var.alb_name
  load_balancer_type = var.alb_type
  subnets            = [aws_subnet.public-subnet-1a.id, aws_subnet.public-subnet-2b.id]
  security_groups    = [aws_security_group.default.id]

}

#ALB Listners for default 80 port
resource "aws_lb_listener" "my-alb-wp" {
  load_balancer_arn = aws_lb.my-alb-wp.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

#ALB Listners for default 443 port
resource "aws_lb_listener" "my-alb-wp-443" {
  load_balancer_arn = aws_lb.my-alb-wp.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = "arn:aws:acm:ap-south-1:442243664163:certificate/57bc0369-fbf6-4a0a-91db-4faa9b78fea6"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Access Denied"
      status_code  = "503"
    }
  }
}

#ALB Listners for hostheader in 443 port
resource "aws_lb_listener_rule" "host-listner" {
    listener_arn = aws_lb_listener.my-alb-wp-443.arn
    priority     = 1

    action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my-wp-tg.arn
    
    }

    condition {
    host_header {
      values = ["londonbucks.com"]
    }
    }

    tags = {
      "Name" = "wordpress"
    }

}

#Target Group
resource "aws_lb_target_group" "my-wp-tg" {
  name     = var.tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my-vpc.id
}
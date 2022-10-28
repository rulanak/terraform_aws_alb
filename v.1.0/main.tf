// target group SG ElasticLB ListenerRule

resource "aws_lb_target_group" "main" {
  name     = "${var.env}-tg"
  port     = var.app_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path = "/"
    port = var.app_port //better to use locals 
  }
  tags = {
    Name = "${var.env}-tg"
  }
}

resource "aws_lb" "main" {
  name               = "${var.env}-alb"
  internal           = false //means public 
  load_balancer_type = "application"
  security_groups    = [aws_security_group.main.id]
  subnets            = var.subnets
  tags = {
    Name = "${var.env}-alb"
  }
}
resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.app_port
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}
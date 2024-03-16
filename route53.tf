#Public DNS
resource "aws_route53_zone" "public" {
    name = var.domain
}

#DNS Records
resource "aws_route53_record" "name" {
    zone_id = aws_route53_zone.public.zone_id
    name = var.domain
    type = "CNAME"
    records = [aws_lb.my-alb-wp.dns_name]

}
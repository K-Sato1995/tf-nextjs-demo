data "aws_route53_zone" "dns_zone" {
  name = "shohey-time.com"
}
 
resource "aws_route53_record" "dns_record" {
  zone_id = data.aws_route53_zone.dns_zone.zone_id
  name    = "shohey-time.com"
  type    = "A"
  ttl     = 300
  records = ["76.76.21.21"] // Vercelから指定されたIPアドレス
}

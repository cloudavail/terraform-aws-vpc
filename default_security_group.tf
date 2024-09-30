# we include a aws_default_security_group resource to remove all egress/ingress configuration
# this is per https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-2
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.vpc.id
}

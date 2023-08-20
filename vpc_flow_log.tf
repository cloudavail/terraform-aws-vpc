resource "aws_cloudwatch_log_group" "vpc_flow_logs_cloudwatch_log_group" {
  name              = "${var.vpc_name}-vpc-flow-logs"
  retention_in_days = var.vpc_flow_log_retention_in_days
  tags = {
    Name = "${var.vpc_name}-vpc-flow-logs"
  }
}

# the policy document below is taken from
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log.html
data "aws_iam_policy_document" "vpc_flow_logs_iam_assume_role_iam_policy_document" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

# the policy document below is taken from
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log.html
data "aws_iam_policy_document" "vpc_flow_logs_iam_policy" {
  statement {
    effect    = "Allow"
    resources = ["*"]
    actions   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents", "logs:DescribeLogGroups", "logs:DescribeLogStreams"]
  }
}

resource "aws_iam_role" "vpc_flow_logs_iam_role" {
  assume_role_policy = data.aws_iam_policy_document.vpc_flow_logs_iam_assume_role_iam_policy_document.json
}

resource "aws_iam_role_policy" "vpc_flow_log_iam_role_policy" {
  name   = "VPCFlowLogsIAMPolicy"
  role   = aws_iam_role.vpc_flow_logs_iam_role.id
  policy = data.aws_iam_policy_document.vpc_flow_logs_iam_policy.json
}

resource "aws_flow_log" "vpc_flow_logs" {
  iam_role_arn    = aws_iam_role.vpc_flow_logs_iam_role.arn
  log_destination = aws_cloudwatch_log_group.vpc_flow_logs_cloudwatch_log_group.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.vpc.id
}

data "aws_iam_policy_document" "example" {
  statement {
    actions   = ["ssm:GetParameters"]
    resources = ["arn:aws:ssm:*:*:parameter/*"]
    effect    = "Allow"
  }

  statement {
    actions = ["s3:*"]

    resources = [
      "arn:aws:s3:::*",
      "arn:aws:s3:::*/*",
    ]

    effect = "Allow"
  }
}

module "example" {
  source  = "git::https://github.com/trebidav/terraform-module-ecs-app-ec2-nolb"
  version = "0.1.0"

  # naming
  project = "${var.project}"
  app     = "${var.app}"
  stage   = "${var.stage}"
  name    = "example"

  # network
  vpc_id = "${module.vpc.vpc_id}"

  private_subnet_ids = ["${module.vpc.private_subnets}"]

  # global port
  port = 8000

  # container
  environment = [
    {
      # example non-secret variable
      name  = "EXAMPLE_VARIABLE"
      value = "value"
    },
  ]

  secrets = [
    {
      # example secret variable - ssm parameter reference
      name      = "EXAMPLE_SECRET"
      valueFrom = "${aws_ssm_parameter.EXAMPLE_SECRET.arn}"
    },
  ]

  # task
  memory = 256
  cpu    = 0

  # service
  cluster_name = "${module.ec2-cluster.ecs_cluster_name}"
  min_healthy  = 100
  max_healthy  = 200

  # healthcheck
  container_healthcheck_command = ["CMD-SHELL", "example inspect ping --workdir dj -A settings.example"]

  # autoscaling is off

  # access
  policy = "${data.aws_iam_policy_document.example.json}"
}

output "ecr_example" {
  value = "${module.example.ecr_repository}"
}

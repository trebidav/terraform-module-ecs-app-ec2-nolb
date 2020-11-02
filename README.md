# ECS App (EC2/NOLB)

This module creates resources for a containarized ECS application.

This is a version for EC2 backed ECS cluster.

The service is not behind a load balancer which means it is not exposed (unless the ECS cluster itself is). This is useful for background tasks that don't need any HTTP healthcheck implemented. Instead the Docker healthcheck is used for determining the service health.

## Required resources

- ECS Cluster
- VPC
- VPC Subnets

## Creates resources

- ECS Service
- ECS Task definition
- Container definition (using Cloudposse module)
- ECR Repository
- IAM Task execution role
- Custom policy attachment
- CloudWatch Log group
- Security group

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app | app name | `any` | n/a | yes |
| cluster\_name | ecs cluster name where the services will be registered | `any` | n/a | yes |
| container\_healthcheck\_command | n/a | `list` | <pre>[<br>  "CMD-SHELL",<br>  "echo"<br>]</pre> | no |
| container\_healthcheck\_interval | n/a | `number` | `30` | no |
| container\_healthcheck\_retries | n/a | `number` | `5` | no |
| container\_healthcheck\_startPeriod | n/a | `number` | `60` | no |
| container\_healthcheck\_timeout | n/a | `number` | `5` | no |
| cooldown | n/a | `number` | `60` | no |
| cpu | CPU reservation for the task | `number` | `0` | no |
| environment | n/a | `list` | `[]` | no |
| image | override image - disables creating ecr repository | `string` | `""` | no |
| log\_retention | for how many days to keep app logs | `number` | `90` | no |
| max\_capacity | n/a | `number` | `1` | no |
| max\_healthy | n/a | `number` | `200` | no |
| memory | MEM reservation for the task | `number` | `1024` | no |
| memory\_hard | MEM hard limit for the task | `number` | `2048` | no |
| min\_capacity | n/a | `number` | `1` | no |
| min\_healthy | n/a | `number` | `100` | no |
| name | name of this specific service | `any` | n/a | yes |
| placement\_constraint\_expression | n/a | `string` | `"agentConnected==true"` | no |
| placement\_constraint\_type | n/a | `string` | `"memberOf"` | no |
| policy | IAM Policy heredoc to use with task | `string` | `""` | no |
| port | port on which the service listens | `number` | `80` | no |
| private\_subnet\_ids | list of private subnets where to provision services | `list` | n/a | yes |
| project | project name | `any` | n/a | yes |
| scale\_down | n/a | `number` | `30` | no |
| scale\_up | n/a | `number` | `80` | no |
| scheduling\_strategy | n/a | `string` | `"REPLICA"` | no |
| secrets | n/a | `list` | `[]` | no |
| stage | stage name | `any` | n/a | yes |
| tags | n/a | `map` | `{}` | no |
| use\_ecr\_image\_scanning | n/a | `bool` | `true` | no |
| vpc\_id | vpc id - used in target group, security group etc | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| cloudwatch\_log\_group\_arn | n/a |
| ecr\_repository | n/a |

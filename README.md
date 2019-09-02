# ECS App (EC2/NOLB)

This module creates resources for a containarized ECS application.
 
### EC2/NOLB

This is a version for EC2 backed ECS cluster.

The service is not behind a load balancer which means it is not exposed (unless the ECS cluster itself is). This is useful for background tasks that don't need any HTTP healthcheck implemented. Instead the Docker healthcheck is used for determining the service health.

#### Required resources:
- ECS Cluster
- VPC
- VPC Subnets

#### Creates resources:
- ECS Service 
- ECS Task definition
- Container definition (using Cloudposse module)
- ECR Repository
- IAM Task execution role
- Custom policy attachment
- CloudWatch Log group
- Security group


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| app | app name | string | n/a | yes |
| cluster\_name | ecs cluster name where the services will be registered | string | n/a | yes |
| container\_healthcheck\_command |  | list | `<list>` | no |
| container\_healthcheck\_interval |  | string | `"30"` | no |
| container\_healthcheck\_retries |  | string | `"5"` | no |
| container\_healthcheck\_startPeriod |  | string | `"60"` | no |
| container\_healthcheck\_timeout |  | string | `"5"` | no |
| cooldown |  | string | `"60"` | no |
| cpu | CPU reservation for the task | string | `"0"` | no |
| environment |  | list | `<list>` | no |
| image | override image - disables creating ecr repository | string | `""` | no |
| log\_retention | for how many days to keep app logs | string | `"90"` | no |
| max\_capacity |  | string | `"1"` | no |
| max\_healthy |  | string | `"200"` | no |
| memory | MEM reservation for the task | string | `"1024"` | no |
| min\_capacity |  | string | `"1"` | no |
| min\_healthy |  | string | `"100"` | no |
| name | name of this specific service | string | n/a | yes |
| policy | IAM Policy heredoc to use with task | string | `""` | no |
| port | port on which the service listens | string | `"80"` | no |
| private\_subnet\_ids | list of private subnets where to provision services | list | n/a | yes |
| project | project name | string | n/a | yes |
| scale\_down |  | string | `"30"` | no |
| scale\_up |  | string | `"80"` | no |
| scheduling\_strategy |  | string | `"REPLICA"` | no |
| secrets |  | list | `<list>` | no |
| stage | stage name | string | n/a | yes |
| tags |  | map | `<map>` | no |
| vpc\_id | vpc id - used in target group, security group etc | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ecr\_repository |  |


variable "project" {
  description = "project name"
}

variable "stage" {
  description = "stage name"
}

variable "app" {
  description = "app name"
}

variable "name" {
  description = "name of this specific service"
}

variable "vpc_id" {
  description = "vpc id - used in target group, security group etc"
}

variable "private_subnet_ids" {
  description = "list of private subnets where to provision services"
  type        = "list"
}

variable "port" {
  description = "port on which the service listens"
  default     = 80
}

variable "environment" {
  type    = "list"
  default = []
}

variable "secrets" {
  type    = "list"
  default = []
}

variable "cpu" {
  description = "CPU reservation for the task"
  default     = 0
}

variable "memory" {
  description = "MEM reservation for the task"
  default     = 1024
}

variable "cluster_name" {
  description = "ecs cluster name where the services will be registered"
}

variable "image" {
  description = "override image - disables creating ecr repository"
  default     = ""
}

variable "log_retention" {
  description = "for how many days to keep app logs"
  default     = 90
}

variable "tags" {
  default = {}
}

variable "min_healthy" {
  default = 100
}

variable "max_healthy" {
  default = 200
}

variable "policy" {
  description = "IAM Policy heredoc to use with task"
  default     = ""
}

variable "max_capacity" {
  default = 1
}

variable "min_capacity" {
  default = 1
}

variable "scale_down" {
  default = 30
}

variable "scale_up" {
  default = 80
}

variable "cooldown" {
  default = 60
}

variable "scheduling_strategy" {
  default = "REPLICA"
}

variable "container_healthcheck_command" {
  type    = "list"
  default = ["CMD-SHELL", "echo"]
}

variable "container_healthcheck_retries" {
  default = 5
}

variable "container_healthcheck_startPeriod" {
  default = 60
}

variable "container_healthcheck_interval" {
  default = 30
}

variable "container_healthcheck_timeout" {
  default = 5
}

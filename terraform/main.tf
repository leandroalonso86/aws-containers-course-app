module "service" {
  source = "/home/leandro/Containers-AWS/aws-containers-course/day-3-ecs-service-module"

  region = var.region

  cluster_name = var.cluster_name

  service_name      = var.service_name
  service_port      = var.service_port
  service_cpu       = var.service_cpu
  service_memory    = var.service_memory
  service_listener  = data.aws_ssm_parameter.listener.value
  service_task_role = aws_iam_role.task_role.arn

  service_hosts = var.service_hosts

  service_launch_type = var.service_launch_type

  service_task_count = var.service_task_count

  service_healthcheck = var.service_healthcheck

  environment_variables = var.environment_variables
  capabilities          = var.capabilities

  vpc_id = data.aws_ssm_parameter.vpc_id.value

  private_subnets = [
    data.aws_ssm_parameter.private-1a.value,
    data.aws_ssm_parameter.private-1b.value,
    data.aws_ssm_parameter.private-1c.value
  ]

  task_min   = var.task_min
  task_max   = var.task_max
  scale_type = var.scale_type

  scale_out_cpu_threshold       = var.scale_out_cpu_threshold
  scale_out_adjustment          = var.scale_out_adjustment
  scale_out_comparison_operator = var.scale_out_comparison_operator
  scale_out_statistic           = var.scale_out_statistic
  scale_out_period              = var.scale_out_period
  scale_out_evaluation_periods  = var.scale_out_evaluation_periods
  scale_out_cooldown            = var.scale_out_cooldown

  scale_in_cpu_threshold       = var.scale_in_cpu_threshold
  scale_in_adjustment          = var.scale_in_adjustment
  scale_in_comparison_operator = var.scale_in_comparison_operator
  scale_in_statistic           = var.scale_in_statistic
  scale_in_period              = var.scale_in_period
  scale_in_evaluation_periods  = var.scale_in_evaluation_periods
  scale_in_cooldown            = var.scale_in_cooldown
  scale_tracking_cpu           = var.scale_tracking_cpu
  alb_arn                      = data.aws_ssm_parameter.alb_arn.value
  scale_tracking_requests      = var.scale_tracking_requests
}

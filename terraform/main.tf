module "service" {
  source = "/home/leandro/Containers-AWS/aws-containers-course/day-3-ecs-services"
  cluster_name = var.cluster_name
  service_name = var.service_name
  service_port = var.service_port
  service_cpu = var.service_cpu
  service_memory = var.service_memory
  service_listener = var.ssm_listener
  vpc_id = var.ssm_vpc_id
  private_subnets = [
    var.ssm_pvt_subnet_1a,
    var.ssm_pvt_subnet_1b,
    var.ssm_pvt_subnet_1c
  ]
}
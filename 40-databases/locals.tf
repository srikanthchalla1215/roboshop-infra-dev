locals {
    common_tags = {
    Project = var.project
    Environment = var.environment
    Terraform = "true"
}
  ami_id = data.aws_ami.joindevops.id
  database_subnet_id = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0]
  mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
  rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq.value
  mysql_sg_id = data.aws_ssm_parameter.mysql.value

  mysql_role_name = join("-", [
          for name in ["${var.project}","${var.environment}", "mysql"] : title(name)
      ])
  mysql_policy_name = join("", [
          for name in ["${var.project}","${var.environment}", "mysql"] : title(name)
      ])
}
module "ecs" {
  for_each = var.ecs_parameters
  source   = "terraform-aws-modules/ecs/aws//modules/cluster"
  version  = "7.3.1"

  create  = true
  name    = "${local.common_name}-${each.key}"
  setting = try(each.value.cluster_settings, var.ecs_defaults.cluster_settings, [{ "name" : "containerInsights", "value" : "enabled" }])
  configuration = try(each.value.cluster_configuration, var.ecs_defaults.cluster_configuration,
    {
      execute_command_configuration = {
        logging = "OVERRIDE"
        log_configuration = {
          cloud_watch_log_group_name = "/aws/ecs/${local.common_name}-${each.key}"
        }
      }
    }
  )
  default_capacity_provider_strategy = try(each.value.default_capacity_provider_strategy, var.ecs_defaults.default_capacity_provider_strategy,
    {
      FARGATE = {
        weight = 0
      }
    }
  )
  capacity_providers                                = try(each.value.capacity_providers, var.ecs_defaults.capacity_providers, {})
  cluster_capacity_providers                        = try(each.value.cluster_capacity_providers, var.ecs_defaults.cluster_capacity_providers, [])
  create_cloudwatch_log_group                       = try(each.value.create_cloudwatch_log_group, var.ecs_defaults.create_cloudwatch_log_group, true)
  cloudwatch_log_group_class                        = try(each.value.cloudwatch_log_group_class, var.ecs_defaults.cloudwatch_log_group_class, null)
  cloudwatch_log_group_kms_key_id                   = try(each.value.cloudwatch_log_group_kms_key_id, var.ecs_defaults.cloudwatch_log_group_kms_key_id, null)
  cloudwatch_log_group_name                         = try(each.value.cloudwatch_log_group_name, var.ecs_defaults.cloudwatch_log_group_name, null)
  cloudwatch_log_group_retention_in_days            = try(each.value.cloudwatch_log_group_retention_in_days, var.ecs_defaults.cloudwatch_log_group_retention_in_days, 14)
  cloudwatch_log_group_tags                         = try(each.value.cloudwatch_log_group_tags, var.ecs_defaults.cloudwatch_log_group_tags, {})
  service_connect_defaults                          = try(each.value.cluster_service_connect_defaults, var.ecs_defaults.cluster_service_connect_defaults, null)
  create_task_exec_iam_role                         = try(each.value.create_task_exec_iam_role, var.ecs_defaults.create_task_exec_iam_role, false)
  create_task_exec_policy                           = try(each.value.create_task_exec_policy, var.ecs_defaults.create_task_exec_policy, false)
  create_infrastructure_iam_role                    = try(each.value.create_infrastructure_iam_role, var.ecs_defaults.create_infrastructure_iam_role, true)
  infrastructure_iam_role_name                      = try(each.value.infrastructure_iam_role_name, var.ecs_defaults.infrastructure_iam_role_name, null)
  infrastructure_iam_role_use_name_prefix           = try(each.value.infrastructure_iam_role_use_name_prefix, var.ecs_defaults.infrastructure_iam_role_use_name_prefix, true)
  infrastructure_iam_role_path                      = try(each.value.infrastructure_iam_role_path, var.ecs_defaults.infrastructure_iam_role_path, null)
  infrastructure_iam_role_description               = try(each.value.infrastructure_iam_role_description, var.ecs_defaults.infrastructure_iam_role_description, null)
  infrastructure_iam_role_permissions_boundary      = try(each.value.infrastructure_iam_role_permissions_boundary, var.ecs_defaults.infrastructure_iam_role_permissions_boundary, null)
  infrastructure_iam_role_tags                      = try(each.value.infrastructure_iam_role_tags, var.ecs_defaults.infrastructure_iam_role_tags, {})
  infrastructure_iam_role_source_policy_documents   = try(each.value.infrastructure_iam_role_source_policy_documents, var.ecs_defaults.infrastructure_iam_role_source_policy_documents, [])
  infrastructure_iam_role_override_policy_documents = try(each.value.infrastructure_iam_role_override_policy_documents, var.ecs_defaults.infrastructure_iam_role_override_policy_documents, [])
  infrastructure_iam_role_statements                = try(each.value.infrastructure_iam_role_statements, var.ecs_defaults.infrastructure_iam_role_statements, null)
  create_node_iam_instance_profile                  = try(each.value.create_node_iam_instance_profile, var.ecs_defaults.create_node_iam_instance_profile, true)
  node_iam_role_name                                = try(each.value.node_iam_role_name, var.ecs_defaults.node_iam_role_name, null)
  node_iam_role_use_name_prefix                     = try(each.value.node_iam_role_use_name_prefix, var.ecs_defaults.node_iam_role_use_name_prefix, true)
  node_iam_role_path                                = try(each.value.node_iam_role_path, var.ecs_defaults.node_iam_role_path, null)
  node_iam_role_description                         = try(each.value.node_iam_role_description, var.ecs_defaults.node_iam_role_description, "ECS Managed Instances node IAM role")
  node_iam_role_permissions_boundary                = try(each.value.node_iam_role_permissions_boundary, var.ecs_defaults.node_iam_role_permissions_boundary, null)
  node_iam_role_additional_policies                 = try(each.value.node_iam_role_additional_policies, var.ecs_defaults.node_iam_role_additional_policies, {})
  node_iam_role_tags                                = try(each.value.node_iam_role_tags, var.ecs_defaults.node_iam_role_tags, {})
  node_iam_role_source_policy_documents             = try(each.value.node_iam_role_source_policy_documents, var.ecs_defaults.node_iam_role_source_policy_documents, [])
  node_iam_role_override_policy_documents           = try(each.value.node_iam_role_override_policy_documents, var.ecs_defaults.node_iam_role_override_policy_documents, [])
  node_iam_role_statements                          = try(each.value.node_iam_role_statements, var.ecs_defaults.node_iam_role_statements, null)
  create_security_group                             = try(each.value.create_security_group, var.ecs_defaults.create_security_group, true)
  vpc_id                                            = try(each.value.vpc_id, var.ecs_defaults.vpc_id, null)
  security_group_name                               = try(each.value.security_group_name, var.ecs_defaults.security_group_name, null)
  security_group_use_name_prefix                    = try(each.value.security_group_use_name_prefix, var.ecs_defaults.security_group_use_name_prefix, true)
  security_group_description                        = try(each.value.security_group_description, var.ecs_defaults.security_group_description, null)
  security_group_ingress_rules                      = try(each.value.security_group_ingress_rules, var.ecs_defaults.security_group_ingress_rules, {})
  security_group_egress_rules = try(each.value.security_group_egress_rules, var.ecs_defaults.security_group_egress_rules, { all_ipv4 = {
    cidr_ipv4   = "0.0.0.0/0"
    description = "Allow all IPv4 traffic"
    ip_protocol = "-1"
    }
    all_ipv6 = {
      cidr_ipv6   = "::/0"
      description = "Allow all IPv6 traffic"
      ip_protocol = "-1"
  } })
  security_group_tags = try(each.value.security_group_tags, var.ecs_defaults.security_group_tags, {})

  # task_exec_iam_role_description          = try(each.value.task_exec_iam_role_description, var.ecs_defaults.task_exec_iam_role_description, null)
  # task_exec_iam_role_name                 = try(each.value.task_exec_iam_role_name, var.ecs_defaults.task_exec_iam_role_name, null)
  # task_exec_iam_role_path                 = try(each.value.task_exec_iam_role_path, var.ecs_defaults.task_exec_iam_role_path, null)
  # task_exec_iam_role_permissions_boundary = try(each.value.task_exec_iam_role_permissions_boundary, var.ecs_defaults.task_exec_iam_role_permissions_boundary, null)
  # task_exec_iam_role_policies             = try(each.value.task_exec_iam_role_policies, var.ecs_defaults.task_exec_iam_role_policies, {})
  # task_exec_iam_role_tags                 = try(each.value.task_exec_iam_role_tags, var.ecs_defaults.task_exec_iam_role_tags, {})
  # task_exec_iam_role_use_name_prefix      = try(each.value.task_exec_iam_role_use_name_prefix, var.ecs_defaults.task_exec_iam_role_use_name_prefix, true)
  # task_exec_iam_statements                = try(each.value.task_exec_iam_statements, var.ecs_defaults.task_exec_iam_statements, {})
  # task_exec_secret_arns                   = try(each.value.task_exec_secret_arns, var.ecs_defaults.task_exec_secret_arns, ["arn:aws:secretsmanager:*:*:secret:*"])
  # task_exec_ssm_param_arns                = try(each.value.task_exec_ssm_param_arns, var.ecs_defaults.task_exec_ssm_param_arns, ["arn:aws:ssm:*:*:parameter/*"])


  tags = merge(local.common_tags, try(each.value.tags, var.ecs_defaults.tags, null))
}
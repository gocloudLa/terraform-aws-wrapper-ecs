# Standard Platform - Terraform Module 🚀🚀
<p align="right"><a href="https://partners.amazonaws.com/partners/0018a00001hHve4AAC/GoCloud"><img src="https://img.shields.io/badge/AWS%20Partner-Advanced-orange?style=for-the-badge&logo=amazonaws&logoColor=white" alt="AWS Partner"/></a><a href="LICENSE"><img src="https://img.shields.io/badge/License-Apache%202.0-green?style=for-the-badge&logo=apache&logoColor=white" alt="LICENSE"/></a></p>

Welcome to the Standard Platform — a suite of reusable and production-ready Terraform modules purpose-built for AWS environments.
Each module encapsulates best practices, security configurations, and sensible defaults to simplify and standardize infrastructure provisioning across projects.

## 📦 Module: Terraform ECS Service Module
<p align="right"><a href="https://github.com/gocloudLa/terraform-aws-wrapper-ecs/releases/latest"><img src="https://img.shields.io/github/v/release/gocloudLa/terraform-aws-wrapper-ecs.svg?style=for-the-badge" alt="Latest Release"/></a><a href=""><img src="https://img.shields.io/github/last-commit/gocloudLa/terraform-aws-wrapper-ecs.svg?style=for-the-badge" alt="Last Commit"/></a><a href="https://registry.terraform.io/modules/gocloudLa/wrapper-ecs/aws"><img src="https://img.shields.io/badge/Terraform-Registry-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform Registry"/></a></p>
The Terraform Wrapper for AWS ECS simplifies the configuration of the cluster service in the AWS cloud. This wrapper acts as a predefined template, making it easier to create and manage ECS services by handling all the technical details.

### ✨ Features

- 🏢 [Capacity Provider Management](#capacity-provider-management) - Supports multiple capacity providers for provisioned infrastructure



### 🔗 External Modules
| Name | Version |
|------|------:|
| <a href="https://github.com/terraform-aws-modules/terraform-aws-ecs" target="_blank">terraform-aws-modules/ecs/aws</a> | 6.6.1 |



## 🚀 Quick Start
```hcl
ecs_parameters = {
  ## Cluster Definition
  "00" = {
    ## Cluster Parameters Configuration
    cluster_settings = {
      name  = "containerInsights"
      value = "disabled"
    }
  }
}
ecs_defaults = var.ecs_defaults
```


## 🔧 Additional Features Usage

### Capacity Provider Management
It allows defining and managing multiple capacity providers in case of requiring the use of provisioned infrastructure as an alternative to fargate + fargate_spot.


<details><summary>Configuration Code</summary>

```hcl
ecs_parameters = {
    "00" = {
      cluster_settings = [{
        name  = "containerInsights"
        value = "disabled"
      }]

      default_capacity_provider_strategy = {
        FARGATE = {
          weight = 50
        }
        FARGATE_SPOT = {
          weight = 50
        }
      }
      autoscaling_capacity_providers = {}

      # Disable Cloudwatch
      # create_cloudwatch_log_group = false # Default: true
      # cluster_configuration = { execute_command_configuration = { logging = "DEFAULT" } }

      # Cloudwatch: retention
      # cloudwatch_log_group_retention_in_days = 14
    }
  }
```


</details>




## 📑 Inputs
| Name                                    | Description                                                                   | Type     | Default                                                                                                                                                              | Required |
| --------------------------------------- | ----------------------------------------------------------------------------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| cluster_settings                        | Configuration block(s) with cluster settings.                                 | `list`   | ```[{ "name": "containerInsights", "value": "disabled" }]```                                                                                                         | no       |
| cluster_configuration                   | The execute command configuration for the cluster.                            | `map`    | ```{ execute_command_configuration = { logging = "OVERRIDE", log_configuration = { cloud_watch_log_group_name = "/aws/ecs/${local.common_name}-${each.key}" } } }``` | no       |
| default_capacity_provider_strategy      | Map of default capacity provider strategy definitions to use for the cluster. | `map`    | ```{ FARGATE = { weight = 0 } }```                                                                                                                                   | no       |
| autoscaling_capacity_providers          | Map of autoscaling capacity provider definitions to create for the cluster.   | `map`    | ```{}```                                                                                                                                                             | no       |
| create_cloudwatch_log_group             | Create a CloudWatch log group.                                                | `bool`   | `true`                                                                                                                                                               | no       |
| cloudwatch_log_group_class              | Specifies the log class of the log group.                                     | `string` | `null`                                                                                                                                                               | no       |
| cloudwatch_log_group_kms_key_id         | Determines the KMS key id.                                                    | `string` | `null`                                                                                                                                                               | no       |
| cloudwatch_log_group_name               | Name of the CloudWatch group.                                                 | `string` | `null`                                                                                                                                                               | no       |
| cloudwatch_log_group_retention_in_days  | Days of retention of the CloudWatch group.                                    | `number` | `14`                                                                                                                                                                 | no       |
| cloudwatch_log_group_tags               | Tags to apply to the CloudWatch log group.                                    | `map`    | ```{}```                                                                                                                                                             | no       |
| cluster_service_connect_defaults        | Default configuration for the service connection in the cluster.              | `map`    | ```{}```                                                                                                                                                             | no       |
| create_task_exec_iam_role               | Determines the creation of an IAM role for task execution.                    | `bool`   | `false`                                                                                                                                                              | no       |
| create_task_exec_policy                 | Determines the creation of an IAM policy for task execution.                  | `bool`   | `false`                                                                                                                                                              | no       |
| task_exec_iam_role_description          | Description of the IAM role for task execution.                               | `string` | `null`                                                                                                                                                               | no       |
| task_exec_iam_role_name                 | Name of the IAM role for task execution.                                      | `string` | `null`                                                                                                                                                               | no       |
| task_exec_iam_role_path                 | Path of the IAM role for task execution.                                      | `string` | `null`                                                                                                                                                               | no       |
| task_exec_iam_role_permissions_boundary | Permissions boundary for the IAM role for task execution.                     | `string` | `null`                                                                                                                                                               | no       |
| task_exec_iam_role_policies             | Policies to attach to the IAM role for task execution.                        | `map`    | ```{}```                                                                                                                                                             | no       |
| task_exec_iam_role_tags                 | Tags to apply to the IAM role for task execution.                             | `map`    | ```{}```                                                                                                                                                             | no       |
| task_exec_iam_role_use_name_prefix      | Whether to use name prefix for the IAM role for task execution.               | `bool`   | `true`                                                                                                                                                               | no       |
| task_exec_iam_statements                | IAM policy statements for the task execution role.                            | `map`    | ```{}```                                                                                                                                                             | no       |
| task_exec_secret_arns                   | Secret ARNs for the task execution role.                                      | `list`   | ```["arn:aws:secretsmanager:*:*:secret:*"]```                                                                                                                        | no       |
| task_exec_ssm_param_arns                | SSM parameter ARNs for the task execution role.                               | `list`   | ```["arn:aws:ssm:*:*:parameter/*"]```                                                                                                                                | no       |
| tags                                    | A map of tags to assign to resources.                                         | `map`    | `{}`                                                                                                                                                                 | no       |







## ⚠️ Important Notes
- **ℹ️ Enable Container Insights:** Enables Container Insights, which generates additional costs - set `enable_container_insights = true`
- **⚠️ Cluster Settings:** The `cluster_settings` parameter expects a list of maps with `name` and `value` keys
- **⚠️ Task Execution Role:** When `create_task_exec_iam_role = true`, ensure proper IAM permissions are configured
- **⚠️ CloudWatch Logs:** Default logging configuration uses OVERRIDE mode with custom log group naming



---

## 🤝 Contributing
We welcome contributions! Please see our contributing guidelines for more details.

## 🆘 Support
- 📧 **Email**: info@gocloud.la

## 🧑‍💻 About
We are focused on Cloud Engineering, DevOps, and Infrastructure as Code.
We specialize in helping companies design, implement, and operate secure and scalable cloud-native platforms.
- 🌎 [www.gocloud.la](https://www.gocloud.la)
- ☁️ AWS Advanced Partner (Terraform, DevOps, GenAI)
- 📫 Contact: info@gocloud.la

## 📄 License
This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details. 
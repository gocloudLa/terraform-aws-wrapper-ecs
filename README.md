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
| [terraform-aws-modules/ecs/aws](https://github.com/terraform-aws-modules/ecs-aws) | 6.1.0 |



## 🚀 Quick Start
```hcl
ecs_parameters = {
  ## Definición del cluster
  "00" = {
    ## Configuración de los parametros del cluster
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










## ⚠️ Important Notes
- **ℹ️ Enable Container Insights:** Enables Container Insights, which generates additional costs - set `enable_container_insights = true`



---

## 🤝 Contributing
We welcome contributions! Please see our contributing guidelines for more details.

## 🆘 Support
- 📧 **Email**: info@gocloud.la
- 🐛 **Issues**: [GitHub Issues](https://github.com/gocloudLa/issues)

## 🧑‍💻 About
We are focused on Cloud Engineering, DevOps, and Infrastructure as Code.
We specialize in helping companies design, implement, and operate secure and scalable cloud-native platforms.
- 🌎 [www.gocloud.la](https://www.gocloud.la)
- ☁️ AWS Advanced Partner (Terraform, DevOps, GenAI)
- 📫 Contact: info@gocloud.la

## 📄 License
This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details. 
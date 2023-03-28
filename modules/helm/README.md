## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.boring_app_release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_image_url"></a> [container\_image\_url](#input\_container\_image\_url) | The url of the container image of boring-app | `string` | n/a | yes |
| <a name="input_mysql_database"></a> [mysql\_database](#input\_mysql\_database) | The name of the database that is created by terraform | `string` | n/a | yes |
| <a name="input_mysql_host"></a> [mysql\_host](#input\_mysql\_host) | The ip of the mysql host | `string` | n/a | yes |
| <a name="input_mysql_password"></a> [mysql\_password](#input\_mysql\_password) | the mysql user's password | `string` | n/a | yes |
| <a name="input_mysql_user"></a> [mysql\_user](#input\_mysql\_user) | The mysql user to access the database of boring-app | `string` | n/a | yes |

## Outputs

No outputs.

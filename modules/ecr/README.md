<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_ecr_repository_name"></a> [aws\_ecr\_repository\_name](#input\_aws\_ecr\_repository\_name) | the name of the ecr repository | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_ecr_arn"></a> [aws\_ecr\_arn](#output\_aws\_ecr\_arn) | Full ARN of the repository: |
| <a name="output_aws_ecr_name"></a> [aws\_ecr\_name](#output\_aws\_ecr\_name) | the name of the aws\_ecr : |
| <a name="output_aws_ecr_registry_id"></a> [aws\_ecr\_registry\_id](#output\_aws\_ecr\_registry\_id) | The registry\_id of the ecr that got created: |
| <a name="output_aws_ecr_url"></a> [aws\_ecr\_url](#output\_aws\_ecr\_url) | The URL of the repository : |
<!-- END_TF_DOCS -->
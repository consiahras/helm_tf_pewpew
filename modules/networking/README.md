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
| <a name="input_aws_subnet_availability_zone"></a> [aws\_subnet\_availability\_zone](#input\_aws\_subnet\_availability\_zone) | The availability zone that our subnet will reside | `string` | n/a | yes |
| <a name="input_aws_subnet_availability_zone2"></a> [aws\_subnet\_availability\_zone2](#input\_aws\_subnet\_availability\_zone2) | The availability zone that our second  subnet will reside | `string` | n/a | yes |
| <a name="input_aws_subnet_availability_zone3"></a> [aws\_subnet\_availability\_zone3](#input\_aws\_subnet\_availability\_zone3) | The availability zone that our 3rd subnet (private)  will reside | `string` | n/a | yes |
| <a name="input_aws_subnet_availability_zone4"></a> [aws\_subnet\_availability\_zone4](#input\_aws\_subnet\_availability\_zone4) | The availability zone that our 4th  subnet (private)  will reside | `string` | n/a | yes |
| <a name="input_aws_subnet_cidr_block"></a> [aws\_subnet\_cidr\_block](#input\_aws\_subnet\_cidr\_block) | The cidr block that will be used for the creation of first public  aws\_subnet | `string` | n/a | yes |
| <a name="input_aws_subnet_cidr_block2"></a> [aws\_subnet\_cidr\_block2](#input\_aws\_subnet\_cidr\_block2) | The cidr block that will be used for the creation of 2nd public aws\_subnet | `string` | n/a | yes |
| <a name="input_aws_subnet_cidr_block3"></a> [aws\_subnet\_cidr\_block3](#input\_aws\_subnet\_cidr\_block3) | The cidr block that will be used for the creation of 3rd  aws\_subnet | `string` | n/a | yes |
| <a name="input_aws_subnet_cidr_block4"></a> [aws\_subnet\_cidr\_block4](#input\_aws\_subnet\_cidr\_block4) | The cidr block that will be used for the creation of 4th  aws\_subnet | `string` | n/a | yes |
| <a name="input_aws_vpc_cidr_block"></a> [aws\_vpc\_cidr\_block](#input\_aws\_vpc\_cidr\_block) | The cidr block that will be used for the creation of aws\_vpc | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_security_group_id"></a> [aws\_security\_group\_id](#output\_aws\_security\_group\_id) | the ID of the security group that we created |
| <a name="output_aws_subnet_cidr"></a> [aws\_subnet\_cidr](#output\_aws\_subnet\_cidr) | The CIDR block of the aws subnet: |
| <a name="output_aws_subnet_cidr2"></a> [aws\_subnet\_cidr2](#output\_aws\_subnet\_cidr2) | The CIDR block of the second  aws subnet: |
| <a name="output_aws_subnet_cidr3"></a> [aws\_subnet\_cidr3](#output\_aws\_subnet\_cidr3) | The CIDR block of the 3rd  aws subnet: |
| <a name="output_aws_subnet_cidr4"></a> [aws\_subnet\_cidr4](#output\_aws\_subnet\_cidr4) | The CIDR block of the 4th  aws subnet: |
| <a name="output_aws_subnet_id"></a> [aws\_subnet\_id](#output\_aws\_subnet\_id) | The unique ID of the aws public subnet: |
| <a name="output_aws_subnet_id2"></a> [aws\_subnet\_id2](#output\_aws\_subnet\_id2) | The unique ID of the second  aws public subnet: |
| <a name="output_aws_subnet_id3"></a> [aws\_subnet\_id3](#output\_aws\_subnet\_id3) | The unique ID of the 3rd  aws (private)  subnet: |
| <a name="output_aws_subnet_id4"></a> [aws\_subnet\_id4](#output\_aws\_subnet\_id4) | The unique ID of the 4th aws private subnet: |
| <a name="output_aws_vpc_cidr"></a> [aws\_vpc\_cidr](#output\_aws\_vpc\_cidr) | the aws\_vpc CIDR block: |
| <a name="output_aws_vpc_id"></a> [aws\_vpc\_id](#output\_aws\_vpc\_id) | The unique aws id of aws\_vpc that got created: |
<!-- END_TF_DOCS -->
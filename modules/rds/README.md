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
| [aws_db_instance.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_db_name"></a> [aws\_db\_name](#input\_aws\_db\_name) | The name of the database to create when the DB instance is created: | `string` | n/a | yes |
| <a name="input_aws_subnet_id"></a> [aws\_subnet\_id](#input\_aws\_subnet\_id) | the subnet id  where the database will be created | `string` | n/a | yes |
| <a name="input_rds_password"></a> [rds\_password](#input\_rds\_password) | Set the password in order to login to the rds | `string` | n/a | yes |
| <a name="input_rds_username"></a> [rds\_username](#input\_rds\_username) | Set the username in order to login to the rds | `string` | `"admin"` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | the list of vpc security group ids: | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_address"></a> [db\_address](#output\_db\_address) | the db instance server address |
| <a name="output_db_connect_string"></a> [db\_connect\_string](#output\_db\_connect\_string) | MySQL database connection string |
| <a name="output_db_name"></a> [db\_name](#output\_db\_name) | the Database name that created in the db instance |
| <a name="output_db_password"></a> [db\_password](#output\_db\_password) | the password for the user to access the Database |
| <a name="output_db_uid"></a> [db\_uid](#output\_db\_uid) | the username to access the Database |

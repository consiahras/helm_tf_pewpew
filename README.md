## Deployment Steps , script is running terraform plan/apply , builds the image and stores it to ecr
Just run the  .deploy.sh script , the output will be logged in deploy_log.txt

```console
./deploy.sh
```

## Helm Repo ingress-nginx isn't installed on the terraform helm module , but only the boring-app chart

```console
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
```

## Install Chart

**Important:** only helm3 is supported

```console
helm install ingress ingress-nginx/ingress-nginx -f helm_operators_values/ingress_values.yaml
```
The command deploys ingress-nginx on the Kubernetes cluster in the default configuration.


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.9.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_networking"></a> [aws\_networking](#module\_aws\_networking) | ./modules/networking | n/a |
| <a name="module_ecr"></a> [ecr](#module\_ecr) | ./modules/ecr | n/a |
| <a name="module_eks"></a> [eks](#module\_eks) | ./modules/eks | n/a |
| <a name="module_helm-boring-app"></a> [helm-boring-app](#module\_helm-boring-app) | ./modules/helm | n/a |
| <a name="module_rds"></a> [rds](#module\_rds) | ./modules/rds | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_rds_password"></a> [rds\_password](#input\_rds\_password) | The password to access the database that we will create | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

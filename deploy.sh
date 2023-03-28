#!/bin/bash

#Redirect the output to a file and the terminal
exec > >(tee -a deploy_log.txt) 2>&1

echo "Terraform creating networking,rds,ecs,ecr but not the module with helm"
terraform plan -var="enable_helm_module=0" -out=plan1.tfplan
terraform apply "plan1.tfplan"

#Getting the repo name from aws cli
ecr_repo_name=$(aws ecr describe-repositories | jq '.repositories[].repositoryName' | sed s/\"//g)
echo $ecr_repo_name
#Getting the url for docker login to the ecr
ecr_repo_url=$(aws ecr describe-repositories | jq '.repositories[].repositoryUri' | sed s/\"//g | sed "s/\/$ecr_repo_name//")
echo $ecr_repo_url

#Docker login to the repository
echo "Running docker login ..."
aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin "$ecr_repo_url"

echo "Building the boring app image from DockerFile ..."
docker build -t boring_app ./boring_app

echo "Tagging and pushing the image to the ecr"
docker tag "$ecr_repo_name":latest "$ecr_repo_url"/"$ecr_repo_name":latest
docker push "$ecr_repo_url"/"$ecr_repo_name":latest

echo "Starting terraform plan to deploy the helm charts"
terraform plan -out=plan2.tfplan
terraform apply "plan2.tfplan"




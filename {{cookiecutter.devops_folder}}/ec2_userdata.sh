#!/bin/bash

export AWS_DEFAULT_REGION="{{ cookiecutter.region }}"

# Update the apt package index:
sudo apt-get update

## Install Ansible requirements
sudo apt-get install -y python-minimal python-pip vim awscli
sudo apt-get install -y cloud-utils jq
sudo pip install docker

{%- if cookiecutter.use_spot_instance != 'n' %}
## Apply tags when spot
INSTANCEID=$(ec2metadata --instance-id)
VOLUMES=$(aws ec2 describe-volumes --filters "Name=attachment.instance-id,Values=$INSTANCEID" | jq '.Volumes[].VolumeId' | tr -d '"')
aws ec2 create-tags --resources $INSTANCEID $VOLUMES --tags "Key=Name,Value={{ cookiecutter.project_name }} Key=Product,Value={{ cookiecutter.tag_product }} Key=Owner,Value={{ cookiecutter.tag_owner }} Key=Environment,Value={{ cookiecutter.tag_environment }} Key=Client,Value={{ cookiecutter.tag_client }}"
{%- endif %}

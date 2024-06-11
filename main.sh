#!/bin/bash

if ! command -v terraform $> /dev/null
then
    echo "Terraform does not exist on this system. Install it first."
    echo "Follow this link: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli"
else
    echo "Formatting terraform files"
    formatted=$(terraform fmt)
    echo "Formatted files"
    echo "----------------"
    echo $formatted

    echo "Validating terraform files"
    init=$(terraform init -backend=false)
    terraform validate

    rm -fr .terraform
fi
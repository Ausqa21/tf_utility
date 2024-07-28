#!/bin/bash

if ! command -v terraform $> /dev/null
then
    echo "Terraform does not exist on this system. Install it first."
    echo "Follow this link: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli"
else
    echo "Formatting terraform files"
    formatted="$(terraform fmt -recursive)"
    echo "Formatted files"
    echo "----------------"
    echo $formatted

    echo "Validating terraform files"
    init=$(terraform init -backend=false)
    terraform validate

    grep ".terraform" .gitignore > /dev/null
    if [ "$?" -ne "0" ]
    then
        echo "Appending to .gitignore"
        echo -e "\n.terraform" >> .gitignore
        echo "Done"
    else
        echo "Done"
    fi
fi
/**
* ## Information
* 
* ACME (Let's Encrypt) Support for Terraform
* 
* ### Prerequisite
* 
* 1) Install acme provider
* 
*     $ go get github.com/paybyphone/terraform-provider-acme

*     $ go install github.com/paybyphone/terraform-provider-acme
* 
* 2) update terraform configuration
* 
* ```
* $ cat ~/.terraformrc
* 
* providers {
*   acme = "${GOPATH}/bin/terraform-provider-acme"
* }
* ```
* 
* 3) Update s3 backend bucket in `config/backend-dev.conf`
* 
* 4) update domain names in `config/dev.conf`
* 
* 
* ### Usage
* ```
* env=dev
* terraform get -update=true
* terraform init -backend-config=config/backend-${env}.conf
* terraform plan -var-file=config/${env}.tfvars -input=false -out=plan
* ```
* If it is fine, apply the change.
* ```
* terraform apply plan
* ```
*/

provider "aws" {
  region  = "${var.region}"
}

provider "template" {
}

provider "tls" {
}

provider "terraform" {
}

terraform {
  backend "s3" {
    encrypt = true
  }
}

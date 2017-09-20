## Information

ACME (Let's Encrypt) Support for Terraform

### Prerequisite

1) Install acme provider

$ go get github.com/paybyphone/terraform-provider-acme
$ go install github.com/paybyphone/terraform-provider-acme

2) update terraform configuration

```
$ cat ~/.terraformrc

providers {
acme = "${GOPATH}/bin/terraform-provider-acme"
}
```

### Usage
```
env=stag
terraform get -update=true
terraform init -backend-config=config/backend-${env}.conf
terraform plan -var-file=config/${env}.tfvars -input=false -out=plan
```
If it is fine, apply the change.
```
terraform apply plan
```


## Inputs

| Name | Description | Default | Required |
|------|-------------|:-----:|:-----:|
| common_name |  | `dev.example.com` | no |
| dns_names |  | `<list>` | no |
| region |  | `ap-southeast-2` | no |


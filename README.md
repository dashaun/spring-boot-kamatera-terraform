# Spring Boot Kamatera Terraform

Deploys a [Spring Boot Docker image](https://hub.docker.com/r/dashaun/spring-boot-native-pi-default) to [Kamatera](https://www.kamatera.com/) using `Terraform`

## Quick Start

```bash
#clone the repository
git clone https://github.com/dashaun/spring-boot-kamatera-terraform
cd spring-boot-kamatera-terraform
# configure Terraform with your credentials
export KAMATERA_API_CLIENT=...
export KAMATERA_API_SECRET=...
export TF_VAR_ssh_public_key="$(cat ~/.ssh/id_rsa.pub)"
export TF_VAR_ssh_private_key="$(cat ~/.ssh/id_rsa)"
#Initialize Terraform to pull down the provider
terraform init
# Validate your credentials config by using the plan
terraform plan
# Apply the Terraform, ETC < 5min
terraform apply -auto-approve
# Access the Spring Boot application using the newly created server
curl $(terraform output -raw public_ips):8080/actuator/health | jq .
```

## Cleanup

```bash
terraform destroy -auto-approve
```

## More Info

- [Blog Post](https://dashaun.com/posts/spring-boot-kamatera-terraform/)
- [YouTube]()
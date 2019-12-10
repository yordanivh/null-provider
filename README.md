# null-provider
This repository contains code that utilises the null provider

## What is the null provider used for

The null provider is used to test you code. It is used instead of the cloud providers and is smething you can do locally on your machine. It provides a way to test the outcome of the code without any consequences.

## What this code does

In the code itself we create two resources first one is `example` and second one is `example2`, by using the `triggers` argument each time when you do `terraform apply` the uuid of the resource will change and it will recreate the resource again. You can test this by running `terraform apply` twice and you will see that on the second time only the `example2` resource will be re-created.

## How to use the code in this repo

 * Install Terraform
 ```
 https://www.terraform.io/downloads.html
 ```
 
 * Clone this repository
 ```
 git clone https://github.com/yordanivh/null-provider
 ```
 
 * Change directory
 ```
 cd null-provider
 ```
 
 * Initialize the project ( Terraform will download provider plugins)
 
 ```
 terraform init
 ```
 
 * Plan the operation so that you see what actions will taken
 
 ```
 terraform plan
 ```
 
 * Run Terraform apply to create the resources
 ```
 terraform apply
 ```

* To destroy the created resources

 ```
 terraform destroy
 ```
 
* Please check the sample_run.md file for what to expect as output of these operations



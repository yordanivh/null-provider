# null-provider
This repository contains code that utilises the null provider

## What is the null provider used for ##

The null provider is used to test you code. It is used instead of the cloud providers and is smething you can do locally on your machine. It provides a way to test the outcome of the code without any consequences.

## How to use the code in this repo ##

 * First you need to have Terraform installed on you PC
 * Copy the files locally
 * Perform `terraform init` to download necessary plugins and then `terraform apply` to run the code

### What this code does ###
In the code itself we create two resources first one is `example` and second one is `example2`, by using the triggers argument each time when you do terraform apply the uuid of the resource will change and it will recreate the resource again. You can test this by running `terraform apply` twice and you will see that on the second time only the `example2` resource will be re-created.

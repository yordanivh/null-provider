1. When you run terraform init provider plugins will initialize and plugins will be downloaded.The end result should look like this.

```
null-provider (newbranch) $ terraform init

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "null" (hashicorp/null) 2.1.2...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.null: version = "~> 2.1"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```
2. By running terraform plan you will get an output of what actions will be taken
```
null-provider (newbranch) $ terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.example will be created
  + resource "null_resource" "example" {
      + id = (known after apply)
    }

  # null_resource.example2 will be created
  + resource "null_resource" "example2" {
      + id       = (known after apply)
      + triggers = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

3. By running terraform apply  you will create the two resources null_resource.example and null_resource.example2

```
null-provider (newbranch) $ terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.example will be created
  + resource "null_resource" "example" {
      + id = (known after apply)
    }

  # null_resource.example2 will be created
  + resource "null_resource" "example2" {
      + id       = (known after apply)
      + triggers = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

null_resource.example: Creating...
null_resource.example2: Creating...
null_resource.example: Creation complete after 0s [id=5483545458231408032]
null_resource.example2: Creation complete after 0s [id=3828022307649347448]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```
4. If you run terraform plan you will get a message showing that one of the resources will be replaced
```
null-provider (newbranch) $ terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

null_resource.example: Refreshing state... [id=7893692328896465152]
null_resource.example2: Refreshing state... [id=5881675770131424508]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # null_resource.example2 must be replaced
-/+ resource "null_resource" "example2" {
      ~ id       = "5881675770131424508" -> (known after apply)
      ~ triggers = {
          - "uuid" = "f02771ef-2cc6-8656-2fb2-b34af3eff933"
        } -> (known after apply) # forces replacement
    }

Plan: 1 to add, 0 to change, 1 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```
5. With terraform apply you will re-create the example2 resources because the uuid will change and the triggers argument will force the re-creation.

```null-provider (newbranch) $ terraform apply
null_resource.example: Refreshing state... [id=5483545458231408032]
null_resource.example2: Refreshing state... [id=3828022307649347448]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # null_resource.example2 must be replaced
-/+ resource "null_resource" "example2" {
      ~ id       = "3828022307649347448" -> (known after apply)
      ~ triggers = {
          - "uuid" = "9f6e4945-280a-591e-a5cf-06d75300614a"
        } -> (known after apply) # forces replacement
    }

Plan: 1 to add, 0 to change, 1 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

null_resource.example2: Destroying... [id=3828022307649347448]
null_resource.example2: Destruction complete after 0s
null_resource.example2: Creating...
null_resource.example2: Creation complete after 0s [id=2987104567313969892]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
```
6. By running terraform destroy you will remove all the created resources

```
null-provider (newbranch) $ terraform destroy
null_resource.example2: Refreshing state... [id=2987104567313969892]
null_resource.example: Refreshing state... [id=5483545458231408032]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # null_resource.example will be destroyed
  - resource "null_resource" "example" {
      - id = "5483545458231408032" -> null
    }

  # null_resource.example2 will be destroyed
  - resource "null_resource" "example2" {
      - id       = "2987104567313969892" -> null
      - triggers = {
          - "uuid" = "4ed54af9-83b5-40d6-613d-4a8c38f31836"
        } -> null
    }

Plan: 0 to add, 0 to change, 2 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

null_resource.example: Destroying... [id=5483545458231408032]
null_resource.example2: Destroying... [id=2987104567313969892]
null_resource.example2: Destruction complete after 0s
null_resource.example: Destruction complete after 0s

Destroy complete! Resources: 2 destroyed.
```

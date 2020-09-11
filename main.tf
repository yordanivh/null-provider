provider "null" {}


resource "null_resource" "example" {
  
 provisioner "local-exec" {
    command = "wget https://github.com/terraform-aws-modules/terraform-aws-vpc/archive/v2.48.0.tar.gz"
  }

}

#make a small change

resource "null_resource" "example2" {}

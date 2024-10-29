resource "null_resource" "example22" {
  triggers = {
    uuid=uuid()
  }
} 


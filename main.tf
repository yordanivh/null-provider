resource "null_resource" "example23" {
  triggers = {
    uuid=uuid()
  }
} 


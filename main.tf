resource "null_resource" "example8" {
  triggers = {
    uuid=uuid()
  }
} 


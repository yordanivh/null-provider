resource "null_resource" "example4" {
  triggers = {
    uuid=uuid()
  }
} 


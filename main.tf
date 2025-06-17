resource "null_resource" "example7" {
  triggers = {
    uuid=uuid()
  }
} 


resource "null_resource" "example33" {
  triggers = {
    uuid=uuid()
  }
} 


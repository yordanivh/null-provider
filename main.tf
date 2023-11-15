resource "null_resource" "example1" {
  triggers = {
    uuid=uuid()
  }
} 


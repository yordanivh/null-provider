resource "null_resource" "example6" {
  triggers = {
    uuid=uuid()
  }
} 


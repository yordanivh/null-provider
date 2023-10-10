resource "null_resource" "example2" {
  triggers = {
    uuid=uuid()
  }
} 


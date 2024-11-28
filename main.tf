resource "null_resource" "example3" {
  triggers = {
    uuid=uuid()
  }
} 


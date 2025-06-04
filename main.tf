resource "null_resource" "example5" {
  triggers = {
    uuid=uuid()
  }
} 


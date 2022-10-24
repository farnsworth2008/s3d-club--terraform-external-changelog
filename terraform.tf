terraform {
  required_version = ">=1.3.3"

  required_providers {
    external = {
      source  = "hashicorp/external"
      version = ">=2.2.2"
    }
  }
}

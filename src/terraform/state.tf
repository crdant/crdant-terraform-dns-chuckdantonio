terraform {
  backend "gcs" {
    bucket = "terraform-dns-chuckdantonio"
    prefix = "terraform/state"
  }
}

provider "aws" {
  region = "us-east-2"
}

data "terraform_remote_state" "bk_end" {
  backend = "s3"
  config = {
      bucket = "backendbucket20210519"
      key    = "data_front/"
      region = "us-east-2"
  }
}

output "pub_ip" {
  value = data.terraform_remote_state.bk_end.outputs.pb_ip
}

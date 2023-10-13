terraform {
  required_providers {
    terratowns ={
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "aungkohtet"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  #cloud {
  #  organization = "aungkohtet"
  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
}
provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid= var.teacherseat_user_uuid
  token=var.terratowns_access_token

}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
}
resource "terratowns_home" "home" {
  name = "Amazing Bagan"
  description = <<DESCRIPTION
History tells us that Bagan was founded in the 2nd Century AD and fortified in 849AD 
by King Pyinbya, a successor of the founder of Bagan. The city was the capital of 
the Pagan Empire from 1044 to 1287. During this time, the rulers and wealthy subjects 
constructed more than 10,000 religious monuments. The city prospered during this time and 
grew in size. It was centre for secular and religious studies. The Pagan empire collapsed in 1287.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  #domain_name = "3ersrq z.cloudfront.net"
  town = "missingo"
  content_version = 1
}
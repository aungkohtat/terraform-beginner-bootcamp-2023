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
  cloud {
    organization = "aungkohtet"
    workspaces {
      name = "terra-house-1"
    }
  }
}
provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid= var.teacherseat_user_uuid
  token=var.terratowns_access_token

}

module "home_arcanum_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.arcanum.public_path
  content_version = var.arcanum.content_version
}
resource "terratowns_home" "home_arcanum_hosting" {
  name = "Amazing Bagan"
  description = <<DESCRIPTION
History tells us that Bagan was founded in the 2nd Century AD and fortified in 849AD 
by King Pyinbya, a successor of the founder of Bagan. The city was the capital of 
the Pagan Empire from 1044 to 1287. During this time, the rulers and wealthy subjects 
constructed more than 10,000 religious monuments. The city prospered during this time and 
grew in size. It was centre for secular and religious studies. The Pagan empire collapsed in 1287.
DESCRIPTION
  domain_name = module.home_arcanum_hosting.domain_name
  #domain_name = "qwlgve.cloudfront.net"
  town = "missingo"
  content_version = var.arcanum.content_version
}

module "home_kyarpauk_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.kyarpauk.public_path
  content_version = var.kyarpauk.content_version
}
resource "terratowns_home" "home_kyarpauk"{
  name = "Ninety two point Omama"
  description = <<DESCRIPTION
Kyar Pauk, a versatile artist from Myanmar, is celebrated for his contributions to music. 
As a songwriter, he crafts emotive lyrics that resonate with listeners. Beyond music, 
he's a talented doodler, expressing his creativity visually. Kyar Pauk's artistry 
shines in his collaboration with his band, producing soulful and memorable compositions. 
His journey is a blend of musical genius, creative writing, visual art, and collective 
musical brilliance.
DESCRIPTION
  domain_name = module.home_kyarpauk_hosting.domain_name
  #domain_name = "wertjg.cloudfront.net"
  town = "melomaniac-mansion"
  content_version = var.kyarpauk.content_version
}


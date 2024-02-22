terrafrom {
  backend "azurem"
    resource_group_name  = "terraformResourceGroup"
    storage_account_name = "terrafromstorage"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

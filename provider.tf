terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.88.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4.1"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.25.2"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy               = false
      purge_soft_deleted_keys_on_destroy         = false
      purge_soft_deleted_secrets_on_destroy      = false
      purge_soft_deleted_certificates_on_destroy = false
    }
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

provider "local" {
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = var.cluster_name
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = var.cluster_name
  }
}

# the azurerm provider is the only provider that's required for this work, but other providers could be added here and installed/consumed as needed
terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 3.0"
        }
        random = {
            source  = "hashicorp/random"
            version = "~> 3.0"
        }
    }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
    skip_provider_registration = true # this is only required when the user, service principal, or identity running terraform lacks the permissions to register azure resource providers
    features {}
}

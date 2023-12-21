# setup required providers
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

# configure the microsoft azure resource manager (azurerm) provider
# the azurerm provider uses env variables during initialization
# so there's no need to explicitly setup the credentials here
provider "azurerm" {
    skip_provider_registration = true # this is only required when the user, service principal, or identity running terraform lacks the permissions to register azure resource providers
    features {}
}

# the random provider doesn't require any configuration
# so there's nothing to do here

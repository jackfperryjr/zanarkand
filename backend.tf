# backend.tf is really only used when operating locally
terraform {
    backend "remote" {
        organization = "zanarkand"

        workspaces {
        name = "zanarkand"
        }
    }
}

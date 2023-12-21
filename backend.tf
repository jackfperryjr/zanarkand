# backend.tf is really only used when operating locally
# once the organization and workspace name are set
# there's no need to modify this file
terraform {
    backend "remote" {
        organization = "zanarkand"

        workspaces {
         name = "zanarkand"
        }
    }
}

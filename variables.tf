# inputs for the workspace to operate
# setting a default makes the variable optional
# the default value will be used
variable "lab_name" { 
    default = "zanarkand" 
}
variable "region" { 
    default = "eastus2" 
}
# below are env variables and only here to supress warnings
# (there may be other ways to surpress these warnings)
variable "ARM_CLIENT_ID" {}
variable "ARM_CLIENT_SECRET" {}
variable "ARM_SUBSCRIPTION_ID" {}
variable "ARM_TENANT_ID" {}

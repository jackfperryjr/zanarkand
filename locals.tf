locals {
    # list of users could be retrieved from api and passed to terraform via pipeline
    user_json = jsondecode(file("./users.json"))
}

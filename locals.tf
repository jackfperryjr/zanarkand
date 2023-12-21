locals {
    # users.json is downloaded in pipeline and
    # read into a local variable here
    user_json = jsondecode(file("./users.json"))
}

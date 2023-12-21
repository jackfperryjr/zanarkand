locals {
    users = [ # list of users could be retrieved from api and passed to terraform via pipeline
        "demo_user1",
        "demo_user2",
        "demo_user3",
        "demo_user4",
        "demo_user5"
    ]

    user_json = jsondecode(file("./users.json"))
}

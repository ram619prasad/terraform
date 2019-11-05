module "groups" {
  source = "../../resources/iam/groups/"
}

module "users" {
  source = "../../resources/iam/users/"

  user_name = module.users.name
  user_group = module.iam.name
}
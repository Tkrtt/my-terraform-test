data "vault_kv_secret_v2" "aws" {
  mount = "secret"
  name  = "aws"
}

data "vault_kv_secret_v2" "db_credentials" {
  mount = "secret"
  name  = "db_credentials"
}
#-------------------------------------------
# Required variables (do not add defaults here!)
#-------------------------------------------
variable "zone_name" {}
variable "domain_name" {}
variable "deno_acme" {}

#-------------------------------------------
# Configurable variables
#-------------------------------------------

variable "deno_a" {
  default = "34.120.54.55"
}
variable "deno_aaaa" {
  default = "2600:1901:0:6d85::"
}

#-------------------------------------------
# Main
#-------------------------------------------

data "cloudflare_zone" "domain" {
  name = var.zone_name
}

resource "cloudflare_record" "a" {
  zone_id = data.cloudflare_zone.domain.id
  name    = var.domain_name
  type    = "A"
  content = var.deno_a
  ttl     = 300
  proxied = false
}

resource "cloudflare_record" "aaaa" {
  zone_id = data.cloudflare_zone.domain.id
  name    = var.domain_name
  type    = "AAAA"
  content = var.deno_aaaa
  ttl     = 300
  proxied = false
}

resource "cloudflare_record" "acme" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "_acme-challenge.${var.domain_name}"
  type    = "CNAME"
  content = var.deno_acme
  ttl     = 300
  proxied = false
}

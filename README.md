# tf-deno-domain-cloudflare

Cloudflare DNS Terraform setup for a Deno Deploy Domain

```hcl
module "domain" {
  source      = "github.com/kyeotic/tf-deno-domain-cloudflare"
  zone_name   = "kye.dev"
  domain_name = "site.kye.dev"
  deno_acme   = "123456._acme.deno.dev."
}
```

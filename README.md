# Caddy Docker Custom Image

Caddy Docker Container with custom modules

I took the base caddy docker image; added below custom modules and built custom caddy docker container. I just followed "Building your own Caddy-based image" section in the below link

https://hub.docker.com/_/caddy?tab=description 

# Modules Included

## DNS

caddy-dns/cloudflare \
caddy-dns/dnspod \
caddy-dns/gandi \
caddy-dns/lego-deprecated \
caddy-dns/route53

## Authentication

greenpau/caddy-auth-jwt \
greenpau/caddy-auth-portal \
greenpau/caddy-trace

## Others

caddyserver/ntlm-transport \
abiosoft/hmac \
lolPants/caddy-requestid \
mholt/caddy-webdav

### Please find LICENSE link for caddy below 

https://github.com/caddyserver/caddy/blob/master/LICENSE

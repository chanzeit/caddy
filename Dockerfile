FROM caddy:2.3.0-builder-alpine AS builder

#COPY Caddyfile /etc/caddy/Caddyfile
#COPY site /srv

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-auth-jwt@latest \
    --with github.com/greenpau/caddy-auth-portal@latest \
    --with github.com/greenpau/caddy-trace \
    --with github.com/caddyserver/ntlm-transport \
    --with github.com/abiosoft/caddy-hmac \
    --with github.com/caddy-dns/dnspod \
    --with github.com/caddy-dns/gandi \
    --with github.com/caddy-dns/lego-deprecated \
    --with github.com/caddy-dns/route53 \
    --with github.com/caddy-dns/alidns \
    --with github.com/caddy-dns/azure \
    --with github.com/caddy-dns/digitalocean \
    --with github.com/caddy-dns/duckdns \
    --with github.com/caddy-dns/hetzner \
    --with github.com/caddy-dns/openstack-designate \
    --with github.com/caddy-dns/vultr \
    --with github.com/lolPants/caddy-requestid \
    --with github.com/mholt/caddy-webdav \
    --with github.com/nicolasazrak/caddy-cache \
    --with github.com/HeavenVolkoff/caddy-authelia \
    --with github.com/abiosoft/caddy-json-parse

FROM caddy:2.3.0-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

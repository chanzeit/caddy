FROM caddy:2.8.4-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/abiosoft/caddy-hmac \
    --with github.com/caddy-dns/dnspod \
    --with github.com/caddy-dns/gandi \
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
    --with github.com/abiosoft/caddy-json-parse \    
    --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/WeidiDeng/caddy-cloudflare-ip \
    --with github.com/fvbommel/caddy-combine-ip-ranges \
    --with github.com/mholt/caddy-l4 \
    --with github.com/caddyserver/transform-encoder \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http@main \
    --with github.com/hslatman/caddy-crowdsec-bouncer/layer4@main
    
FROM caddy:2.8.4-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

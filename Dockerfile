FROM caddy:2.2.1-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-auth-jwt \
    --with github.com/greenpau/caddy-auth-portal@v1.2.22 \
    --with github.com/greenpau/caddy-trace \
    --with github.com/caddyserver/ntlm-transport \
    --with github.com/abiosoft/caddy-hmac \
    --with github.com/caddy-dns/dnspod \
    --with github.com/caddy-dns/gandi \
    --with github.com/caddy-dns/lego-deprecated \
    --with github.com/caddy-dns/route53 \
    --with github.com/lolPants/caddy-requestid \
    --with github.com/mholt/caddy-webdav

FROM caddy:2.2.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

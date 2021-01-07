# Caddy Docker Custom Image

Caddy Docker Container with custom modules

I took the base caddy docker image; added below custom modules and built custom caddy docker container. I just followed "Building your own Caddy-based image" section in the below link

https://hub.docker.com/_/caddy?tab=description 

# Docker Compose
```
version: "3.7"

services:
  caddy:
    image: tuneitme/caddy
#rajaseg/caddy
    ports:
      - "80:80"
      - "443:443"
    networks:
      - caddy
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile
      - /mnt/caddysite:/usr/share/caddy
      - /mnt/caddysite-2:/etc/caddy/html/discuss.rajasekhar.rocks
      - /mnt/caddysite-3:/etc/caddy/html/jaeger.rajasekhar.rocks
      - /mnt/tuneit-blog:/etc/caddy/html/blog.tuneit.me
      - /mnt/hugo-site:/etc/caddy/html/hugo.tuneit.me
      - /mnt/caddydata:/data
      - /mnt/caddyconfig:/config
      - /mnt/caddylogs:/var/log/caddy
      - /mnt/ghostblog:/var/lib/ghost/content
      - /mnt/loki:/data/loki
      - /mnt/prometheus:/prometheus
      - /mnt/grafana:/var/lib/grafana
      - /mnt/commento-new:/var/lib/postgresql/data
      - /mnt/snikket:/snikket
      - /mnt/bludit:/usr/share/nginx/html/bl-content
#      - /mnt/gitea:/data
      - /mnt/drone:/var/lib/drone
    environment:
      ACME_AGREE: 'true'
    deploy:
      placement:
        constraints:
          - node.role == manager
      replicas: 1
      update_config:
        parallelism: 2
        delay: 10s
      restart_policy:
        condition: on-failure

volumes:
  caddysite:
    driver: "local"
  caddysite-2:
    driver: "local"
  caddysite-3:
    driver: "local"
  tuneit-blog:
    driver: "local"
  hugo-site:
    driver: "local"
  caddydata:
    driver: "local"
  caddyconfig:
    driver: "local"
  caddylogs:
    driver: "local"
  ghostblog:
    driver: "local"
  loki:
    driver: "local"
  prometheus:
    driver: "local"
  grafana:
    driver: "local"
  commento-new:
    driver: "local"
  snikket:
    driver: "local"
  bludit:
    driver: "local"
  drone:
    driver: "local"
  gitea:
    driver: "local"
networks:
  caddy:
    external: true
    ```
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

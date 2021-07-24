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

# Docker Compose

```
version: "3.7"

services:
  caddy:
    image: rajaseg/caddy
    ports:
      - "80:80"
      - "443:443"
    networks:
      - caddy
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile
      - /mnt/caddydata:/data
      - /mnt/caddyconfig:/config
      - /mnt/caddylogs:/var/log/caddy
      - /mnt/caddysite-1:/etc/caddy/html/site-1
      - /mnt/caddysite-2:/etc/caddy/html/site-2
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
  caddydata:
    driver: "local"
  caddyconfig:
    driver: "local"
  caddylogs:
    driver: "local"
  caddysite-1:
    driver: "local"
  caddysite-2:
    driver: "local"
networks:
  caddy:
    external: true
```

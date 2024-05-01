# Build Caddy image with Cloudflare DNS module
FROM caddy:builder-alpine AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/cloudflare@master \
  --with github.com/hslatman/caddy-crowdsec-bouncer/http

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

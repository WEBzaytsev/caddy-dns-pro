FROM caddy:2.11.3-builder-alpine AS builder

RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/mholt/caddy-ratelimit \
	--with github.com/WeidiDeng/caddy-cloudflare-ip \
	--with github.com/mholt/caddy-dynamicdns \
	--with github.com/WEBzaytsev/caddy-selectel@v1.4.0 \
	--with github.com/caddy-dns/timeweb

FROM caddy:2.11.3

COPY --from=builder /usr/bin/caddy /usr/bin/caddy


FROM caddy:null-builder-alpine AS builder

RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/mholt/caddy-dynamicdns \
	--with github.com/WEBzaytsev/caddy-selectel@v1.4.0

FROM caddy:null

COPY --from=builder /usr/bin/caddy /usr/bin/caddy


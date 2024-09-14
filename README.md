# nginx-proxy

Containerized nginx reverse proxy with configurable backends through environment variables.

## Usage

```bash
docker run \
  --name nginx-proxy \
  -e NGINX_PROXY_PASS="https://registry-1.docker.io" \
  -e NGINX_PROXY_HOST="registry-1.docker.io" \
  -p 8080:80 \
  -d ghcr.io/prinsss/nginx-proxy:latest
```

```bash
docker run \
  --name nginx-proxy \
  -e NGINX_PROXY_TYPE=redirect \
  -e NGINX_PROXY_REDIRECT_CODE=302 \
  -e NGINX_PROXY_REDIRECT_URL="https://hub.docker.com" \
  -p 8080:80 \
  -d ghcr.io/prinsss/nginx-proxy:latest
```

```bash
docker run \
  --name nginx-proxy \
  -e NGINX_PROXY_TYPE=remote \
  -e NGINX_PROXY_REMOTE_CONFIG_URL="https://github.com/h5bp/server-configs-nginx/raw/main/conf.d/no-ssl.default.conf" \
  -p 8080:80 \
  -d ghcr.io/prinsss/nginx-proxy:latest
```

## Environment Variables

- `PORT` - Port to listen on (default: `80`)
- `NGINX_PROXY_TYPE` - Type of proxy (available: `proxy`, `redirect`, `remote`, default: `proxy`)
- `NGINX_PROXY_PASS` - Backend URL to proxy to, required for `proxy` type
- `NGINX_PROXY_HOST` - Hostname passed to the backend, required for `proxy` type
- `NGINX_PROXY_REDIRECT_CODE` - Redirect status code, required for `redirect` type
- `NGINX_PROXY_REDIRECT_URL` - Redirect URL, required for `redirect` type
- `NGINX_PROXY_REMOTE_CONFIG_URL` - URL to fetch the configuration from, required for `remote` type
- `NGINX_PROXY_SERVER_EXTRA` - Extra configuration for the server block
- `NGINX_PROXY_LOCATION_EXTRA` - Extra configuration for the location block

## License

[MIT](LICENSE)

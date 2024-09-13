# nginx-proxy

Containerized nginx reverse proxy with configurable backends through environment variables.

## Usage

```bash
docker build -t nginx-proxy .
```

```bash
docker run \
  --name nginx-proxy \
  -e NGINX_PROXY_PASS="https://registry-1.docker.io" \
  -e NGINX_PROXY_HOST="registry-1.docker.io" \
  -p 8080:80 \
  -d nginx-proxy
```

## License

[MIT](LICENSE)

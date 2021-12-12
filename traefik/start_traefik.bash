#!/bin/bash
docker network create web
touch acme.json
chmod 600 acme.json
docker run -d -v /var/run/docker.sock:/var/run/docker.sock -v $PWD/traefik.toml:/traefik.toml -v $PWD/traefik_secure.toml:/traefik_secure.toml -v $PWD/acme.json:/acme.json -p 80:80 -p 443:443 --network web --name traefik traefik:v2.5

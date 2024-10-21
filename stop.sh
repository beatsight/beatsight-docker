#!/usr/bin/env bash

if [[ -f "../.env" ]]; then
    docker compose --env-file .env --env-file ../.env stop
else
    docker compose stop
fi

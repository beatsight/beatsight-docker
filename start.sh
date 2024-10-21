#!/usr/bin/env bash

if [[ -f "../.env" ]]; then
    docker compose --env-file .env --env-file ../.env up -d
else
    docker compose up -d
fi

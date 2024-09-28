#!/usr/bin/env bash

if [[ ! -f ".env.custom" ]]; then
    docker compose up -d
else
    docker compose --env-file .env.custom up -d
fi

#!/usr/bin/env bash

export $(cat .env | xargs)

docker-compose up -d --build
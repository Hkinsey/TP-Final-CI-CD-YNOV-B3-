#!/bin/sh
set -eu

TARGET_VERSION=${1:-""}

if [ -z "$TARGET_VERSION" ]; then
  echo "Usage: ./scripts/rollback.sh v1.0.0"
  exit 1
fi

echo "Rollback vers $TARGET_VERSION..."

# Sauvegarder avant rollback
sh ./scripts/backup.sh

# Rollback image API
docker compose stop api
docker tag shoplite-api:$TARGET_VERSION shoplite-api:current || true
APP_VERSION=$TARGET_VERSION docker compose up -d api

echo "Attente démarrage API..."
sleep 5

# Smoke test
curl -f http://localhost:8080/api/health && echo "API OK" || echo "API KO"

echo "Rollback $TARGET_VERSION terminé"

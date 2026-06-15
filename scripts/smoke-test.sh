#!/bin/sh
set -eu

BASE_URL=${1:-"http://localhost:8080"}

echo "Smoke tests sur $BASE_URL..."

curl -f "$BASE_URL/api/health" && echo " /health OK" || exit 1
curl -f "$BASE_URL/api/products" && echo " /products OK" || exit 1

echo "Tous les smoke tests sont verts"

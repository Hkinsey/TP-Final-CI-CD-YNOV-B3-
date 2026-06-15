#!/bin/sh
set -eu

BACKUP_DIR="./backups"
DATE=$(date +%Y%m%d_%H%M%S)
FILENAME="backup_${DATE}.sql"

mkdir -p "$BACKUP_DIR"

echo "Sauvegarde PostgreSQL..."
docker exec shoplite_db pg_dump -U ${POSTGRES_USER:-shoplite} ${POSTGRES_DB:-shoplite} > "$BACKUP_DIR/$FILENAME"

echo "Backup créé : $BACKUP_DIR/$FILENAME"

# Rétention : garder les 7 derniers dumps
ls -t "$BACKUP_DIR"/*.sql | tail -n +8 | xargs -r rm --
echo "Rétention appliquée : 7 derniers backups conservés"

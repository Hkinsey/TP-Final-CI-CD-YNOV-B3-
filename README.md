# ShopLite — Projet DevOps complet

![CI](https://github.com/Hkinsey/TP-Final-CI-CD-YNOV-B3-/actions/workflows/ci.yml/badge.svg)
![CD](https://github.com/Hkinsey/TP-Final-CI-CD-YNOV-B3-/actions/workflows/cd.yml/badge.svg)

Mini application e-commerce industrialisée avec une chaîne DevOps complète : Git, Docker, CI/CD, observabilité, backup et rollback.

## Stack technique

- API : Node.js / Express
- Base de données : PostgreSQL 16
- Frontend : HTML / CSS / JS (Nginx)
- Reverse proxy : Nginx
- CI/CD : GitHub Actions
- Containerisation : Docker + Docker Compose

## Lancement rapide (dev)

```bash
cp .env.example .env
docker compose up -d --build
```

Ouvrir : http://localhost:8080

## Lancement staging

```bash
docker compose -f docker-compose.yml -f docker-compose.staging.yml up -d --build
```

Ouvrir : http://localhost:8081

## Tester l'API

```bash
curl http://localhost:8080/api/health
curl http://localhost:8080/api/products
```

## Tests automatisés

```bash
cd api
npm install
npm test
```

## Backup PostgreSQL

```bash
sh scripts/backup.sh
```

Les dumps sont stockés dans `backups/` avec horodatage. Rétention : 7 derniers backups.

## Rollback

```bash
sh scripts/rollback.sh v1.0.0
```

## Environnements

| Environnement | URL locale | Branch/Tag |
|---|---|---|
| dev | http://localhost:8080 | feature/* → develop |
| staging | http://localhost:8081 | develop |
| production | http://localhost:8082 | tag v* |

## CI/CD

- CI : lint, tests (Node 20 + 22), build Docker, scan Trivy
- CD : deploy staging sur push develop, deploy prod sur tag v*

## Arrêter sans perdre les données

```bash
docker compose down
```

Ne jamais utiliser `docker compose down -v` en production.

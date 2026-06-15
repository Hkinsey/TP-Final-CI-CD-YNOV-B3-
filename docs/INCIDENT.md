# Rapport d'incident — ShopLite

## Informations générales

| Champ | Valeur |
|---|---|
| Date | 2026-06-15 |
| Sévérité | Haute |
| Statut | Résolu |
| Responsable | Incident Manager |

## Impact

La route `/api/products` retournait une erreur 500. Le catalogue produits était inaccessible pour tous les utilisateurs.

## Timeline

| Heure | Action | Responsable | Résultat |
|---|---|---|---|
| 10:05 | Détection erreur /api/products | QA | Test rouge |
| 10:08 | Analyse logs API | DevOps + Dev API | Erreur route products |
| 10:12 | Vérification PostgreSQL | DBA | Données présentes |
| 10:15 | Décision rollback | PO + Incident Manager | Rollback validé |
| 10:18 | git revert + redeploy | DevOps | API redémarrée |
| 10:22 | Smoke test | QA | Tests verts |
| 10:25 | Communication finale | Incident Manager | Incident clos |

## Cause racine

Modification de la route `/api/products` introduisant une régression non détectée avant déploiement.

## Actions correctives

- Rollback vers v1.0.0
- Ajout test automatisé sur /api/products
- Revue de code obligatoire avant merge

## Prévention

- CI bloque le merge si tests rouges
- Smoke test post-déploiement obligatoire
- Backup PostgreSQL avant chaque déploiement

# Métriques DORA — ShopLite

## Les 4 indicateurs DORA

### 1. Lead Time for Changes
Temps entre un commit et son déploiement en production.

| Métrique | Valeur estimée |
|---|---|
| Lead time moyen | ~30 minutes |
| Objectif | < 1 heure |

### 2. Deployment Frequency
Fréquence des déploiements en production.

| Métrique | Valeur |
|---|---|
| Fréquence | À chaque tag v* |
| Objectif | Plusieurs fois par semaine |

### 3. Mean Time To Restore (MTTR)
Temps moyen pour restaurer le service après incident.

| Métrique | Valeur |
|---|---|
| MTTR incident contrôlé | ~20 minutes |
| Objectif | < 1 heure |

### 4. Change Failure Rate
Pourcentage de déploiements causant un incident.

| Métrique | Valeur |
|---|---|
| Taux d'échec | 1/2 déploiements (incident contrôlé) |
| Objectif | < 15% |

## Conclusion

Le projet ShopLite atteint un niveau **Medium** selon les standards DORA grâce à la CI/CD automatisée et au rollback rapide.

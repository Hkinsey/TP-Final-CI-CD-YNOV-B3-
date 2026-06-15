# Matrice RACI — ShopLite

## Rôles

| Rôle | Personne |
|---|---|
| Product Owner (PO) | Membre 1 |
| Développeur API | Membre 2 |
| DevOps / Release Manager | Membre 3 |
| QA / Testeur | Membre 4 |
| Incident Manager | Membre 5 |

## Matrice

| Activité | PO | Dev API | DevOps | QA | Incident Manager |
|---|---|---|---|---|---|
| Créer la version stable Git | I | C | R/A | I | I |
| Mettre en place Docker Compose | I | C | R/A | I | I |
| Configurer la CI/CD | I | C | R/A | C | I |
| Ajouter le test /api/products | I | C | C | R/A | I |
| Sauvegarder PostgreSQL | I | I | R/A | I | I |
| Provoquer l'incident contrôlé | I | R | A | C | I |
| Diagnostiquer l'incident | C | R | R | R | A |
| Décider le rollback | A | C | C | C | R |
| Exécuter le rollback | I | I | R/A | I | I |
| Vérifier les données après rollback | I | I | C | R/A | I |
| Valider les tests après rollback | I | C | C | R/A | I |
| Rédiger le rapport d'incident | I | C | C | C | R/A |

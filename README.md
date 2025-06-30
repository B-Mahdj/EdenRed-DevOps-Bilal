# Démo CI/CD .NET & Infrastructure as Code – EdenRed

Ce projet est une démonstration technique visant à prouver mes compétences en CI/CD, automatisation, et bonnes pratiques DevOps, dans le cadre d’un processus de recrutement chez EdenRed.  
L’objectif principal n’est pas l’application elle-même, mais la mise en place d’une chaîne complète d’intégration et de déploiement continu, de la construction du code à la livraison sur le cloud, en passant par l’analyse de la qualité logicielle.

---

## 1. Présentation rapide

- **Application** : WebApp .NET simpliste qui n'est pas le focus ici. 
- **Focus** : Automatisation CI/CD, supply chain sécurisée, infrastructure as code (IaC), analyse de code, logging via OpenTelemetry.

---

## 2. Prérequis

- Un compte GitHub
- Un compte Azure (pour le déploiement cloud)
- Accès à SonarQube Cloud (pour l’analyse de code)

---

## 3. Configuration des secrets GitHub

Pour garantir la sécurité et l’automatisation, les variables sensibles sont stockées comme secrets dans le repository GitHub.  
**À renseigner dans les secrets du repo (`Settings > Secrets and variables > Actions`) :**

- `ARM_CLIENT_ID` : ID de l’Azure Service Principal
- `ARM_CLIENT_SECRET` : Secret du Service Principal Azure
- `ARM_SUBSCRIPTION_ID` : ID de la souscription Azure
- `ARM_TENANT_ID` : ID du tenant Azure
- `GHCR_TOKEN` : Token d’accès au GitHub Container Registry (pour push d’images Docker)

Les 4 premiers secrets permettent à Terraform de déployer l’infrastructure sur Azure.  
Le dernier (`GHCR_TOKEN`) permet à GitHub Actions de publier l’image Docker sur le registre GitHub.

---

## 4. Supply Chain CI/CD – De A à Z

Voici la chaîne automatisée mise en place :

1. **Arrivée du code**
   - Push sur le repo du nouveau code
2. **Analyse de code**
   - Analyse statique via SonarQube Cloud (pas présent sur le répo actuel)
3. **Containerisation**
   - Construction de l’image Docker à partir du Dockerfile
   - Publication de l’image sur GitHub Container Registry (GHCR)
4. **Infrastructure as Code**
   - Provisionnement de l’infrastructure Azure via Terraform (conteneur, etc.)
5. **Déploiement**
   - Déploiement automatisé de l’image sur l’infrastructure Azure provisionnée
6. **Sécurité & Traçabilité**
   - Utilisation de secrets GitHub pour toutes les informations sensibles
   - Logs et statuts visibles dans GitHub Actions
   - Logs de l'application envoyé via le framework Otel a une ressource app_insights

L’ensemble de cette chaîne est orchestré par des workflows GitHub Actions, déclenchés à chaque push ou pull request.

---

## 5. Lancer le projet localement (optionnel)

Pour tester l’application en local (pas très utile):

```bash
# 1. Cloner le repo
git clone <url-du-repo>
cd docker-dotnet-sample-main/dotnet-app

# 2. (Optionnel) Adapter la chaîne de connexion PostgreSQL dans appsettings.json

# 3. Lancer l’application
dotnet run

# 4. Ou via Docker
docker build -t dotnet-app .
docker run -p 8080:8080 dotnet-app

# 5. Voir le site en allant sur 
http://localhost:8080

```

---

N’hésitez pas à me contacter pour toute question technique ou pour une démonstration live de la chaîne CI/CD ! (bilal.mahdjoubi95@gmail.com)

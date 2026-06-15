# App Translator – DevOps Project

## Overview

אפליקציית תרגום מבוססת מיקרו-שירותים: Frontend, Backend (Node.js), Translator (LibreTranslate), ו-PostgreSQL.

הפרויקט מדגים: Docker, Kubernetes, Helm, CI/CD (GitHub Actions), AWS (S3, CloudFront, EC2, OIDC), Terraform, ו-Argo CD (GitOps).

---

## Architecture

| Service | Role | Port |
|---------|------|------|
| Frontend | Nginx – static UI | 80 |
| Backend | Node.js API | 3001 |
| Translator | LibreTranslate engine | 5000 |
| PostgreSQL | Translation history DB | 5432 |

**תיעוד מפורט ודיאגרמות:** [`docs/architecture.md`](docs/architecture.md)

---

## Repository Structure

```text
.
├── backend/                          # Node.js API
├── frontend/                         # Nginx static site
├── db/init.sql                       # DB schema
├── docker-compose.yml                # Local development
├── docker-compose.test.yaml          # CI integration tests
├── k8s/                              # Kubernetes manifests (legacy)
├── helm/app-translator/              # Helm chart – stage 1 (manual PostgreSQL)
├── HelmChartPostgress/               # Helm chart – stage 2 (Bitnami PostgreSQL)
│   ├── helm/postgresql/              # Local copy (reference only – not used in deploy)
│   └── my-app/app-translator/        # Production Helm chart
├── terraform/                        # AWS infrastructure (IaC)
├── argocd/                           # Argo CD Application manifest
├── docs/                             # Architecture docs & diagrams
├── .github/workflows/                # CI/CD pipelines
└── README.md
```

---

## Quick Start

### Docker Compose

```bash
docker compose build
docker compose up -d
# UI: http://localhost:8080
curl -X POST http://localhost:3001/translate \
  -H "Content-Type: application/json" \
  -d '{"text":"hello","target":"he"}'
```

### Kubernetes (manifests)

```bash
minikube start --nodes 3 --driver=docker
minikube addons enable ingress
kubectl apply -f k8s/
echo "$(minikube ip) translator.local" | sudo tee -a /etc/hosts
```

### Helm – Stage 1 (manual PostgreSQL)

```bash
helm lint ./helm/app-translator
helm install app-translator ./helm/app-translator
```

### Helm – Stage 2 (Bitnami PostgreSQL) – Production

```bash
cd HelmChartPostgress/my-app/app-translator
helm dependency update
helm lint .
helm install app-translator .
```

Expected pods: `app-translator-postgresql-0`, `backend`, `frontend`, `translator`

Verify DB table:
```bash
kubectl exec app-translator-postgresql-0 -- \
  bash -c "PGPASSWORD=postgres psql -U postgres -d translations -c '\dt'"
```

### Terraform (AWS)

```bash
cd terraform
cp terraform.tfvars.example terraform.tfvars
# Edit github_org and other values
terraform init
terraform plan
terraform apply
```

Outputs map to GitHub Secrets: `AWS_ROLE_ARN`, `S3_BUCKET_NAME`, `CLOUDFRONT_DISTRIBUTION_ID`

### Argo CD (GitOps)

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f \
  https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Update repoURL in argocd/application.yaml to your repo
kubectl apply -f argocd/application.yaml
kubectl port-forward svc/argocd-server -n argocd 8080:443
# UI: https://localhost:8080
```

---

## CI/CD Pipelines

| Workflow | Trigger | Stages |
|----------|---------|--------|
| `ci-backend.yaml` | `backend/**` | Unit Tests → Build → Integration → Push DockerHub → Tag |
| `ci-cd-frontend.yaml` | `frontend/**` | Build → S3 Deploy → CloudFront Invalidation |
| `cd-backend.yaml` | After push | Deploy to EC2 via SSH |

### Required GitHub Secrets

| Secret | Purpose |
|--------|---------|
| `DOCKERHUB_USERNAME` | Docker image push |
| `DOCKERHUB_TOKEN` | Docker image push |
| `AWS_ROLE_ARN` | OIDC authentication |
| `AWS_REGION` | AWS region |
| `S3_BUCKET_NAME` | Frontend bucket |
| `CLOUDFRONT_DISTRIBUTION_ID` | Cache invalidation |
| `EC2_HOST` / `EC2_SSH_KEY` | Backend deploy |

---

## Technologies

- **Containers:** Docker, Docker Compose
- **Orchestration:** Kubernetes (Minikube), Helm
- **CI/CD:** GitHub Actions, OIDC
- **Cloud:** AWS S3, CloudFront, EC2, IAM
- **IaC:** Terraform, Helm
- **GitOps:** Argo CD
- **Database:** PostgreSQL (manual StatefulSet + Bitnami chart)

---

## Known Fixes Applied

See full list in [`docs/architecture.md`](docs/architecture.md#תיקונים-שבוצעו).

Key HelmChartPostgress fixes:
- PostgreSQL dependency version `18.5.1` (was `12.x.x`)
- Added `postgresql` values (auth, initdb script, persistence)
- Dynamic `DATABASE_URL` using `{{ .Release.Name }}-postgresql`
- Ingress rewrite annotations for `/api` routing
- Fixed `imagePullPolicy` on translator deployment

---

## Project Evolution

```text
Docker Compose → Kubernetes manifests → Helm (manual DB) → Helm + Bitnami PostgreSQL → CI/CD → AWS → Terraform → Argo CD
```

---

## Maintainer

Esti Genauer – genauer1997@gmail.com

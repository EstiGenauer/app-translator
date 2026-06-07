# App Translator – DevOps Project 🌍

## Overview

App Translator is a cloud-native microservices application that enables users to translate text between languages and store translation history.

The project focuses on DevOps engineering practices, including containerization, Kubernetes orchestration, Helm packaging, CI/CD automation, and AWS cloud deployment.

---

## Architecture

The system is built using a microservices architecture:

- **Frontend** – Nginx-based static web UI
- **Backend (Node.js)** – Handles API requests and business logic
- **Translator (LibreTranslate)** – Provides translation services
- **PostgreSQL** – Stores translation history (managed via Helm)

---

## Deployment Evolution

The infrastructure was built in progressive stages:

- **Kubernetes Manifests** – Initial manual YAML deployment
- **Basic Helm Charts** – Introduction of templated deployments
- **Helm Full-Stack Architecture (Final Stage)**
  - Unified deployment using Helm
  - PostgreSQL integrated via Bitnami Helm dependency
  - Single release deploying the full system

---

## DevOps Stack

### Containerization
- Docker
- Docker Compose (local development)

### Orchestration
- Kubernetes (Minikube)
- Helm (Full-stack deployment with dependencies)

### CI/CD
- GitHub Actions
- Automated Docker image build & deployment pipelines

### Cloud (AWS)
- S3 – frontend hosting
- CloudFront – content delivery
- EC2 – backend services
- IAM + OIDC – secure GitHub authentication

### Security
- Kubernetes Secrets
- Least privilege access (IAM roles)

---

## Helm Deployment

```bash
cd helm/app-translator
helm dependency update
helm install app-translator .
```

This deploys both the application and PostgreSQL database as a single release.

---

## Running Locally

```bash
docker compose build
docker compose up -d
```

---

## Kubernetes Deployment

```bash
kubectl apply -f k8s/
```

---

## CI/CD Pipeline

- Triggered on push and pull requests
- Builds Docker images
- Runs validation checks
- Deploys automatically to Kubernetes / AWS

---

## Repository Structure

```text
.
├── backend/
├── frontend/
├── helm/
│   └── app-translator/
├── k8s/
├── HelmChartPostgress/
├── .github/workflows/
├── docker-compose.yml
└── README.md
```

---

## Key Features

- Microservices architecture
- Full containerization with Docker
- Kubernetes deployment
- Helm-based full-stack deployment
- PostgreSQL Helm dependency (Bitnami)
- CI/CD automation with GitHub Actions
- AWS cloud deployment
- Infrastructure as Code (IaC)
- Production-style deployment pipeline

---

## Project Goal

To demonstrate real-world DevOps engineering skills including:

- Cloud-native application design
- Kubernetes orchestration
- Helm packaging and dependency management
- CI/CD automation
- AWS infrastructure integration
```

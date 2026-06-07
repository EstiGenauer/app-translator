# App Translator – DevOps Project 🌍

## Overview

This repository focuses on DevOps, Infrastructure, CI/CD, Kubernetes, Helm, and AWS deployment of a translation application built using a microservices architecture.

The application enables users to translate text between languages, store translation history, and interact through a web interface.

My contribution focused on DevOps and Cloud Engineering aspects, including containerization, orchestration, infrastructure automation, CI/CD pipelines, Kubernetes deployment, Helm-based architecture, and AWS integration.

---

## Architecture

The application consists of four services:

### Frontend
- Static web application served via Nginx
- Provides the user interface for translation requests

### Backend (Node.js)
- Handles API requests
- Communicates with the Translator service
- Stores translation history in PostgreSQL

### Translator (LibreTranslate)
- Translation engine responsible for language translation

### Database (PostgreSQL)
- Stores translation records
- Managed via Helm-based deployment using Bitnami PostgreSQL chart integration

---

## Deployment Architecture (Important)

The system has two Helm-based implementations:

### 1. Initial Helm Setup (Development Stage)
- Basic Helm chart for application deployment
- Used for early Kubernetes packaging and testing

### 2. Production Helm Deployment (Final Stage)
- Located in `HelmChartPostgress/`
- Full-stack Helm deployment (application + PostgreSQL)
- PostgreSQL is integrated using the Bitnami Helm chart
- Single Helm release deploys the entire system

---

## DevOps Responsibilities

### Containerization
- Dockerized all application services
- Multi-container orchestration using Docker Compose

### Kubernetes
- Deployments
- Services
- Ingress
- Persistent Volume Claims (PVC)
- Internal service communication via Kubernetes DNS

### Helm
- Progressive migration from Kubernetes manifests to Helm
- Implemented full-stack Helm deployment architecture
- Managed PostgreSQL using Bitnami Helm dependency
- Enabled single-command deployment of the entire system

### CI/CD
- Automated build and deployment pipelines using GitHub Actions
- Docker image build and push automation
- Continuous Integration workflows for validation and testing

### Cloud Infrastructure (AWS)
- S3 for static frontend hosting
- CloudFront for global content delivery and caching
- EC2 for backend services
- IAM Roles and OIDC authentication for secure GitHub Actions integration
- Automated deployment workflows from GitHub to AWS

### Security
- Kubernetes Secrets management
- Secure authentication using AWS IAM and GitHub OIDC
- Least privilege access principles

---

## Technologies Used

### Containerization
- Docker
- Docker Compose

### Orchestration
- Kubernetes (Minikube)
- Helm (Full-stack deployment with dependencies)

### CI/CD
- GitHub Actions
- GitHub

### Cloud
- AWS EC2
- AWS S3
- AWS CloudFront
- AWS IAM
- OIDC Federation

### Backend
- Node.js

### Database
- PostgreSQL

### Web Server
- Nginx

### Operating System
- Linux

---

## Features

- Microservices architecture
- Full containerization with Docker
- Kubernetes deployment
- Helm-based full-stack deployment
- PostgreSQL Helm dependency (Bitnami)
- CI/CD automation with GitHub Actions
- AWS cloud deployment
- Infrastructure as Code (IaC)
- Production-style deployment pipeline
- Progressive evolution: Kubernetes → Helm → Helm full-stack architecture

---

## Running Locally with Docker Compose

```bash
docker compose build
docker compose up -d
```

---

## Kubernetes Deployment

Deploy using Kubernetes manifests:

```bash
kubectl apply -f k8s/
```

Or deploy using Helm (initial setup):

```bash
helm dependency update ./helm/app-translator
helm install app-translator ./helm/app-translator
```

Or deploy production Helm stack:

```bash
cd HelmChartPostgress/my-app
helm dependency update
helm install app-translator .
```

---

## CI/CD Pipeline

### Continuous Integration (CI)
Triggered on:
- Push
- Pull Request

Steps:
- Build Docker images
- Validate configuration
- Run automated checks

### Continuous Deployment (CD)
- Docker image publishing
- Kubernetes deployment updates
- AWS infrastructure deployment automation

---

## Repository Structure

```text
.
├── backend/
├── frontend/
├── helm/
│   └── app-translator/        # Initial Helm setup (development)
├── k8s/                       # Initial Kubernetes manifests (legacy)
├── HelmChartPostgress/        # Production Helm full-stack deployment
│   ├── helm/postgresql/       # Bitnami PostgreSQL dependency
│   ├── my-app/                # Application Helm chart
│   ├── charts/
│   ├── templates/
│   ├── Chart.yaml
│   └── values.yaml
├── .github/workflows/
├── docker-compose.yml
└── README.md
```

---

## AWS Infrastructure

### S3
Hosts the static frontend application.

### CloudFront
Provides global content delivery and caching.

### EC2
Runs backend services.

### IAM & OIDC
Secure authentication between GitHub Actions and AWS without long-term credentials.

---

## Best Practices Applied

- Microservices Architecture
- Containerization
- Infrastructure as Code (IaC)
- CI/CD Automation
- Cloud-Native Deployment
- Helm-based architecture
- Secure secret handling
- Least privilege access control
- Progressive infrastructure evolution

---

## Project Goal

To demonstrate real-world DevOps engineering skills including:

- Docker
- Kubernetes
- Helm (including full-stack Helm deployments)
- GitHub Actions
- AWS
- CI/CD
- Cloud Infrastructure
- Microservices architecture
- Infrastructure automation

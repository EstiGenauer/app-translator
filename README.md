# App Translator – DevOps Project 🌍

## Overview

This project demonstrates the deployment and management of a microservices-based translation application using modern DevOps practices and cloud-native technologies.

The application itself consists of multiple services that provide text translation capabilities and translation history management. My focus in this project was the DevOps implementation, including containerization, orchestration, deployment automation, infrastructure configuration, and service management.

---

## Architecture

The application consists of four services:

### Frontend

* Static web application served through Nginx
* Provides the user interface for translation requests

### Backend (Node.js)

* Exposes REST APIs
* Communicates with the translation service
* Stores translation history in PostgreSQL

### PostgreSQL Database

* Stores translation records
* Uses persistent storage for data durability

### Translator Service (LibreTranslate)

* Handles text translation between languages

---

## DevOps Responsibilities

As part of this project, I was responsible for:

* Containerizing application services using Docker
* Creating multi-container environments with Docker Compose
* Deploying workloads to Kubernetes
* Configuring Deployments, Services, Ingresses, ConfigMaps, and Secrets
* Implementing Persistent Volume Claims (PVCs) for data persistence
* Packaging Kubernetes resources using Helm Charts
* Managing service-to-service communication inside the cluster
* Building CI/CD workflows using GitHub Actions
* Troubleshooting deployments and cluster networking
* Managing Linux-based environments

---

## Technologies Used

### Containerization

* Docker
* Docker Compose

### Orchestration

* Kubernetes (Minikube)

### Package Management

* Helm

### CI/CD

* GitHub Actions

### Infrastructure & OS

* Linux

### Application Stack

* Node.js
* PostgreSQL
* Nginx
* LibreTranslate

---

## Key Features

* Microservices-based architecture
* Dockerized services
* Multi-container orchestration
* Kubernetes deployments
* Ingress-based traffic routing
* Persistent storage with PVC
* Internal Kubernetes DNS communication
* Automated CI/CD workflows
* Translation history persistence

---

## Running with Docker Compose

```bash
docker compose build
docker compose up -d
```

---

## Kubernetes Deployment

```bash
kubectl apply -f k8s/
```

Or using Helm:

```bash
helm dependency update ./helm/app-translator
helm install app-translator ./helm/app-translator
```

---

## CI/CD Pipeline

### Continuous Integration (CI)

* Automated build validation
* Docker image creation
* Basic testing and verification

### Continuous Deployment (CD)

* Automated deployment workflow
* Kubernetes-ready deployment process

---

## Repository Structure

```text
├── backend/            # Application API
├── frontend/           # Web interface
├── helm/               # Helm charts
├── k8s/                # Kubernetes manifests
├── .github/workflows/  # CI/CD pipelines
└── docker-compose.yml  # Local environment
```

---

## DevOps Concepts Demonstrated

* Containerization
* Kubernetes Orchestration
* Helm Packaging
* CI/CD Automation
* Infrastructure as Code
* Persistent Storage Management
* Service Discovery
* Cluster Networking
* Configuration Management

---

Project developed as a DevOps learning project to demonstrate containerization, Kubernetes administration, Helm packaging, and CI/CD implementation.

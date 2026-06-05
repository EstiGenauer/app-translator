# App Translator – DevOps Project 🌍

## Overview

This repository focuses on the DevOps, Infrastructure, CI/CD, Kubernetes, and AWS deployment of a translation application built using a microservices architecture.

The application enables users to translate text between languages, store translation history, and interact through a web interface.

My contribution to this project focused on the DevOps and Cloud Engineering aspects, including containerization, orchestration, infrastructure automation, CI/CD pipelines, Kubernetes deployment, and AWS integration.

---

## Architecture

The application consists of four services:

### Frontend

* Static web application served via Nginx
* Provides the user interface for translation requests

### Backend (Node.js)

* Handles API requests
* Communicates with the Translator service
* Stores translation history in PostgreSQL

### Database (PostgreSQL)

* Stores translation records
* Uses persistent storage through Volumes and Kubernetes PVCs

### Translator (LibreTranslate)

* Translation engine responsible for language translation

---

## DevOps Responsibilities

### Containerization

* Dockerized all application services
* Multi-container orchestration using Docker Compose

### Kubernetes

* Deployments
* Services
* Ingress
* Persistent Volume Claims (PVC)
* Internal service communication via Kubernetes DNS

### CI/CD

* Automated build and deployment pipelines using GitHub Actions
* Docker image build and push automation
* Continuous Integration workflows for code validation

### Cloud Infrastructure (AWS)

* S3 for static frontend hosting
* CloudFront for content delivery and caching
* EC2 for backend deployment
* IAM Roles and OIDC authentication for secure GitHub Actions integration
* Automated deployment workflows from GitHub to AWS

### Security

* Kubernetes Secrets management
* Secure authentication using AWS IAM and GitHub OIDC

---

## Technologies Used

### Containerization

* Docker
* Docker Compose

### Orchestration

* Kubernetes (Minikube)
* Helm Charts

### CI/CD

* GitHub Actions
* GitHub

### Cloud

* AWS EC2
* AWS S3
* AWS CloudFront
* AWS IAM
* OIDC Federation

### Backend

* Node.js

### Database

* PostgreSQL

### Web Server

* Nginx

### Operating System

* Linux

---

## Features

* Microservices Architecture
* Dockerized Services
* Docker Compose Local Environment
* Kubernetes Deployment
* Helm-based Application Packaging
* Persistent Storage with PVC
* Internal Kubernetes Networking
* CI/CD Automation
* Cloud Deployment on AWS
* Secure Authentication with OIDC
* Translation History Storage
* Infrastructure as Code Principles

---

## Running Locally with Docker Compose

Build and start all services:

```bash
docker compose build
docker compose up -d
```

Verify running containers:

```bash
docker ps
```

---

## Kubernetes Deployment

Deploy the application using Kubernetes manifests:

```bash
kubectl apply -f k8s/
```

Or deploy using Helm:

```bash
helm dependency update ./helm/app-translator
helm install app-translator ./helm/app-translator
```

Verify resources:

```bash
kubectl get pods
kubectl get svc
kubectl get ingress
```

---

## CI/CD Pipeline

### Continuous Integration (CI)

Automatically triggered on:

* Push
* Pull Request

Pipeline actions:

* Build Docker images
* Validate application configuration
* Run automated checks

### Continuous Deployment (CD)

Deployment automation includes:

* Docker image publishing
* Kubernetes deployment updates
* AWS deployment workflows
* Infrastructure delivery automation

---

## Repository Structure

```text
.
├── backend/                # Node.js API
├── frontend/               # Static website and Nginx configuration
├── helm/                   # Helm charts
├── k8s/                    # Kubernetes manifests
├── .github/workflows/      # GitHub Actions CI/CD pipelines
├── docker-compose.yml      # Local development environment
└── README.md
```

---

## AWS Infrastructure

### S3

Hosts the static frontend application.

### CloudFront

Provides global content delivery and caching.

### EC2

Runs the backend application and related services.

### IAM & OIDC

Provides secure authentication between GitHub Actions and AWS without storing long-term access keys.

---

## Best Practices Applied

* Microservices Architecture
* Containerization
* Infrastructure as Code (IaC)
* CI/CD Automation
* Cloud-Native Deployment
* Persistent Data Management
* Secure Secret Handling
* Least Privilege Access Control
* Automated Delivery Pipelines

---

## Project Goal

This project was developed as part of DevOps Engineering studies to demonstrate practical experience with:

* Docker
* Kubernetes
* Helm
* GitHub Actions
* AWS
* CI/CD
* Cloud Infrastructure
* Microservices Deployment
* Infrastructure Automation

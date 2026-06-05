# app-translator
הפרויקט הוא אפליקציית תרגום Full Stack המבוססת על ארכיטקטורת מיקרו־שירותים, ומנוהלת באמצעות כלי DevOps מודרניים.
המערכת מאפשרת למשתמשים לתרגם טקסט בין שפות, לשמור היסטוריית תרגומים, ולהשתמש בממשק וובי נוח.



#  App Translator – DevOps Project

##  Overview
This project is a full-stack translation application built using a microservices architecture and deployed with modern DevOps tools.
The system allows users to translate text between languages, store translation history, and interact through a web interface.

---

##  Architecture

The system is composed of 4 microservices:

### 1. Frontend
- Static web application served via Nginx
- Provides user interface for text translation

### 2. Backend (Node.js)
- Handles API requests
- Communicates with the Translator service
- Stores translation history in PostgreSQL

### 3. Database (PostgreSQL)
- Stores translation records
- Uses persistent storage (Volumes / PVC in Kubernetes)

### 4. Translator (LibreTranslate)
- External service responsible for translating text between languages

---

## ⚙️ Technologies Used

- Docker & Docker Compose
- Kubernetes (Minikube)
- Node.js
- PostgreSQL
- Nginx
- Git & GitHub
- Terraform (basic exposure)
- Linux

---

## 🚀 Features

- Microservices architecture
- Containerized services using Docker
- Multi-container orchestration with Docker Compose
- Kubernetes deployment (Deployments, Services, Ingress)
- Persistent storage using PVC
- Internal service communication via Kubernetes DNS
- API testing using curl / Postman
- Translation history stored in database

---

## 🐳 Running with Docker Compose

### Build and run all services:
docker compose build
docker compose up -d










# App Translator – DevOps Project 🌍

הפרויקט הוא אפליקציית תרגום Full Stack המבוססת על ארכיטקטורת מיקרו־שירותים, ומנוהלת באמצעות כלי DevOps מודרניים. המערכת מאפשרת למשתמשים לתרגם טקסט בין שפות, לשמור היסטוריית תרגומים, ולהשתמש בממשק וובי נוח.

## Overview
This project is a full-stack translation application built using a microservices architecture and deployed with modern DevOps tools. The system allows users to translate text between languages, store translation history, and interact through a web interface.

## 🏗️ Architecture
The system is composed of 4 microservices:
1. **Frontend**: Static web application served via Nginx. Provides user interface for text translation.
2. **Backend (Node.js)**: Handles API requests, communicates with the Translator service, and stores translation history in PostgreSQL.
3. **Database (PostgreSQL)**: Stores translation records. Uses persistent storage (Volumes / PVC in Kubernetes).
4. **Translator (LibreTranslate)**: External service responsible for translating text between languages.

## ⚙️ Technologies Used
* **Containerization**: Docker & Docker Compose
* **Orchestration**: Kubernetes (Minikube)
* **Packaging**: Helm Charts
* **Backend**: Node.js
* **Database**: PostgreSQL
* **Web Server**: Nginx
* **CI/CD & Source Control**: Git & GitHub Actions
* **OS**: Linux

## 🚀 Features
* Microservices architecture
* Containerized services using Docker
* Multi-container orchestration with Docker Compose
* Kubernetes deployment (Deployments, Services, Ingress)
* Persistent storage using PVC
* Internal service communication via Kubernetes DNS
* API testing using curl / Postman
* Translation history stored in database

## 🐳 Running with Docker Compose
To build and run all services locally:

```bash
docker compose build
docker compose up -d
☸️ Kubernetes Deployment
To deploy the application to a Kubernetes cluster (e.g., Minikube):

Bash
# Apply deployments and services
kubectl apply -f k8s/

# Or using Helm (Recommended)
helm dependency update ./helm/app-translator
helm install app-translator ./helm/app-translator
🔄 CI/CD Pipeline
The project incorporates automated CI/CD workflows using GitHub Actions:

CI: Automated builds and unit tests on every Push/PR.

CD: Automatic deployment process (GitOps oriented).

📁 Repository Structure
Plaintext
├── backend/            # Node.js API logic
├── frontend/           # Static assets & Nginx config
├── helm/               # Helm charts for K8s orchestration
├── k8s/                # Kubernetes manifest files
├── .github/workflows/  # CI/CD pipelines
└── docker-compose.yml  # Local orchestration
🛡️ Best Practices Applied
Separation of Concerns: Each microservice runs in its own container.

Infrastructure as Code (IaC): Environment managed via K8s and Helm.

Persistence: Data safety using Persistent Volume Claims (PVC).

Security: Sensitive data managed via Kubernetes Secrets.

Project developed as part of DevOps Engineering studies.


בהצלחה עם הדחיפה ל-Git! אם תצטרכי עזרה נוספת עם ה-Helm או ה-CI/CD, אני כאן.

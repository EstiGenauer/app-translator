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

# תיעוד וארכיטקטורה – App Translator

מסמך זה מסכם את ארכיטקטורת המערכת, זרימות הפריסה, והסברים לפי דרישות הפרויקט.

## תוכן עניינים

1. [ארכיטקטורת Docker Compose](#ארכיטקטורת-docker-compose)
2. [ארכיטקטורת Kubernetes](#ארכיטקטורת-kubernetes)
3. [Helm – שלב ראשון ושלב PostgreSQL](#helm)
4. [CI/CD Pipeline](#cicd-pipeline)
5. [Terraform + AWS](#terraform--aws)
6. [Argo CD ו-GitOps](#argo-cd-ו-gitops)
7. [תיקונים שבוצעו בפרויקט](#תיקונים-שבוצעו)

---

## ארכיטקטורת Docker Compose

ראו: [diagrams/01-docker-compose.md](diagrams/01-docker-compose.md)

ארבעה שירותים על רשת `appnet`:

| שירות | תפקיד | פורט |
|--------|--------|------|
| `frontend` | ממשק משתמש (Nginx) | 8080 → 80 |
| `backend` | API Node.js | 3001 |
| `translator` | LibreTranslate | 5000 |
| `db` | PostgreSQL | 5432 |

זרימה: משתמש → Frontend → Backend → Translator + DB

---

## ארכיטקטורת Kubernetes

ראו: [diagrams/02-kubernetes.md](diagrams/02-kubernetes.md)

כל שירות מיוצג כ-Deployment + Service. PostgreSQL כ-StatefulSet עם PVC.
Ingress (`translator.local`) מנתב:
- `/` → frontend-service:80
- `/api` → backend-service:3001

---

## Helm

### שלב א' – `helm/app-translator/`
Chart בסיסי עם StatefulSet ידני ל-PostgreSQL.

### שלב ב' – `HelmChartPostgress/my-app/app-translator/`
Chart מלא עם **Bitnami PostgreSQL dependency** (גרסה 18.5.1).

> **שימו לב:** התיקייה `HelmChartPostgress/helm/postgresql/` מכילה עותק מקומי של ה-chart – **לא נדרש לפריסה**. הפריסה הנכונה משתמשת ב-`helm dependency update` שמוריד את ה-chart ל-`charts/`.

פקודות פריסה:
```bash
cd HelmChartPostgress/my-app/app-translator
helm dependency update
helm install app-translator .
```

---

## CI/CD Pipeline

ראו: [diagrams/03-cicd.md](diagrams/03-cicd.md)

### Backend (`ci-backend.yaml`)
Unit Tests → Build → Integration Tests → Push DockerHub → Tag → Notification

### Frontend (`ci-cd-frontend.yaml`)
Build → Deploy S3 → Invalidate CloudFront (OIDC, ללא Access Keys)

### Backend CD (`cd-backend.yaml`)
Deploy ל-EC2 דרך SSH

---

## Terraform + AWS

ראו: [diagrams/04-aws-terraform.md](diagrams/04-aws-terraform.md)

Terraform מגדיר:
- S3 (פרטי) + CloudFront + OAC
- IAM Role ל-GitHub Actions (OIDC)
- EC2 אופציונלי ל-Backend

```bash
cd terraform
cp terraform.tfvars.example terraform.tfvars
# ערכי את הערכים
terraform init
terraform plan
terraform apply
```

---

## Argo CD ו-GitOps

ראו: [diagrams/05-argocd-gitops.md](diagrams/05-argocd-gitops.md)

Argo CD מסנכרן את ה-Cluster עם Git (מקור האמת).
קובץ ההגדרה: `argocd/application.yaml`

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl apply -f argocd/application.yaml
```

---

## תיקונים שבוצעו

| בעיה | תיקון |
|------|--------|
| `Chart.yaml` – גרסת postgresql `12.x.x` | עודכן ל-`18.5.1` |
| `values.yaml` – חסרה הגדרת postgresql | נוספו auth, initdb, persistence |
| `DATABASE_URL` קשיח ב-backend | הוחלף ב-template דינמי עם `{{ .Release.Name }}-postgresql` |
| Ingress ללא rewrite | נוספו annotations לניתוב `/api` |
| `imagePullPolicy: Never` ב-translator | שונה ל-`IfNotPresent` |
| `postgress.yaml` (שגיאת כתיב) | שונה ל-`postgres.yaml` |
| translator לא על רשת ב-compose | נוסף ל-`appnet` |
| חסר `docker-compose.test.yaml` | נוצר לבדיקות CI |
| חסר Terraform | נוספה תיקיית `terraform/` |
| חסר ArgoCD | נוסף `argocd/application.yaml` |

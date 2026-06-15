# דיאגרמת CI/CD

```mermaid
flowchart TD
    subgraph BackendCI [Backend CI - GitHub Actions]
        UT[Unit Tests]
        BLD[Build Docker Image]
        IT[Integration Tests<br/>docker-compose.test.yaml]
        PUSH[Push to DockerHub]
        TAG[Git Tag]
        EC2[Deploy to EC2]
        UT --> BLD --> IT --> PUSH --> TAG --> EC2
    end

    subgraph FrontendCI [Frontend CI/CD]
        FB[Verify Files]
        S3[Sync to S3]
        CF[Invalidate CloudFront]
        FB --> S3 --> CF
    end

    GH[Git Push to main] --> BackendCI
    GH --> FrontendCI
```

## Secrets נדרשים ב-GitHub

| Secret | שימוש |
|--------|--------|
| `DOCKERHUB_USERNAME` | Push images |
| `DOCKERHUB_TOKEN` | Push images |
| `AWS_ROLE_ARN` | OIDC ל-AWS |
| `AWS_REGION` | אזור |
| `S3_BUCKET_NAME` | Frontend bucket |
| `CLOUDFRONT_DISTRIBUTION_ID` | Cache invalidation |
| `EC2_HOST` / `EC2_SSH_KEY` | Deploy backend |

## עקרונות

- פריסה רק אחרי שכל הבדיקות עברו
- OIDC במקום Access Keys קבועים
- תיוג אוטומטי לפי commit SHA

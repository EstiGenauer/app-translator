# דיאגרמת Helm + PostgreSQL (Bitnami)

```mermaid
flowchart TB
    subgraph HelmRelease [Helm Release: app-translator]
        CHART[app-translator Chart]
        subgraph Templates
            BE[backend.yaml]
            FE[frontend.yaml]
            TR[translator.yaml]
            ING[ingress.yaml]
        end
        subgraph Dependency
            PG_CHART[postgresql Chart<br/>Bitnami 18.5.1]
            STS[StatefulSet postgresql-0]
            SVC[Service app-translator-postgresql]
        end
        CHART --> Templates
        CHART --> PG_CHART
        PG_CHART --> STS
        PG_CHART --> SVC
    end

    BE -->|DATABASE_URL| SVC
```

## לפני ואחרי

| | StatefulSet ידני | Bitnami Helm |
|---|------------------|--------------|
| קוד | ~90 שורות YAML | הגדרה ב-values.yaml |
| תחזוקה | ידנית | `helm upgrade` |
| Rollback | קשה | `helm rollback` |
| Init SQL | ConfigMap | `postgresql.primary.initdb.scripts` |

## DATABASE_URL דינמי

```
postgres://{{ user }}:{{ password }}@{{ .Release.Name }}-postgresql:5432/{{ database }}
```

שם ה-Service נגזר משם ה-release (`app-translator-postgresql`).

## בעיות נפוצות

1. **הטבלה לא קיימת** – PVC ישן. פתרון: `helm uninstall` + `kubectl delete pvc --all`
2. **502 Bad Gateway** – בדקי `DATABASE_URL` ב-logs של backend
3. **Chart.lock חסר** – הריצי `helm dependency update`

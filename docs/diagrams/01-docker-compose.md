# דיאגרמת Docker Compose

```mermaid
flowchart LR
    User([משתמש / דפדפן])
    FE[frontend<br/>Nginx :8080]
    BE[backend<br/>Node.js :3001]
    TR[translator<br/>LibreTranslate :5000]
    DB[(db<br/>PostgreSQL :5432)]

    User -->|HTTP :8080| FE
    FE -->|/api/* proxy| BE
    BE -->|POST /translate| TR
    BE -->|SQL INSERT/SELECT| DB

    subgraph appnet [רשת appnet]
        FE
        BE
        TR
        DB
    end
```

## הסבר

- **frontend** – מגיש קבצים סטטיים ומפנה בקשות API ל-backend (בסביבת Compose בלבד).
- **backend** – מקבל בקשות תרגום, פונה ל-translator, שומר היסטוריה ב-DB.
- **translator** – מבצע את התרגום בפועל (LibreTranslate).
- **db** – שומר טבלת `translations` עם `source_text`, `target_lang`, `translated_text`.

## פקודות בדיקה

```bash
docker compose build
docker compose up -d
curl -X POST http://localhost:3001/translate \
  -H "Content-Type: application/json" \
  -d '{"text":"hello","target":"he"}'
```

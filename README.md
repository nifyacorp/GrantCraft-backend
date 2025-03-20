# GrantCraft Backend

This is the backend component of GrantCraft, based on Python FastAPI.

## Setup

1. Install Poetry:
```bash
pip install poetry
```

2. Install dependencies:
```bash
poetry install
```

3. Run the development server:
```bash
poetry run python -m reworkd_platform
```

## Deployment

This project is configured for deployment on Google Cloud Run. See the GitHub Actions workflow in `.github/workflows`.

## Environment Variables

Key environment variables to configure:
- `REWORKD_PLATFORM_OPENAI_API_KEY`: OpenAI API key
- `REWORKD_PLATFORM_DATABASE_URL`: MySQL database connection string
- `REWORKD_PLATFORM_FRONTEND_URL`: URL of the frontend application

See the Cloud Run deployment documentation for a complete list.

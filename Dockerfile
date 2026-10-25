FROM python:3.12-slim

# Pobranie menedżera uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

COPY . .

RUN uv sync --no-cache

EXPOSE 8000

# Włączenie trybu HTTP (--http) oraz wystawienie na port 8000
CMD ["uv", "run", "garmin-personal-mcp", "--http", "--host", "0.0.0.0", "--port", "8000"]

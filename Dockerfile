FROM python:3.12-slim

# Pobranie menedżera uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

COPY . .

# Usunięto flagę --frozen
RUN uv sync --no-cache

EXPOSE 8000

CMD ["uv", "run", "garmin-personal-mcp", "--host", "0.0.0.0", "--port", "8000"]

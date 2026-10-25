FROM python:3.12-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

COPY . .

RUN uv sync --no-cache

EXPOSE 8000

CMD ["uv", "run", "garmin-personal-mcp", "--http", "--host", "0.0.0.0", "--port", "8000", "--allowed-host", "*"]

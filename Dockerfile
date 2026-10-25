FROM python:3.12-slim

# Pobranie menedżera uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

COPY . .

# Instalacja zależności z pyproject.toml
RUN uv sync --frozen --no-cache

EXPOSE 8000

# Uruchomienie serwera MCP w trybie HTTP na porcie podanym przez Railway
CMD ["uv", "run", "garmin-personal-mcp", "--host", "0.0.0.0", "--port", "8000"]

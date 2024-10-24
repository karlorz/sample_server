# Dockerfile
FROM python:3.8-slim

WORKDIR /app

COPY sample_server.py .
RUN pip install sdnotify

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost:8000/health || exit 1

CMD ["python", "sample_server.py"]
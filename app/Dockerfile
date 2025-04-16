# app/Dockerfile
FROM python:3.11-slim

# Create a non-root user
RUN adduser --disabled-password appuser

# Set workdir and switch user
WORKDIR /app
COPY --chown=appuser:appuser . .

RUN pip install flask

USER appuser
EXPOSE 5000

CMD ["python", "app.py"]

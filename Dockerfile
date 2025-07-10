# 1. Base image
FROM python:3.9-alpine

ARG APP_PORT=8082

# 2. Useful Python defaults + Super-User Defaults + Port
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    APP_PORT=${APP_PORT} \
    DJANGO_SUPERUSER_USERNAME=admin \
    DJANGO_SUPERUSER_PASSWORD=admin \
    DJANGO_SUPERUSER_EMAIL=admin@admin.com

# 3. Working directory (project root)
WORKDIR /app

# 4. Copy only requirements first – keeps the cache valid
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of the application code
COPY . .

# 6. Declare a persistent volume
#    /app/data is stored on the host file system.
VOLUME /app/data
#    Django now knows where to place uploads and the SQLite database
ENV MEDIA_ROOT=/app/data/media

# 7. Expose port
EXPOSE ${APP_PORT}

# 8. On container start:
#    • Migrations
#    • Super-User (if not already present)
#    • Dev-Server
CMD ["sh", "-c", "python babyshop_app/manage.py makemigrations --noinput && \
                  python babyshop_app/manage.py migrate --noinput && \
                  python babyshop_app/manage.py createsuperuser --noinput \
                        --username ${DJANGO_SUPERUSER_USERNAME} \
                        --email ${DJANGO_SUPERUSER_EMAIL} || true && \
                  python babyshop_app/manage.py runserver 0.0.0.0:${APP_PORT}"]

# ---- Build Stage ----
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy code
COPY . .

# Expose port 8000
EXPOSE 8000

# Run migrations and collectstatic, then start server
CMD ["sh", "-c", "python manage.py migrate --noinput && python manage.py collectstatic --noinput && gunicorn cmms_api.wsgi:application --bind 0.0.0.0:8000"]

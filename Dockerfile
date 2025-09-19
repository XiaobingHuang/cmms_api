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

# Start server
CMD ["gunicorn", "cmms_api.wsgi:application", "--bind", "0.0.0.0:8000"]

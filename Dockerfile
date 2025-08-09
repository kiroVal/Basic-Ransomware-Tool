# Use the official Python image
FROM python:3.10-slim

# Prevent .pyc files and enable unbuffered logging
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install dependencies first (cached layer)
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . /app/

# Expose Flask port
EXPOSE 5000

# Run the Flask app
CMD ["python", "ransomware_detection_py/app.py"]


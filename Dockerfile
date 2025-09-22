# Use official lightweight Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install pip upgrades and dependencies in a single layer
# First copy requirements.txt separately for caching
COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy your application code
COPY . .

# Expose the port Flask will run on
EXPOSE 8080

# Run the application
CMD ["python", "app.py"]

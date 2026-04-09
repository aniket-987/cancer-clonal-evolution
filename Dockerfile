FROM python:3.9-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install science libraries for your scripts
RUN pip install --no-cache-dir pandas numpy scikit-learn

# Copy the folders from your repo into the container
COPY . .

# Set the default command to run your main script
CMD ["python", "scripts/clonal_deconvolution.py"]

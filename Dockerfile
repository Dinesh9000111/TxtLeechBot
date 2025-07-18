# Use a minimal Python base image with updated Debian (bullseye)
FROM python:3.10.4-slim-bullseye

# Set working directory
WORKDIR /app

# Install required system packages
RUN apt -qq update && \
    apt -qq install -y --no-install-recommends \
    git wget pv jq python3-dev ffmpeg mediainfo && \
    rm -rf /var/lib/apt/lists/*

# Copy all project files to the container
COPY . .

# Install Python dependencies
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

# Run the bot
CMD ["python3", "main.py"]

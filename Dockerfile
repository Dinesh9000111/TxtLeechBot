FROM python:3.10.4-slim-bullseye

WORKDIR /app

RUN apt -qq update && \
    apt -qq install -y --no-install-recommends \
    git wget pv jq python3-dev ffmpeg mediainfo tzdata && \
    ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    rm -rf /var/lib/apt/lists/*

COPY . .

RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r requirements.txt

CMD ["python3", "main.py"]

FROM python:3.11-slim-buster as prod

RUN apt-get update && apt-get install -y \
  default-libmysqlclient-dev \
  gcc \
  pkg-config \
  openjdk-11-jdk \
  build-essential \
  netcat-openbsd \
  && rm -rf /var/lib/apt/lists/*

RUN pip install poetry==1.4.2

# Configuring poetry
RUN poetry config virtualenvs.create false

# Copying requirements of a project
COPY pyproject.toml poetry.lock* /app/src/
WORKDIR /app/src

# Installing requirements
RUN poetry install --only main
# Removing gcc
RUN apt-get purge -y \
  g++ \
  gcc \
  pkg-config \
  && rm -rf /var/lib/apt/lists/*

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Copying actual application
COPY . /app/src/
RUN poetry install --only main

# Expose port
EXPOSE 8080

# Cloud Run uses port 8080 by default
ENV PORT=8080
ENV REWORKD_PLATFORM_PORT=8080
ENV REWORKD_PLATFORM_HOST=0.0.0.0
ENV REWORKD_PLATFORM_RELOAD=false

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/local/bin/python", "-m", "reworkd_platform"]

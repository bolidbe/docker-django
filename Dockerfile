FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERED 1

RUN apt-get update \
  # dependencies for building Python packages
  && apt-get install -y build-essential \
  # psycopg2 dependencies
  && apt-get install -y libpq-dev \
  # Translations dependencies
  && apt-get install -y gettext \
  # Postgis dependencies
  && apt-get install -y binutils libproj-dev gdal-bin \
  # cleaning up unused files
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
  && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir lxml==4.5.0
RUN pip install --no-cache-dir numpy==1.16.2
RUN pip install --no-cache-dir pandas==0.24.1
RUN pip install --no-cache-dir sqlalchemy==1.3.0

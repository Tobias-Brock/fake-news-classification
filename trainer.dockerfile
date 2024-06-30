# Base image
FROM python:3.11-slim

# Install Python
RUN apt-get update && \
    apt-get install --no-install-recommends -y build-essential gcc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install DVC and Google Cloud Storage dependencies
#RUN pip install dvc[gs]

COPY requirements.txt requirements.txt
COPY pyproject.toml pyproject.toml
COPY fakenews/ fakenews/
#COPY data/ data/
COPY config/ config/
#COPY .env /.env

WORKDIR /

#RUN --mount=type=cache,target=~/pip/.cache pip install -r requirements.txt --no-cache-dir
#RUN pip install google-cloud-storage
RUN pip install -r requirements.txt --no-cache-dir

# Install DVC and Google Cloud Storage dependencies
RUN pip install dvc[gs] google-cloud-storage google-cloud-secret-manager

# Download data from Google Cloud Storage bucket
RUN gsutil cp -r gs://mlops-lmu-data-bucket/data data/

# Set the Python path
ENV PYTHONPATH="${PYTHONPATH}:/fakenews"

# Set entrypoint
ENTRYPOINT ["python", "-u", "fakenews/model/train_model.py"]

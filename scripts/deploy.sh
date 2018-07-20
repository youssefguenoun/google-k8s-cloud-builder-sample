#!/usr/bin/env bash

PROJECT_ID=jupyterhub-research-database
CLUSTER_NAME=echosens-k8s-cluster-dev
COMP_ZONE=europe-west1-b
CREDS_BUCKET_NAME=ms-mfs-credentials

gsutil cp gs://${CREDS_BUCKET_NAME}/ms-mfs-credentials.json /tmp
export GOOGLE_APPLICATION_CREDENTIALS=/tmp/ms-mfs-credentials.json
gcloud auth activate-service-account --key-file /tmp/ms-mfs-credentials.json

gcloud config set project ${PROJECT_ID}
gcloud config set container/cluster ${CLUSTER_NAME}
gcloud config set compute/zone ${COMP_ZONE}

gcloud components install kubectl

gcloud config set container/use_client_certificate True
gcloud container clusters get-credentials ${CLUSTER_NAME}

kubectl apply k8s/core



#!/usr/bin/env bash

PROJECT_ID=jupyterhub-research-database
CLUSTER_NAME=echosens-k8s-cluster-dev
COMP_ZONE=europe-west1-b
CREDS_BUCKET_NAME=ms-mfs-credentials

gsutil cp gs://${CREDS_BUCKET_NAME}/ms-mfs-credentials.json /tmp
export GOOGLE_APPLICATION_CREDENTIALS=/tmp/ms-mfs-credentials.json
less $(echo $GOOGLE_APPLICATION_CREDENTIALS)
gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS

gcloud container clusters get-credentials ${CLUSTER_NAME} --zone ${COMP_ZONE} --project ${PROJECT_ID}

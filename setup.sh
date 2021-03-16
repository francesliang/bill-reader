#!/bin/sh

echo "--- Start k8s cluster locally ---"
minikube start

echo "--- Generate Pachyderm manifest ---"
pachctl deploy local --dry-run > pachyderm.json

echo "--- Deploy Pachyderm locally ---"
pachctl deploy local

echo "--- Port forwarding for Pachyderm dashboard access ---"
pachctl port-forward

echo "--- Create BillReader pipeline repos ---"
pachctl create repo train_data

echo "--- Upload training data to train_data repo ---"
pachctl put file -r train_data@master:/ -f InvoiceNet/train_data

#!/bin/sh
sudo echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update
sudo apt-get install google-cloud-sdk -y
brew install --build-from-source yq jq
mkdir ~/.kube
# For ElasticSearch, Kibana
helm repo add elastic https://helm.elastic.co
# For MongoDB, Keycloak
helm repo add bitnami https://charts.bitnami.com/bitnami
# For Traefik
helm repo add traefik https://helm.traefik.io/traefik
# For Cert-Manager
helm repo add jetstack https://charts.jetstack.io
# For Agones
helm repo add agones https://agones.dev/chart/stable
helm repo update

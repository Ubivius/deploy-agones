#!/bin/sh
case $1 in
    agones)
        helm upgrade agones --install --version 1.17.0 --namespace agones-system --create-namespace agones/agones
    ;;
    elasticsearch)
        helm upgrade elasticsearch --install --version 7.14.0 elastic/elasticsearch -f chart/values.yaml
    ;;
    keycloak)
        helm upgrade keycloak --install --version 5.1.0 bitnami/keycloak -f values.yaml
    ;;
    kibana)
        helm upgrade kibana --install --version 7.14.0 elastic/kibana -f chart/values.yaml
    ;;
    mongodb)
        helm upgrade mongodb --install --version 10.26.0 bitnami/mongodb -f chart/values.yaml
    ;;
    pebble)
        helm upgrade pebble --install --version 0.2.2 jupyterhub/pebble -f chart/values.yaml
    ;;
    traefik)
        helm upgrade traefik --install --version 10.3.4 traefik/traefik -f values.yaml
        kubectl apply -f dashboard.yaml
        kubectl apply -f middleware.yaml
    ;;
    *)
        printf "Project %s not supported for deployment" $1
    ;;
esac

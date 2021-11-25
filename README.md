# Deploy-Agones
Manifests to deploy game servers locally or inside the LKE cluster

## Usage

[Helm](https://helm.sh) must be installed.
Make sure Agones is installed in the cluster.

To install Agones:

```console
helm repo add agones https://agones.dev/chart/stable
helm repo update
helm install my-release --namespace agones-system --create-namespace agones/agones
```

## Deploy the game server

Inside the LKE cluster:
```console
kubectl apply -f .\simple-game-server.yaml
```
This will generate a pod with the server and the agones side-car. It also creates a GameServer CRD.

If you want to deploy your game server on your local cluster (e.g. a minikube with docker desktop), your need to add a load balancer:
```console
kubectl apply -f .\load-balancer.yaml
```

## Deploy a fleet

Inside the LKE cluser:

```console
kubectl apply -f .\fleet.yaml
```

This will create a Fleet CRD, a GameServer CRD ans a pod with the game server and the agones-sidecar.
With the Fleet, if you delete the pod, it will automatically recreacte a new pod.

## Add Role to edit game servers

Inside the LKE cluster:
```console
kubectl apply -f .\gameservers-role.yaml
```
This will add the role to get, watch, list, create, update, patch and delete game servers.

Then create the Role Binding
```console
kubectl create rolebinding gameservers-reader-pod --role=gameservers-reader --serviceaccount=default:default
```

For more information visit https://agones.dev/site/.

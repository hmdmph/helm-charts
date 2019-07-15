# Mongo-Pod-Labeler

Mongo pod labeler is a simple tool that label the pods of mongo cluster with their role. Written in simple python3 script.

- This is help to determine which pod is primary/ secondary
- Useful when exposing mongo primary/ secondary via nodeport( so in your service you can have these labels as selector)

This chart deploys a small pod and create service account with required privileges to run and 
update the labels of mongo pods. Its just a simple tool that can be run on your namespace 
as same as your mongo namespace.

### TL;DR

```bash
$ helm install hmdmph/mongo-pod-labeler
```

## Prerequisites

- Kubernetes 1.8+ with Beta APIs enabled
- Deployed mongo cluster

## Installing the Chart

To install the chart with the release name you can give a name as you wish `mongo-labeler`

```bash
$ helm repo add hmdmph https://hmdmph.github.io/helm-charts
$ helm install --name mongo-labeler hmdmph/mongo-pod-labeler
```

This Helm chart deploys mongo-pod-labeler on the Kubernetes cluster in a default
configuration. The [configuration](#configuration) section lists
the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

> **Tip** List installed mongo-labeler release `helm list | grep mongo-pod-labeler`

> **Tip** get history of chart version/ status/ etc... mongo-pod-labeler releases `helm history mongo-labeler` 

## Uninstalling the Chart

To uninstall/delete the `mongo-labeler` Deployment:

```bash
$ helm delete mongo-labeler
```

The command removes all the Kubernetes components associated with the chart and
deletes the release.

## Upgrading an existing Release to a new major version

A major chart version change (like v2.1.0 -> v3.0.0) indicates that there may be
incompatible or breaking changes that require manual actions.

##Changelog

### 1.0.1
- Improved alpine based small image
- clear logs in verbose mode

### 0.1.0
- This is the initial version of the mongo-pod-labeler chart with the minimal configuration/ settings.


## Configuration

The following table lists main configurable most common parameters of the mongo-pod-labeler chart and their default values:

| Parameter                       | Description                                           | Default                |
|---------------------------------|-------------------------------------------------------|------------------------|
| `replicaCount`                  | number of replicas                                    | 1                      |
| `namespace`                     | namespace that you want to install mongo-pod-labeler  | mongo                  |
| `labelUpdateFrequency`          | how frequent you want to update the mongo pods labels (in seconds) | 60        |
| `mongoPodSelector.keyValuePair` | key=value of to match and get the mongo pods          | app=mongodb-replicaset |
| `verbose.enabled`               | detailed output in the logs                           | false                  |
|---------------------------------|---------------------------------                      |---------------------   |
| `nameOverride`                  | override chart name                                   | ""                     |
| `fullnameOverride`              | override chart full name                              | ""                     |
|---------------------------------|---------------------------------                      |---------------------   |
| `image.repository`              | image repository                                      | redmart/mongo-pod-labeler|
| `image.tag`                     | image tag                                             | 1.0.0                  |
| `image.pullPolicy`              | image pull policy                                     | IfNotPresent           |
|---------------------------------|---------------------------------                      |---------------------   |
| `resources.limits.cpu`          | cpu resource limit                                    | 200m                   |
| `resources.limits.memory`       | memory resource limit                                 | 200Mi                  |
| `resources.requests.cpu`        | cpu request                                           | 100m                   |
| `resources.requests.memory`     | memory request                                        | 128Mi                  |
|---------------------------------|---------------------------------                      |---------------------   |
| `nodeSelector`                  | node selector                                         | {}                     |
| `tolerations`                   | tolerations                                           | []                     |
| `affinity`                      | pod affinity                                          | {}                     |
|---------------------------------|---------------------------------                      |---------------------   |

Happy Helm with ♥ at hmdmph




 


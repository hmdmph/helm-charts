# CrateDB Adapter ( can be easily used with prometheus remote write/read )

CrateDB is a distributed SQL database built on top of a NoSQL foundation. 
This is an adapter that accepts read/write requests, and sends them on to CrateDB. 

 - listen on endpoints `http://<service-name>:9268/write` and `http://<service-name>:9268/read`
 - Requires CrateDB 3.1.0 or greater.
 
This chart deploys a CrateDB Adapter as a Deployment. By default it creates a
Service that expose the endpoints.

### TL;DR

```bash
$ helm install hmdmph/cratedb-adapter \
       --name cratedb-adapter \
       --set createdb.passwd="*****"
```

## Prerequisites

- Kubernetes 1.8+ with Beta APIs enabled
- If deploying in production environment, you need to have persistent volumes
- Deployed [crateDB](https://github.com/hmdmph/helm-charts/tree/master/cratedb) in Kubernetes 3.1.0 or higher

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm repo add hmdmph https://hmdmph.github.io/helm-charts
$ helm install --name cratedb-adapter hmdmph/cratedb-adapter
```

This Helm chart deploys crateDB adapter on the Kubernetes cluster in a default
configuration. The [configuration](#configuration) section lists
the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

> **Tip** List installed crateDB Adapter release `helm list | grep cratedb-adapter`

> **Tip** get history of chart version/ status/ etc... CrateDB Adapter releases `helm history cratedb-adapter` 

## Uninstalling the Chart

To uninstall/delete the `cratedb-adapter` Deployment:

```bash
$ helm delete cratedb-adapter
```

The command removes all the Kubernetes components associated with the chart and
deletes the release.

## Upgrading an existing Release to a new major version

A major chart version change (like v0.1.0 -> v1.0.0) indicates that there may be
incompatible or breaking changes that require manual actions.

### 0.1.0
This is the initial version of the crateDB Adapter chart with the minimal configuration/ settings.

## How to delete the crateDB Adapter deployment
```bash
$ kubectl delete statefulsets --cascade=false cratedb-adapter
```

## Configuration

The following table lists main configurable most common parameters of the CrateDB chart and their default values:

| Parameter                       | Description                                           | Default                            |
|---------------------------------|-------------------------------------------------------|------------------------------------|
| `replicaCount`                  | number of replicas for CrateDB adapter                | 1                                  |
| `namespace`                     | namespace that you want to install crateDB            | default                            |
| `createdb.hostname`             | hostname of the cratedb service                       | crate.your-domain.com              |
| `createdb.portName`             | port of the CrateDB                                   | 5432                               |
| `createdb.userName`             | user name for CrateDB                                 | crate                              |
| `createdb.passwd`               | password name for CrateDB                             | ""                                 |
| `createdb.schema`               | schema name that you want to connect in CrateDB       | "cratedb"                          |
| `createdb.maxConnections`       | The maximum number of concurrent connections (default: 5). | 6                             |
| `createdb.tlsEnabled`           | Whether to connect using TLS                          | false                              |
| `createdb.allowInsecureTls`     | Whether to allow insecure / invalid TLS certificates  | false                              |
| `service.service`               |  Whether enable of disable cratedb-adapter service    | true                               |
| `service.type`                  | Usual service types                                   |  ClusterIP                         |
| `service.port`                  | adapter port                                          |  9268                              |
| `service.targetPort`            | the port you want to expose via service               |  9268                              |


Following table contains other parameters are also configurable in chart, but most of the time you may don't need to modify

| Parameter                      | Description                          |                 Default            |
|--------------------------------|--------------------------------------|------------------------------------|
| `resources`                    | resources requests/limits can be defined as your requirement | {}         |
| `affinity`                     | pod affinity                         | {}                                 |
| `image.repository`             | CrateDB adapter image                | crate/crate_adapter                |
| `image.tag`                    | version/ tag of the image            | latest                             |
| `image.pullPolicy`             | image pull policy                    | IfNotPresent                       |
| `nameOverride`                 | override chart name                  | ""                                 |
| `fullnameOverride`             | override chart full name             | ""                                 |
Happy Helm with ♥ at hmdmph









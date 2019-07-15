# Redis-Pod-Labeler

Redis pod labeler is a simple tool that label the pods of redis-ha cluster (with sentinel) with their role. Written in simple 
python3 script.

- This is help to determine which pod is master/ slave
- Useful when exposing redis master/ slave
- By default it creates a service that expose the redis master

This chart deploys a small pod and create service account with required privileges to run and 
update the labels of redis pods. Its just a simple tool that can be run on your namespace 
as same as your redis namespace.

### TL;DR

```bash
helm install hmdmph/redis-pod-labeler \
     --name redis-labeler \
     --set namespace=redis \
     --set headlessName=my-redis-redis-ha \
     --set companyDomain=mycompany.com \
     --set redisPodSelector.keyValuePair="release=my-redis"  \
     --set verbose.enabled=true
```
Above will install the redis-pod-labeler in the namespace of redis. It will find the redis-ha
announce services using label _release=my-redis_ and the given headless name _my-redis-redis-ha_
then label them with roles with key/value `mycompany.com/role`=`master`


## Prerequisites / Dependencies

- Kubernetes 1.8+ with Beta APIs enabled
- [Deployed redis-ha cluster with sentinel](https://github.com/helm/charts/tree/master/stable/redis-ha)

## Installing the Chart

To install the chart with the release name you can give a name as you wish `redis-labeler`

```bash
$ helm repo add hmdmph https://hmdmph.github.io/helm-charts
$ helm install hmdmph/redis-pod-labeler \
       --name redis-labeler \
       --set namespace=redis \
       --set headlessName=my-redis-redis-ha \
       --set companyDomain=mycompany.com \
       --set redisPodSelector.keyValuePair="release=my-redis"  \
       --set verbose.enabled=true
```

This Helm chart deploys redis-pod-labeler on the Kubernetes cluster in a default
configuration. The [configuration](#configuration) section lists
the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

> **Tip** List installed redis-labeler release `helm list | grep redis-pod-labeler`

> **Tip** get history of chart version/ status/ etc... redis-pod-labeler releases `helm history redis-labeler` 

## Uninstalling the Chart

To uninstall/delete the `redis-labeler` Deployment:

```bash
$ helm delete redis-labeler
```

The command removes all the Kubernetes components associated with the chart and
deletes the release.

## Upgrading an existing Release to a new major version

A major chart version change (like v2.1.0 -> v3.0.0) indicates that there may be
incompatible or breaking changes that require manual actions.

##Changelog

### 1.0.2
- Improved docker alpine based small image.
- Fixed a bug when deploying in multiple redis environments.

### 1.0.0
- This is the initial version of the redis-pod-labeler chart with the minimal configuration/ settings.


## Configuration

The following table lists main configurable most common parameters of the redis-pod-labeler chart and their default values:

| Parameter                       | Description                                           | Default                |
|---------------------------------|-------------------------------------------------------|------------------------|
| `replicaCount`                  | number of replicas                                    | 1                      |
| `namespace`                     | namespace that you want to install redis-pod-labeler  | redis                  |
| `labelUpdateFrequency`          | how frequent you want to update the redis pods labels (in seconds) | 60        |
| `redisPodSelector.keyValuePair` | key=value of to match and get the redis pods          | release=my-redis     |
| `headlessName`                  | headless service name of redis cluster                | my-redis-redis-ha    |
| `exposeMasterService.enabled`   | expose the redis master as service                    | true                   |
| `redisPort`                     | redis port                                            | 6379                   |
| `skipTlsVerify.enabled`         | skip tls verification                                 | false                  |
| `redisClusterName`              | redis sentinel cluster name                           | mymaster               |
| `companyDomain`                 | company domain to make label                          | redis.io               |
| `serviceAnnotations`            | service annotations                                   | {}                     |
| `verbose.enabled`               | detailed output in the logs                           | false                  |
|--------                         |--------                                               |--------                |
| `nameOverride`                  | override chart name                                   | ""                     |
| `fullnameOverride`              | override chart full name                              | ""                     |
|--------                         |--------                                               |--------                |
| `image.repository`              | image repository                                      | redmart/redis-pod-labeler|
| `image.tag`                     | image tag                                             | 1.0.1                  |
| `image.pullPolicy`              | image pull policy                                     | IfNotPresent           |
|--------                         |--------                                               |--------                |
| `resources.limits.cpu`          | cpu resource limit                                    | 100m                   |
| `resources.limits.memory`       | memory resource limit                                 | 100Mi                  |
| `resources.requests.cpu`        | cpu request                                           | 80m                    |
| `resources.requests.memory`     | memory request                                        | 50Mi                   |
|--------                         |--------                                               |--------                | 
| `nodeSelector`                  | node selector                                         | {}                     |
| `tolerations`                   | tolerations                                           | []                     |
| `affinity`                      | pod affinity                                          | {}                     |
|--------                         |--------                                               |--------                |

Happy Helm with ♥ at hmdmph




 


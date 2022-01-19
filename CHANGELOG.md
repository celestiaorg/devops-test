# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),

## [Unreleased]

- Update `.github/workflows/changelog-checker.yml` to use the fork `celestiaorg/changelog-checker@v1`
- Create `.github/workflows/terraform.yml` to provide stub GH action for dev/test
- Update `.github/workflows/terraform.yml` to create then destroy K8s cluster on Digital Ocean
- Update `main.go`, `Dockerfile`, and `Makefile` to create HTTP server on port 8080
- Update `Dockerfile` to use `golang:alpine` instead of `golang:latest` (which uses Debian)
- Create `k8s` dir with `hello-dep.yaml` and `hello-svc.yaml` as a minimal deployment + service for the hello world server
- Create `.github/workflows/minikube.yml` stub GH action to enable dev/test on branch other than `main`
- Update main.go to provide a http server on port 8080
- Create real `.github/workflows/minikube.yml` GH action to build, deploy, and test docker image on minikube
- Significantly re-organizae the repository to be used for devnet automation
- Move "hello world" golang HTTP server and it's related files to `/hello` subdir
- Add `/devnet` subdir
- Add `celestia-app` subdir to `/devnet` with `Dockerfile` and other config files for a 4 node network
- Add `celestia-node` subdir to `/devnet` with `Dockerfile` and other config files for a 2 (full) node network connecting to the above `celestia-app` network
- Add `docker` directory to `/devnet` with several `docker-compose.yml` files to automate creation of above networks
- Update `celestia-app` and `celestia-node` docker images to base off Ubuntu instead of Alpine
- Add `.github/workflows/docker-compose.yml` to run and test docker-compose cluster
- Add config files for 4 light nodes
- Create separate Dockerfiles for full and light nodes 
- Update devnet/docker/docker-compose.yml to include 4 full nodes (up from 2) and 4 light nodes (up from 0)
- Increase sleep time before startup on full and light nodes so that they startup after the core nodes have produced a block
- Update docker-compose gh action to work with new docker-compose file. 
- Update `celestia-app` and `celestia-node` Dockerfiles to no longer copy config at build time. They now expect configuration to be provided through mounted volumes or passed as flags. 
- Update `celestia-node` full and light Dockerfiles to no longer include a sleep before startup. 
- Create Kubernetes resources to standup a cluster consisting of 4 pods with 1 `core-node` and 1 `full-node` and 4 pods with 1 `light-node`. 
- Hardcode core + full pod IPs utilizing Calico CNI IPAM to allow for persistent p2p connections.
- Add devnet/k8s/README.md with instructions for setting up minimum viable k8s cluster
- Update minikube GH action to standup Minimum Viable Cluster (MVC) and test that core nodes produce a block
- Update docker-compose to take genesis.json file and gentx/ dir as volume mounts
- Update the docker-compose.yml to use the new Docker images created in PRs ([#163](https://github.com/celestiaorg/celestia-app/pull/163)) and ([#295](https://github.com/celestiaorg/celestia-node/pull/295))
- Update k8s/ config files to use new docker images created in PRs ([#163](https://github.com/celestiaorg/celestia-app/pull/163)) and ([#295](https://github.com/celestiaorg/celestia-node/pull/295))
- Split devnet/docker/docker-compose.yml into 3 files, one for each node type
- Create devnet/README.md which contains instructions for utilizing both the docker-compose and K8s dev clusters
- Replace config.toml files with `--p2p.mutual` in bridge nodes and remove unneeded config.toml files in light nodes
- Fix broken pre-release GH action by running it on the `/hello` dir
- Replace full node config volumes with flags and remove unneeded config volumes from light nodes in `devnet/k8s` dir
- Regenesis of celestia-app nodes resulting in new keys and a new genesis.json
- Added `devnet/dalc` directory containing config files for the https://github.com/celestiaorg/dalc docker image and an associated `docker/dalc-docker-compose.yml` file
- Lots of cleanup of files that no longer serve the purpose of this repository
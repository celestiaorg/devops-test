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
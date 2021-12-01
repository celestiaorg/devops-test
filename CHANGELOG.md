# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),

## [Unreleased]

- Update `.github/workflows/changelog-checker.yml` to use the fork `celestiaorg/changelog-checker@v1`
- Create `.github/workflows/terraform.yml` to provide stub GH action for dev/test
- Update `.github/workflows/terraform.yml` to create then destroy K8s cluster on Digital Ocean
- Update `main.go`, `Dockerfile`, and `Makefile` to create HTTP server on port 8080
- Update `Dockerfile` to use `golang:alpine` instead of `golang:latest` (which uses Debian)
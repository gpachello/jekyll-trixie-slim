# Jekyll Trixie Slim

A minimal Docker setup to run Jekyll on top of `debian:trixie-slim`.  
The goal is simplicity: clean base image, only essential packages, and a lightweight environment for local Jekyll development.

## Features:

* Based on Debian Trixie Slim
* Installs Ruby and Jekyll with minimal dependencies
* Includes a development container with live-reload support
* Small, transparent, and easy to extend

## Usage

Build and run with Docker Compose:

```bash
docker compose up -d --build
```

Your site will be available at:

```bash
http://localhost:4000
```

## Philosophy

Keep the environment small and understandable.
Anyone cloning this repo can adapt the image to their own workflow or add additional tools as needed.

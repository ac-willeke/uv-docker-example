FROM ghcr.io/ac-willeke/uv-docker-example:latest

# Install git only in the devcontainer, not in prod images
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

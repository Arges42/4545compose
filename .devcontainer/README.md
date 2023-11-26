# Devcontainer
To make the development easier and ensure similar setups for all devs, [devcontainer](https://code.visualstudio.com/docs/devcontainers/containers) enable a smooth setup using docker.

## Requirements
Host requirements:
- docker
- docker compose

Optional:
- VSCode with DevContainer extenstion

## Components
The **devcontainer.json** file defines which container should be used as the devcontainer. It also references the **docker-compose.yml** file to be used for the setup.
The **docker-compose.yml** file is pretty standard defining a postgresql and redis service. The main container is based on a custom docker image, which install all necessary dependencies for the heltour project.
The **heltour.Dockerfile** is based on the python3.8 base image. Afterwards the dependencies as specified in the project README.md are installed.


# Using the docker-compose directly
You don't need to use the devcontainer functionality of VSCode or GitHub cospaces. The docker-compose.yml should also works on its own.
Simply run
`bash
docker compose up -d
docker exec -it devcontainer-heltour-web-1 /bin/bash
`
to connect to the container running the helltour application.

If this is the first time, make sure to run the **post-install.sh** script.
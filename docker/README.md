# SNP Blending Docker

## Create the Docker image
### Download
Download a pre-built Docker image from the container registry:

```
docker login ghcr.io
docker pull ghcr.io/ros-industrial-consortium/scan_n_plan_workshop:<tag>
```

### Build
Build the Docker image using `docker-compose`:

```commandLine
cd docker
docker compose build
```

## Run the docker image
Run the Docker image using `docker-compose`:

```commandLine
cd docker
CURRENT_UID=$(id -u):$(id -g) docker compose up
```

> Note: by default the docker image runs as a non-root user, so the environment variable `CURRENT_UID` must be supplied as shown above

> Note: set the `ROS_DOMAIN_ID` and `ROS_LOCALHOST_ONLY` environment variables prior to running `docker compose up`
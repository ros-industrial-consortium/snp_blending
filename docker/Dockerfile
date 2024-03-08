ARG TAG
FROM ghcr.io/ros-industrial-consortium/scan_n_plan_workshop:${TAG}

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractivej

USER root

# Install Python dependencies
RUN python3 -m pip install open3d pyquaternion --upgrade

# Run apt update and install useful utilities like sudo
RUN apt update -y -qq && apt install -y -qq sudo

# Build the repository
# Bind mount the source directory so as not to unnecessarily copy source code into the docker image
ARG WORKSPACE_DIR=/opt/snp_blending
RUN --mount=type=bind,target=${WORKSPACE_DIR}/src/snp_blending \
  source /opt/snp/install/setup.bash \
  && cd ${WORKSPACE_DIR} \ 
  && colcon build --cmake-args \
  && rm -rf build log

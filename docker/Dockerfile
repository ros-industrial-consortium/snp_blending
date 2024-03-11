ARG TAG
FROM ghcr.io/ros-industrial-consortium/scan_n_plan_workshop:${TAG}

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractivej

USER root


# Run apt update and install useful utilities like sudo
RUN apt update -y -qq && apt install -y -qq sudo

# Build the repository
# Bind mount the source directory so as not to unnecessarily copy source code into the docker image
ARG WORKSPACE_DIR=/opt/snp_blending
RUN --mount=type=bind,target=${WORKSPACE_DIR}/src/snp_blending \
  source /opt/snp/install/setup.bash \
  && cd ${WORKSPACE_DIR} \ 
  && rosdep install \
      --from-paths src \
      -iry \
  && colcon build --cmake-args \
  && rm -rf build log

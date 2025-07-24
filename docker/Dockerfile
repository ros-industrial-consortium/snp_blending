ARG TAG
FROM ghcr.io/ros-industrial-consortium/scan_n_plan_workshop:${TAG}

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractivej

USER root

# Run apt update and install useful utilities like sudo
RUN apt update -y -qq && apt install -y -qq sudo iputils-ping

# Install the dependency repositories
# Use a tmpfs mount for the workspace so as not to unnecessarily copy files into the final image
# Bind mount the source directory so as not to unnecessarily copy source code into the docker image
ARG WORKSPACE_DIR=/tmpfs/snp_blending
ARG INSTALL_DIR=/opt/snp_blending
RUN mkdir -p ${INSTALL_DIR}

RUN --mount=type=tmpfs,target=${WORKSPACE_DIR} --mount=type=bind,target=${WORKSPACE_DIR}/src/snp_blending \
  source /opt/snp/install/setup.bash \
  && cd ${WORKSPACE_DIR} \ 
  && rosdep install \
      --from-paths src \
      -iry \
  && colcon build --cmake-args \
  && cp -r ${WORKSPACE_DIR}/install ${INSTALL_DIR}

COPY --chmod=755 docker/launch_snp_blending.sh /opt/launch_snp_blending.sh
ENTRYPOINT ["/opt/launch_snp_blending.sh"]

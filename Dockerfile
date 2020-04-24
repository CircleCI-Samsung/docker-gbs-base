FROM circleci/buildpack-deps:xenial-dind

USER root

RUN echo "deb [trusted=yes] http://download.tizen.org/tools/latest-release/Ubuntu_16.04/ /" | tee /etc/apt/sources.list.d/tizen.list \
   && apt-get update \
   && apt-get install -y gbs mic
RUN sed -i "2a\\find /proc/sys/fs/binfmt_misc/ -name \"qemu-*\" -type f -exec sh -c \"echo -1 | tee {}\" \\\;" /usr/local/bin/dockerd-entrypoint.sh

USER circleci

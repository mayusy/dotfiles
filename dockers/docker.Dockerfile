FROM goodwithtech/dockle:latest AS dockle
FROM aquasec/trivy:latest AS trivy
FROM wagoodman/dive:latest AS dive

FROM docker:rc-dind AS docker

ENV DOCKER_SLIM_VERSION 1.25.3
ENV DLAYER_VERSION 0.1.0
ENV BUILDX_VER 0.3.1

COPY --from=dive /usr/local/bin/dive /usr/local/bin/dive
COPY --from=dockle /usr/local/bin/dockle /usr/local/bin/dockle
COPY --from=trivy /usr/local/bin/trivy /usr/local/bin/trivy

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
    upx \
    curl \
    && curl -fsSLO "https://downloads.dockerslim.com/releases/${DOCKER_SLIM_VERSION}/dist_linux.tar.gz" \
    && tar zxvf dist_linux.tar.gz \
    && mv dist_linux/docker* /usr/local/bin \
    && curl -o /usr/local/bin/dlayer -fSsLO "https://github.com/orisano/dlayer/releases/download/v${DLAYER_VERSION}/dlayer_linux_amd64" \
    && chmod a+x /usr/local/bin/dlayer \
    && mkdir -p /usr/lib/docker/cli-plugins \
    && curl -o /usr/lib/docker/cli-plugins/docker-buildx -fSsLO "https://github.com/docker/buildx/releases/download/v${BUILDX_VER}/buildx-v${BUILDX_VER}.linux-amd64" \
    && chmod a+x /usr/lib/docker/cli-plugins/docker-buildx \
    && upx -9 \
        /usr/lib/docker/cli-plugins/docker-buildx \
        /usr/local/bin/containerd \
        /usr/local/bin/containerd-shim \
        /usr/local/bin/ctr \
        /usr/local/bin/dive \
        /usr/local/bin/dlayer \
        /usr/local/bin/docker \
        /usr/local/bin/docker-init \
        /usr/local/bin/docker-proxy \
        /usr/local/bin/docker-slim \
        /usr/local/bin/docker-slim-sensor \
        /usr/local/bin/dockerd \
        /usr/local/bin/dockle \
        /usr/local/bin/runc

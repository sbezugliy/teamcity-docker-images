# Default arguments
ARG defaultShellArgs='-l -c'
ARG defaultShellBin='/bin/bash'
ARG repo='https://hub.docker.com/repository/docker/sbezugliy/'
ARG rvmBaseRubyVersion='2.7.1'
ARG rvmPGPKeys='409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB'
ARG teamcityMinimalAgentImage='jetbrains/teamcity-minimal-agent:EAP-linux'

# The list of required arguments
# ARG teamcityMinimalAgentImage



FROM ${teamcityMinimalAgentImage}

USER root

LABEL dockerImage.teamcity.version="latest" \
      dockerImage.teamcity.buildNumber="latest"

ARG rvmPGPKeys
ARG rvmBaseRubyVersion

ARG defaultShell
ARG defaultShellArgs
    # Opt out of the telemetry feature
ENV GIT_SSH_VARIANT ssh

ENV RVM_PGP_KEYS ${rvmPGPKeys}
ENV RVM_BASE_RUBY_VERSION ${rvmBaseRubyVersion}

ENV DEFAULT_SHELL_BIN ${defaultShellBin}
ENV DEFAULT_SHELL_ARGS ${defaultShellArgs}
RUN apt-get update && \
    apt-get install -y git mercurial apt-transport-https software-properties-common && \
    \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    \
    apt-cache policy docker-ce && \
    apt-get update && \
    apt-get install -y  docker-ce=5:19.03.9~3-0~ubuntu-bionic \
                        docker-ce-cli=5:19.03.9~3-0~ubuntu-bionic \
                        containerd.io=1.2.13-2 \
                        bash \
                        curl \
                        ca-certificates \
                        systemd && \
    systemctl disable docker && \
    curl -SL "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose && \
    \
    apt-get install -y --no-install-recommends \
            libc6 \
            libgcc1 \
            libgssapi-krb5-2 \
            libicu60 \
            liblttng-ust0 \
            libssl1.0.0 \
            libstdc++6 \
            zlib1g \
        && rm -rf /var/lib/apt/lists/* && \
    \
    apt-get clean all && \
    \
    usermod -aG docker buildagent

# A better fix for TW-52939 Dockerfile build fails because of aufs
VOLUME /var/lib/docker

COPY --chown=buildagent:buildagent run-docker.sh /services/run-docker.sh

SHELL [ "echo ${DEFAULT_SHELL_BIN}", "echo ${DEFAULT_SHELL_ARGS}" ]

RUN set -eux; echo progress-bar >> ~/.curlrc \
    && $(   $(gpg --keyserver hkp://pool.sks-keyservers.net \
                --recv-keys ${RVM_PGP_KEYS})||\
            $(gpg --keyserver hkp://ipv4.pool.sks-keyservers.net \
                --recv-keys ${RVM_PGP_KEYS})||\
            $(gpg --keyserver hkp://pgp.mit.edu \
                 --recv-keys ${RVM_PGP_KEYS})||\
            $(gpg --keyserver hkp://keyserver.pgp.com \
                 --recv-keys ${RVM_PGP_KEYS}))

RUN \curl -sSL https://get.rvm.io | bash -s stable

USER buildagent

RUN source /etc/profile
RUN rvm install ${RVM_BASE_RUBY_VERSION}
RUN rvm info

# The list of required arguments
# ARG dotnetCoreLinuxComponentVersion
# ARG dotnetCoreLinuxComponent
# ARG teamcityMinimalAgentImage

# Id teamcity-agent
# Platform ${linuxPlatform}
# Tag ${versionTag}-linux
# Tag ${latestTag}
# Tag ${versionTag}
# Repo ${repo}
# Weight 1

## ${agentCommentHeader}

# Based on ${teamcityMinimalAgentImage}
FROM ${teamcityMinimalAgentImage}

USER root

LABEL dockerImage.teamcity.version="latest" \
      dockerImage.teamcity.buildNumber="latest"

ARG dotnetCoreLinuxComponentVersion
ARG rvmPGPKeys
    # Opt out of the telemetry feature
ENV DOTNET_CLI_TELEMETRY_OPTOUT=true \
    # Disable first time experience
    DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true \
    # Configure Kestrel web server to bind to port 80 when present
    ASPNETCORE_URLS=http://+:80 \
    # Enable detection of running in a container
    DOTNET_RUNNING_IN_CONTAINER=true \
    # Enable correct mode for dotnet watch (only mode supported in a container)
    DOTNET_USE_POLLING_FILE_WATCHER=true \
    # Skip extraction of XML docs - generally not useful within an image/container - helps perfomance
    NUGET_XMLDOC_MODE=skip \
    GIT_SSH_VARIANT=ssh \
    DOTNET_SDK_VERSION=${dotnetCoreLinuxComponentVersion} \
    RVM_PGP_KEYS=${rvmPGPKeys}
# Install Git
# Install Mercurial
ARG dotnetCoreLinuxComponent

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
# Install [${dotnetCoreLinuxComponentName}](${dotnetCoreLinuxComponent})
    curl -SL ${dotnetCoreLinuxComponent} --output dotnet.tar.gz \
        && mkdir -p /usr/share/dotnet \
        && tar -zxf dotnet.tar.gz -C /usr/share/dotnet \
        && rm dotnet.tar.gz \
        && find /usr/share/dotnet -name "*.lzma" -type f -delete \
        && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet && \
    \
    apt-get clean all && \
    \
    usermod -aG docker buildagent

# A better fix for TW-52939 Dockerfile build fails because of aufs
VOLUME /var/lib/docker

COPY --chown=buildagent:buildagent run-docker.sh /services/run-docker.sh

# Trigger .NET CLI first run experience by running arbitrary cmd to populate local package cache
RUN dotnet help && \
    sed -i -e 's/\r$//' /services/run-docker.sh

USER buildagent

RUN set -eux; /bin/bash

RUN set -eux; echo progress-bar >> ~/.curlrc \
    && $(   $(gpg --keyserver hkp://pool.sks-keyservers.net \
                --recv-keys ${RVM_PGP_KEYS})||\
            $(gpg --keyserver hkp://ipv4.pool.sks-keyservers.net \
                --recv-keys ${RVM_PGP_KEYS})||\
            $(gpg --keyserver hkp://pgp.mit.edu \
                 --recv-keys ${RVM_PGP_KEYS})||\
            $(gpg --keyserver hkp://keyserver.pgp.com \
                 --recv-keys ${RVM_PGP_KEYS}))\
    && \curl -sSL https://get.rvm.io | bash -s stable

RUN set -eux; source ~/.rvm/scripts/rvm
RUN set -eux; rvm info

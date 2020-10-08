# Default arguments
ARG teamcityAgentImage='sbezugliy/teamcity-rvm-agent:EAP-linux'

# The list of required arguments
# ARG teamcityAgentImage



FROM ${teamcityAgentImage}

USER root

COPY run-docker-sudo.sh /services/run-docker-sudo.sh

RUN apt-get update && \
    apt-get install -y --no-install-recommends sudo && \
    echo 'buildagent ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    rm -f /services/run-docker.sh && \
    chown -R buildagent:buildagent /services && \
    rm -rf /var/lib/apt/lists/*

USER buildagent

SHELL [ "/bin/bash", "-l -c" ]

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

RUN source ~/.rvm/scripts/rvm
RUN rvm install ${RVM_BASE_RUBY_VERSION}
RUN rvm info

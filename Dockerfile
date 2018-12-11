FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y curl git gnupg && \
    apt-get clean

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean

RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | bash

RUN useradd gitlab-runner -m
USER gitlab-runner

RUN curl -o- -L https://yarnpkg.com/install.sh | bash
WORKDIR /home/gitlab-runner

CMD ["/home/gitlab-runner/.yarn/bin/yarn"]

FROM gitpod/workspace-base:2023-11-24-15-04-57

ARG POETRY_VERSION=1.6.1
ARG USERNAME=gitpod

USER root

# Setup python 3.8
RUN apt-get update && \
    apt-get remove --purge -y python3 && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update && \
    apt install -y python3.8 python3.8-distutils && \
    rm /usr/bin/python3 && \
    ln -s /usr/bin/python3.8 /usr/bin/python3 && \
    ln -s /usr/bin/python3.8 /usr/bin/python


USER $USERNAME

RUN sudo apt install -y python3-pip
# Temporary: Upgrade python packages due to https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-40897
# They are installed by the base image (python) which does not have the patch.
RUN python3 -m pip install --upgrade setuptools

# Install poetry
RUN curl -sSL https://install.python-poetry.org | POETRY_VERSION=${POETRY_VERSION} python3 -
ENV PATH="${PATH}:/home/${USERNAME}/.local/bin"

# Install SASS using ruby-gem (even though its deprecated)
RUN sudo apt-get install -y ruby-dev &&\
    gem install --user-install sass
# TODO: This could break in the future, if the version of ruby changes
ENV PATH="${PATH}:/home/${USERNAME}/.local/share/gem/ruby/3.0.0/bin"

# Install virtualenv
RUN python -m pip install virtualenv

# Install Fabric3 (not fabric)
RUN pip install fabric3

# Install psql client to use fabric commands, that rely on it
RUN sudo apt-get install -y postgresql-client


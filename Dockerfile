FROM python:3.12.7-slim
RUN apt-get update && apt-get -y install tzdata \
    libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev git

RUN git clone \
    --depth 1 \
    --branch $(git ls-remote --tags --sort=v:refname https://github.com/pyenv/pyenv.git | grep -o -E 'v[1-9]+(\.[1-9]+)+$' | tail -1) \
    https://github.com/pyenv/pyenv.git /root/.pyenv

ENV PYENV_ROOT="/root/.pyenv"
ENV PATH="$PYENV_ROOT/bin:$PATH"

RUN pip install virtualenv

RUN pip install mlflow[mlserver]

# clean up apt cache to reduce image size
RUN rm -rf /var/lib/apt/lists/*

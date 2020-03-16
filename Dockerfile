FROM python:3.8.1

RUN set -ex && mkdir /app
RUN apt update
RUN apt -y install libavdevice-dev libavfilter-dev libopus-dev libvpx-dev pkg-config
RUN pip3 install pipenv

WORKDIR /app

COPY Pipfile /app
COPY Pipfile.lock /app

RUN pipenv sync

EXPOSE 8080
COPY . /app

ENTRYPOINT pipenv run python webapp.py

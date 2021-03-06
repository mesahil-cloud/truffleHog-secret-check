FROM python:3.7-alpine

LABEL name="trufflehog-secret-check"
LABEL version="1.0.0"
LABEL repository="https://github.com/mesahil-cloud/trufflehog-secret-check"
LABEL homepage="https://github.com/mesahil-cloud/trufflehog-secret-check"
LABEL maintainer="CloudTeam"

LABEL "com.github.actions.name"="Trufflehog Secret Check"
LABEL "com.github.actions.description"="Scan repository for secrets with basic trufflehog defaults in place for easy setup."
LABEL "com.github.actions.icon"="shield"
LABEL "com.github.actions.color"="yellow"

RUN pip install gitdb2==3.0.0 truffleHog==2.1.13
RUN apk --update add git less openssh && \
  rm -rf /var/lib/apt/lists/* && \
  rm /var/cache/apk/*

ADD entrypoint.sh  /entrypoint.sh
ADD regexes.json /regexes.json

ENTRYPOINT ["/entrypoint.sh"]

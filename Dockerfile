FROM ubuntu:latest

ARG app_secret="UNSET_SECRET_PLEASE_OVERRIDE"

RUN apt-get update && \
    apt-get install -y net-tools

# Start server
ENV PORT 8080
EXPOSE 8080

RUN /bin/bash -c "echo '$app_secret' > ./app_secret"
CMD ["rackup", "--port", "8080", "--env", "production" ]
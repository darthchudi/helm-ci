FROM alpine:3 

# Install bash, make and docker cli
RUN \
  apk update && \
  apk add --no-cache bash make docker-cli

# Install the latest version of Helm 3 [https://helm.sh/docs/intro/install/#from-script]
RUN \
  apk add --no-cache --virtual deps curl openssl && \
  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && \
  chmod 700 get_helm.sh && \
  ./get_helm.sh && \
  rm get_helm.sh && \
  apk del deps

ENTRYPOINT ["helm"]
CMD ["--help"]
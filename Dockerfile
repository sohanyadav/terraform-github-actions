FROM alpine:3 

RUN ["/bin/sh", "-c", "apk add --update --no-cache bash ca-certificates curl git jq openssh go"]

# Install Go
RUN \
  mkdir -p /goroot && \
  curl https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz | tar xvzf - -C /goroot --strip-components=1

# Set environment variables.
ENV GOROOT /goroot
ENV GOPATH /gopath
ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH

# Define working directory.
WORKDIR /gopath

# Define default command.

# Install Gruntwork
RUN ["/bin/sh", "-c", "go get github.com/gruntwork-io/terratest/modules/terraform"]


COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]

CMD ["bash"]

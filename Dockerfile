FROM alpine:3 

RUN ["/bin/sh", "-c", "apk add --update --no-cache bash ca-certificates curl git jq openssh go"]


# Install Gruntwork
RUN go get github.com/gruntwork-io/terratest/modules/terraform
RUN export PATH="/usr/local/go/bin:$PATH"

RUN ["bin/sh", "-c", "mkdir -p /src"]

COPY ["src", "/src/"]
ENTRYPOINT ["/src/main.sh"]

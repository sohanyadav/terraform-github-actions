FROM golang:1.13.5-alpine

RUN ["/bin/sh", "-c", "apk add --update --no-cache bash ca-certificates curl git jq openssh"]

# Define default command.

# Install Gruntwork
RUN ["/bin/sh", "-c", "go get github.com/gruntwork-io/terratest/modules/terraform"]


COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]

CMD ["bash"]

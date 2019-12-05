FROM alpine:3 

RUN ["/bin/sh", "-c", "apk add --update --no-cache bash ca-certificates curl git jq openssh go"]



# Install Gruntwork
RUN ["/bin/sh", "-c", "go get github.com/gruntwork-io/terratest/modules/terraform"]
RUN cp -r ~/go /usr/lib/go
RUN ["bin/sh", "-c", "mkdir -p /github/home/"]
RUN cp -r ~/go /github/home/go
RUN cd ~/go/src/github.com/gruntwork-io/terratest/modules/terraform
RUN ["bin/sh", "-c", "mkdir -p /src"]

COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]

function builBinary {
    echo "Install Go for kuguard"
    wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh \
 | bash -s -- --version 1.13.5
    apk add  zip unzip
    echo "copy  kuguard"
    cp kuguard -r $HOME/go/src
    echo "Install go  package"
    go get github.com/mitchellh/go-homedir github.com/spf13/cobra

 
    echo "Build binary for Linux amd"
    env GOOS=linux GOACRCH=amd64 go build -o kuguard_linux_amd64/kuguard kuguard
    echo  "Zip the Linux binary file amd"
    zip -r kuguard_linux_amd64.zip kuguard_linux_amd64/kuguard
    unzip kuguard_linux_amd64.zip
    ./kuguard

}

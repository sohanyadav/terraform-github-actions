 
function builBinary {
    echo "Install Go for kuguard"
    wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh \
 | bash -s -- --version 1.13.2
    apk add  zip
    echo "copy  kuguard"
    cp kuguard -r $HOME/go/src
    echo "Install go  package"
    go get github.com/mitchellh/go-homedir github.com/spf13/cobra

    echo "Build binary for Linux"
    env GOOS=linux GOACRCH=amd64 go build -o kuguard_linux_amd64/kuguard kuguard
    echo  "Zip the Linux binary file"
   cd kuguard_linux_amd64 &&  zip  kuguard_linux_amd64.zip kuguard
    echo  "Build binary for Mac"
    env GOOS=linux GOACRCH=amd64 go build -o kuguard_darwin_amd64/kuguard kuguard
    echo  "Zip the Mac binary file"
    zip -r kuguard_darwin_amd64.zip kuguard_darwin_amd64/kuguard
}

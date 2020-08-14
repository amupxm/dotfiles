#!/bin/bash
# In The Name Of God
# ========================================
# [] File Name : go.sh
#
# [] Creation Date : 07-01-2017
#
# [] Created By : Parham Alvani (parham.alvani@gmail.com)
# =======================================
usage() {
        echo "usage: go"
}

go-install() {
        if brew ls --versions go > /dev/null; then
                message "go" "upgrading go"
                brew upgrade go
        else
                message "go" "installing go"
                brew install go
        fi

        message "go" "$(go version)"

        if brew ls --versions golangci-lint > /dev/null; then
                message "go" "upgrading golangci-lint"
                brew upgrade golangci/tap/golangci-lint
        else
                message "go" "installing golangci-lint"
                brew install golangci/tap/golangci-lint
        fi

        message "go" "$(golangci-lint --version)"

        if brew ls --versions goreleaser > /dev/null; then
                message "go" "upgrading goreleaser"
                brew upgrade goreleaser/tap/goreleaser
        else
                message "go" "installing goreleaser"
                brew install goreleaser/tap/goreleaser
        fi

        message "go" "$(goreleaser --version)"

        message "go" "create go directory structure"
        local gopath
        gopath=$HOME/Documents/Go
        for dir in bin pkg src mod; do
                echo $dir
                [ -d $gopath/$dir ] || mkdir -p $gopath/$dir
        done
}

go-install-package() {
        message "go" "goproxy ${GOPROXY} $1"
        go get -v $1

        if [ $? -eq 0 ]; then
                message "go" "$1 installation succeeded"
        else
                message "go" "$1 installation failed"
        fi
}

go-install-packages() {
        message "go" "fetch some good and useful go packages"

        # Go Tools
        message "go" "go tools"
        # Linters Runner for Go. 5x faster than gometalinter. Nice colored output.
        # go-install-package "github.com/golangci/golangci-lint/cmd/golangci-lint"

        # Go Debugger
        # vim-go adds dlv since v1.17 (March 27, 2018)
        # message "go" "Go Debugger [delve]"
        # go-install-package "github.com/derekparker/delve/cmd/dlv"

        message "go" "install binary requirements of vim-go"
        # please consider that this script runs in bash so it cannot see
        # aliases that are defined in zsh
        hash nvim &> /dev/null && nvim +GoUpdateBinaries --headless +qall
}


main() {
        # Reset optind between calls to getopts
        OPTIND=1

        go-install

        go-install-packages
}

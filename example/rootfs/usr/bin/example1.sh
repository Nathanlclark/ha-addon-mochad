#!/usr/bin/with-contenv bashio

# ==============================================================================
# RUN LOGIC
# ------------------------------------------------------------------------------
main() {
    bashio::log.info "Starting MochaD"

    mkdir /build
    cd /build || exit
    wget -O mochad.tgz http://sourceforge.net/projects/mochad/files/latest/download
    tar -xzvf mochad*.t*
    cd mochad* && ./configure
    make
    make install
    #apk --purge del gcc g++ cmake make wget
    #rm -rf /var/cache/apk/* /lib/apk/db/*
    mochad -d

    bashio::log.info "Done starting MochaD"
}
main "$@"

#!/bin/bash

_pre_configure() {
    # Kötelező autotools csomagok telepítése
    #do_pacman_install autoconf automake libtool
    echo "Shine telepítése"
	
    # Konfigurációs előkészítés
    ./bootstrap
    autoreconf -fiv
    
    # Build mappa létrehozása
    mkdir -p "build-${bits}"
    cd_safe "build-${bits}"
    
    # Fordítási opciók
    CONFIGURE_OPTS+=(
        --prefix="$LOCALDESTDIR"
        --disable-shared
        --enable-static
    )
}

_pre_make() {
    # Szükséges fájl másolása
    cp ../libshine.sym .
    
    # Egyéni CFLAGS beállítás
    export CFLAGS+=" -I../src/lib"
}

_post_install() {
    # Felesleges fájlok törlése
    Echo Kész!!!
}
#!/bin/bash

has_flatpak_builder(){
    flatpak list --app --columns=application | grep org.flatpak.Builder &> /dev/null || return 1
}

if ! has_flatpak_builder; then
    echo 'Install org.flatpak.Builder with flathub...'
    flatpak install -y flathub org.flatpak.Builder
fi
mkdir build
flatpak run org.flatpak.Builder --force-clean --install --user ./build ./org.kde.WaylandDecoration.QWhiteSurGtkDecorations.json

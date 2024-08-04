#!/bin/bash

has_flatpak_app(){
    flatpak list --app --columns=application | grep "$1"  &> /dev/null || return 1
}

has_flatpak_runtime(){
    flatpak list --runtime --columns=application,branch | grep "$1" | grep "$2"  &> /dev/null || return 1
}

if ! has_flatpak_app org.flatpak.Builder; then
    echo 'Installing org.flatpak.Builder with flathub...'
    flatpak install -y flathub org.flatpak.Builder
else
    echo 'org.flatpak.Builder exists.'
fi

if ! has_flatpak_runtime org.kde.Sdk 5.15-23.08; then
    echo 'Installing org.kde.Sdk/x86_64/5.15-23.08 with flathub...'
    flatpak install -y flathub org.kde.Sdk/x86_64/5.15-23.08
else
    echo 'org.kde.Sdk/x86_64/5.15-23.08 exists.'
fi

if [ ! -d ./build ];then
    mkdir build
fi

flatpak run org.flatpak.Builder --force-clean --install --user ./build ./org.kde.WaylandDecoration.QWhiteSurGtkDecorations.json

echo 'All Finished.'

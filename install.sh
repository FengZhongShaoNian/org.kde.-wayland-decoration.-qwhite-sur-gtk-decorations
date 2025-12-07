#!/bin/bash

has_fuse2(){
    pacman -Qs fuse2 &> /dev/null
}

has_flatpak_app(){
    flatpak list --app --columns=application | grep "$1"  &> /dev/null || return 1
}

has_kde_platform_runtime(){
    flatpak list --runtime --columns=application,branch | grep "org.kde.Platform" | grep "$1"  &> /dev/null || return 1
}

has_kde_sdk_runtime(){
    flatpak list --runtime --columns=application,branch | grep "org.kde.Sdk" | grep -v "org.kde.Sdk.Locale" | grep "$1"  &> /dev/null || return 1
}

if ! has_flatpak_app org.flatpak.Builder; then
    echo 'Installing org.flatpak.Builder with flathub...'
    sudo flatpak install -y flathub org.flatpak.Builder
else
    echo 'org.flatpak.Builder exists.'
fi

readonly sdk_version='6.8'
if ! has_kde_platform_runtime "$sdk_version"; then
    echo "Installing org.kde.Platform/x86_64/$sdk_version with flathub..."
    sudo flatpak install -y flathub "org.kde.Platform/x86_64/$sdk_version"
else
    echo "org.kde.Platform/x86_64/$sdk_version exists."
fi

if ! has_kde_sdk_runtime "$sdk_version"; then
    echo "Installing org.kde.Sdk/x86_64/$sdk_version with flathub..."
    sudo flatpak install -y flathub org.kde.Sdk/x86_64/$sdk_version
else
    echo "org.kde.Sdk/x86_64/$sdk_version exists."
fi

if [ ! -d ./build ];then
    mkdir build
fi

flatpak run org.flatpak.Builder --force-clean --install --user ./build ./org.inqlude.WaylandDecoration.QWhiteSurGtkDecorations.yml

flatpak build-bundle --runtime ~/.local/share/flatpak/repo "QWhiteSurGtkDecorations-$sdk_version.flatpak"  org.inqlude.WaylandDecoration.QWhiteSurGtkDecorations "$sdk_version"

echo 'All Finished.'

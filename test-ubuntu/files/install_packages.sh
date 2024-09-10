#!/usr/bin/env bash

# Settings for unattended installs
export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true
declare -r apt_opts='--assume-yes --option="Dpkg::Options::=--force-confdef" --option="Dpkg::Options::=--force-confold" --option="Dpkg::Options::=--force-unsafe-io"'

echo ">> Updating APT cache"
apt-get update

echo ">> Upgrading all base packages"
apt-get ${apt_opts} upgrade

echo ">> Installing Bat package"
apt-get ${apt_opts} install bat

echo "## Removing Any Deprecated Packages ##"
apt-get ${apt_opts} autoremove

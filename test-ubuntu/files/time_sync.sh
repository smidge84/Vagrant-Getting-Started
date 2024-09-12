#!/usr/bin/env bash

# A helper script which runs every time a VM is provisioned to synchronise the system time
# When a snapshot is restored, the system time will revert to the time captured by the snapshot
# which can impact time sensative operations
# usage:
# config.vm.provision "shell", name: "time", privileged: true, run: "always", path: "files/time_sync.sh"

systemctl restart systemd-timesyncd.service

# Wait a second for the time sync to complete
sleep 1

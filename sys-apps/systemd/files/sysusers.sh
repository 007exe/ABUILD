#!/bin/sh

echo "Creating system user accounts..."
chroot . usr/bin/sysusers

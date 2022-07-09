if [[ -f /var/lib/rpm/Packages ]] ; then
    echo "RPM database found... Rebuilding database (may take a while)..."
    /usr/bin/rpmdb --rebuilddb --root=/
else
    echo "No RPM database found... Creating database..."
    /usr/bin/rpmdb --initdb --root=/
fi

echo "    rpm installs RedHat package manager for you."
echo "    It is useful for those who wants to create/modify RPM files."
echo "    But don't use rpm to install Red Hat packages on your computer."
echo "    It will break your system!"

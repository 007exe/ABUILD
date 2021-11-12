#! /bin/bash

echo "packing setup variants"

rm -f setup_variants.tar.xz

tar cJf setup_variants.tar.xz setup_variants

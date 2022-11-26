_xmlcatalog() {
  xmlcatalog --noout "$@" etc/xml/catalog
}

  [[ -f etc/xml/catalog ]] || _xmlcatalog --create

  local ver x new=${1%-*}

  for ver in $new current; do
    for x in rewriteSystem rewriteURI; do
      _xmlcatalog --add $x http://cdn.docbook.org/release/xsl/$ver \
        /usr/share/xml/docbook/xsl-stylesheets-$new

      _xmlcatalog --add $x http://cdn.docbook.org/release/xsl-nons/$ver \
        /usr/share/xml/docbook/xsl-stylesheets-$new-nons

      _xmlcatalog --add $x http://docbook.sourceforge.net/release/xsl-ns/$ver \
        /usr/share/xml/docbook/xsl-stylesheets-$new

      _xmlcatalog --add $x http://docbook.sourceforge.net/release/xsl/$ver \
        /usr/share/xml/docbook/xsl-stylesheets-$new-nons
    done
  done

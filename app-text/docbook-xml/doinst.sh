if [ -e etc/xml/catalog.preserve ]; then
  mv etc/xml/catalog.preserve etc/xml/catalog
elif [ ! -e etc/xml/catalog ]; then
  xmlcatalog --noout --create etc/xml/catalog
fi
xmlcatalog --noout --add "delegatePublic" \
  "-//OASIS//ENTITIES DocBook XML" \
  "file:///etc/xml/docbook-xml" \
  etc/xml/catalog
xmlcatalog --noout --add "delegatePublic" \
  "-//OASIS//DTD DocBook XML" \
  "file:///etc/xml/docbook-xml" \
  etc/xml/catalog
xmlcatalog --noout --add "delegateSystem" \
  "http://www.oasis-open.org/docbook/" \
  "file:///etc/xml/docbook-xml" \
  etc/xml/catalog
xmlcatalog --noout --add "delegateURI" \
  "http://www.oasis-open.org/docbook/" \
  "file:///etc/xml/docbook-xml" \
  etc/xml/catalog

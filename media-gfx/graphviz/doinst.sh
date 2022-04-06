echo -e "\n"
echo -e "The following packages extend graphviz capabilities:"
echo -e "mono: sharp bindings"
echo -e "guile: guile bindings"
echo -e "lua: lua bindings"
echo -e "ocaml: ocaml bindings"
echo -e "perl: perl bindings"
echo -e "python: python bindings"
echo -e "r: r bindings"
echo -e "tcl: tcl bindings"
echo -e "qt5-base: gvedit"
echo -e "gtk2: gtk output plugin"
echo -e "xterm: vimdot"
echo -e ""

rm -f usr/lib/graphviz/config{,6}
usr/bin/dot -c

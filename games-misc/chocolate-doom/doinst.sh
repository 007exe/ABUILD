echo -e " "
echo -e "The following packages extend chocolate-doom capabilities:"
echo -e "freedm: Free deathmatch game"
echo -e "freedoom1: Free Ultimate Doom-compatible game"
echo -e "freedoom2: Free Doom II-compatible game"
echo -e " "

cat <<EOF
To install game data (*.wad files), there are two main locations for
the engine to easily find them:
 * For all users: /usr/share/games/doom
 * For a single user: ~/.local/share/games/doom

Files such as doom2.wad, heretic.wad, hexen.wad, and strife1.wad are
appropriate for installation and usage with Chocolate engines.
EOF

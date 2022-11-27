git submodule init
git pull --recurse-submodules

echo '
#################################################
#         MY LOVELY DOTFILE INSTALLER           #
#                made by chazzox                #
#################################################\n\n'

echo '
#################################################
#            Please not that before             #
#             you run this script               #
#     have fish, tmux and alacrity installed    #
#################################################'

requirements_valid=true

SUB='fish'

if [[ "$SHELL" =~ .*"$SUB".* ]]; then
 echo
else
  echo
  echo fish not detected please install via brew or 
  echo https://fishshell.com/
  echo
  requirements_valid=false
fi


if [ $TERM != "alacritty" ]; then
  echo alacritty not detected please install via brew or 
  echo https://github.com/alacritty/alacritty
  echo
  requirements_valid=false
fi

if [ "$requirements_valid" = false ]; then
  echo Something went wrong, exiting
  exit 0
else
  echo "All requirements found"
fi


read -p "Are you sure you want to continue? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]; then
  echo '\ncreating config directory at ~/.config\n'
  mkdir -p ~/.config
  
  echo '\ncreating tmux config at ~/.tmux.conf\n'
  cp ./tmux/tmux.conf ~/.tmux.conf
  echo 'installing tmux plugin manager\n'
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  echo '\ncreating alacritty config at ~/.config/alacritty\n'
  mkdir -p ~/.config/alacritty
  cp ./alacritty/alacritty.yml ~/.config/alacritty

  echo '\ncreating fish config at ~/.config/fish\n'
  mkdir -p ~/.config/fish
  cp ./fish/config.fish ~/.config/fish/config.fish
else 
  echo 'exiting...'
  exit 0
fi

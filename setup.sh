curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
touch ~/.config/gtk-3.0/gtk.css   
ln -s ~/Git/dotfiles/.config/gtk-3.0/gtk.css ~/.config/gtk-3.0/gtk.css
touch ~/.vimrc
ln -s ~/Git/dotfiles/.vimrc ~/.vimrc
touch ~/.config/nvim/init.vim
ln -s ~/Git/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
touch ~/.config/nvim/coc-settings.json
ln -s ~/Git/dotfiles/.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

cp whatsapp-desktop-webapp.desktop ~/.local/share/applications/

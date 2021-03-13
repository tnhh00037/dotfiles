#!/bin/bash
CPWD="$PWD"

function cmd_exists () {
    command -v $1 > /dev/null 2>&1
}

# Linux
if [[ $OSTYPE == "linux-gnu"* ]]

## Linux will download nvim.appimage for compact and latest vim
then

    # Install vim
    wget -c https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage  && chmod u+x nvim.appimage \
    && sudo mv $PWD/nvim.appimage /usr/local/bin/nvim

    # Install Rg (ripgrep)
    wget -c https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb \
    && sudo dpkg -i ./ripgrep_12.1.1_amd64.deb 

    ## Install fd ( fzf replacement )
    wget -c https://github.com/sharkdp/fd/releases/download/v8.2.1/fd-musl_8.2.1_amd64.deb && sudo dpkg -i ./fd-musl_8.2.1_amd64.deb

    rm ./ripgrep_12.1.1_amd64.deb  ./fd-musl_8.2.1_amd64.deb

fi









# OSX
if [[ $OSTYPE == "darwin"* ]]
then
 cmd_exists nvim ; [[ "$?" -eq 1 ]] \
&&  brew install neovim

 # Install Ripgrep search:
 brew install ripgrep
fi










###### Make folder for vim config``
[[ ! -d ~/.config ]] && mkdir -p ~/.config/nvim/ 
echo "User $USER"

###### Install virtualenv to containerize dependencies
which python3 > /dev/null && [ "$?" -eq 1 ] && sudo apt install python3 python3-pip -y || echo "Python3 exists"

python3 -m pip install virtualenv
python3 -m virtualenv -p python3 ~/.config/nvim/env

source ~/.config/nvim/env/bin/activate

###### Install python dependencies
pip install neovim jedi psutil setproctitle yapf pynvim
deactivate

###### Intall neovim for node
npm install -g neovim

###### Load vim-plug-manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


###### Enter Neovim and install plugins using a temporary init.vim, which avoids warnings about missing colorschemes, functions, etc
cp $CPWD/init.vim ~/.config/nvim/init.vim

/usr/local/bin/nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'

rm ~/.config/nvim/init.vim

###### Copy Coc setting (currently autoformat):
cd "$CPWD"
cp ./coc-settings.json ~/.config/nvim/

###### Copy floating window config:
cp fzf-floating.vim ~/.config/nvim/plugged/

###### copy darker config for gruvbox-material
cp gruvbox_material.vim ~/.config/nvim/plugged/gruvbox-material/autoload/


###### Install lazygit
sudo add-apt-repository ppa:lazygit-team/release -y
sudo apt-get update
sudo apt-get install lazygit


###### create simlink for vim-configs:
ln -s $PWD/init.vim ~/.config/nvim/init.vim
ln -s $PWD/global-config.vim ~/.config/nvim/global-config.vim
ln -s $PWD/plugin-config.vim ~/.config/nvim/plugin-config.vim

function cmd_exists () {
    command -v $1 > /dev/null 2>&1
}

## Install vim
# Should install with apt instead of pip

# Linux
if [[ $OSTYPE == "linux-gnu"* ]]
then
 cmd_exists nvim ; [[ "$?" -eq 1 ]] \
&&  sudo apt install neovim 

 # Install Ripgrep search:
 sudo apt install rip-grep
fi

# OSX
if [[ $OSTYPE == "darwin"* ]]
then
 cmd_exists nvim ; [[ "$?" -eq 1 ]] \
&&  brew install neovim

 # Install Ripgrep search:
 brew install ripgrep
fi

 # Make folder for vim config``
[[ ! -d ~/.config ]] && mkdir -p ~/.config/nvim

# Install virtualenv to containerize dependencies
python3 -m pip install virtualenv
python3 -m virtualenv -p python3 ~/.config/nvim/env
source ~/.config/nvim/env/bin/activate

# Install python dependencies
pip install neovim jedi psutil setproctitle yapf pynvim
deactivate

# Intall neovim for node
npm install -g neovim

# Load vim-plug-manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Enter Neovim and install plugins using a temporary init.vim, which avoids warnings about missing colorschemes, functions, etc
sed '/call plug#end/q' init.vim > ~/.config/nvim/init.vim # Default vim-config
nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'
rm ~/.config/nvim/init.vim

# Copy Coc setting (currently autoformat):
cp coc-setting.json ~/.config/nvim/

# Copy floating window config:
cp fzf-floating.json ~/.config/nvim/

# create simlink for vim-configs:
ln -s ./init.vim ~/.config/nvim/init.vim
ln -s ./global-config.vim ~/.config/nvim/global-config.vim
ln -s ./pluginc-config.vim ~/.config/nvim/plugin-config.vim

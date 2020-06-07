# !/bin/bash

# Save current directory
CPWD=$PWD

function cmd_exists() {
	command -v $1 > /dev/null 2>&1
}

if [[ $OSTYPE == "linux-gnu"* ]]
then
	echo Linux machine. 
 	
	### LINUX
	
	## Update apt
	apt update -y
	## Install wget
	apt install wget -y
	
    ## Install vim
    apt install vim -y
    
	## Install git
	apt install git -y

    ## Install xlip ( for tmux copy/pase )
    apt install xlip -y

    ## Install lsd (colorful ls)
    which autojump && [ "$?" -eq 1 ] \
    && wget -c -O /tmp/lsd.deb 'https://github.com/Peltoche/lsd/releases/download/0.17.0/lsd-musl_0.17.0_amd64.deb' \
     && dpkg -i /tmp/lsd.deb || echo "Autojump already existed. "

	## Install zsh
	# Get zsh
	apt install zsh -y
	# Use zsh as default
	chsh -s /bin/zsh
	
	## Install oh-my-zsh
    	wget -c -O /tmp/oh-my-zsh.sh 'https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh'

	[[ ! -d "$HOME"/.oh-my-zsh ]] && echo y | sh /tmp/oh-my-zsh.sh -y || echo Oh-my-zsh existed
    
    ## Install ZSH plugins
    [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k ]] \
    && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
    
    # Install auto suggestion plugin
    [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]] \
    && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


    [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]] \
	&& git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    ## Install autojump
    apt install python -y
    cd
    git clone git://github.com/wting/autojump.git
    cd autojump && python ./install.py

    ## Install tmux & plugins
    # tmux
    apt-get install tmux -y
    # plugins management
    git clone https://github.com/tmux-plugins/tpm  ~/.tmux/tpm
    # plugins: Tmux Resurrect
    	[[ ! -d ~/.tmux/plugins/tmux-resurrect ]] \
    && git clone https://github.com/tmux-plugins/tmux-resurrect  ~/.tmux/plugins/tmux-resurrect \
    && [ ! -d ~/.tmux/plugins/ ] &&  tmux && tmux source ~/.tmux.conf && ~/.tmux/plugins/tpm/scripts/update_plugin.sh
    ## Install f ( replace fzf )
   apt install fd-find 

fi

if [[ $OSTYPE == "darwin"* ]]
then

	echo MacOs machine. 
 	
	### OS X

	## Install XCode
	cmd_exists xcode-select ; [[ "$?"  -eq 1 ]] && xcode-select —-install 

	## Install Homebrew
	cmd_exists brew ; [[ "$?"  -eq 1 ]] \
	&& /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    	## Install vim
	cmd_exists nvim ; [[ "$?" -eq 1 ]] \
	&& brew install neovim

    mkdir -p ~/.config/nvim
    cp $CPWD/init.vim ~/.config/nvim/init.vim
    
	## Install git
	cmd_exists "git --version" ; [[ "$?" -eq 1 ]] \
	&& brew install git


	## Install xlip ( for tmux copy/pase ) ( check mac need or not)
    	# apt install xlip -y

    	## Install lsd (colorful ls)
    	cmd_exists lsd ; [ "$?" -eq 1 ] \
    	&& brew install lsd || echo "Lsd already existed. "

	## Install zsh
	# Get zsh
    	cmd_exists zsh ; [ "$?" -eq 1 ] \
	&& brew install zsh

	# Use zsh as default
	chsh -s /bin/zsh
	
	## Install oh-my-zsh
	[[ ! -d "$HOME"/.oh-my-zsh ]] \
    	&& wget -c -O /tmp/oh-my-zsh.sh 'https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh' \
     	&& echo y | sh /tmp/oh-my-zsh.sh -y || echo Oh-my-zsh existed
    
    	## Install font
    	## Install p10k theme
    	[[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k ]] \
    	&& git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
    
    	# Install auto suggestion plugin
    	[[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]] \
    	&& git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


    	[[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]] \
	&& git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting   

    	## Install autojump
    	# Install python first
    	cmd_exists python ; [[ "$?" -eq 1 ]] && brew install python

    	cmd_exists autojump ; [[ "$?" -eq 1 ]] && git clone git://github.com/wting/autojump.git \
    	&& cd autojump && python ./install.py \
	&& cd .. && rm -rf ./autojump

    	## Install tmux & plugins
    	# tmux
    	which tmux > /dev/null 2>&1 ; [[ "$?" -eq 1 ]] && brew install tmux

    	# plugins management
    	[[ ! -d  ~/.tmux/tpm ]] \
    	&& git clone https://github.com/tmux-plugins/tpm  ~/.tmux/tpm

    	# plugins: Tmux Resurrect
    	[[ ! -d ~/.tmux/plugins/tmux-resurrect ]] \
    	&& git clone https://github.com/tmux-plugins/tmux-resurrect  ~/.tmux/plugins/tmux-resurrect \
    	&& [ ! -d ~/.tmux/plugins/ ] &&  tmux && tmux source ~/.tmux.conf && ~/.tmux/plugins/tpm/scripts/update_plugin.sh || echo "tmux-resurrect existed" 
    	## Install f ( replace fzf )
   	# apt install fd-find 

   	### Create simlink


fi

## like .node ; .nvm ; .android; .go ; .ros... for better for your mainternance
# Put all your configs inside ~/.dotfile/.local folder
[[ ! -d ~/.dotfiles/.local ]] && mkdir -p ~/.dotfiles/.local

## Backup .zshrc config  ( incase )
## New ~/.zshrc will source .zshrc.local ( your old zsh )
## Please modify your .zshrc.local to be suitable ( it's better to be separate with zshrc)
[[ -f ~/.zshrc ]] &&  mv ~/.zshrc ~/.local/.zshrc.local
    
## Create simlink for dotfiles.
# [ ! -d ~/.dotfiles ] && mkdir ~/.dotfiles
cd "$CPWD"
cp "$PWD"/.zshrc ~
cp "$PWD"/.tmux.conf ~
cp "$PWD"/.profile ~
cp "$PWD"/.profile.local ~/.dotfiles/.local/

## Copy all dotfiles to ~/.dotfiles
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
A=( $SCRIPTPATH/.* )
for f in ${A[@]}
do
     [[ -f $f ]] && [[ ! $f == "$SCRIPTPATH/.zshrc" ]] && [[ ! $f == "$SCRIPTPATH/.tmux.conf" ]]  && [[ ! $f == "$SCRIPTPATH/.gitignore" ]] &&   [[ ! $f == "$SCRIPTPATH/.profile"* ]] && cp $f ~/.dotfiles/
done

echo source "$HOME"/.profile >> ~/.zshrc
#echo source "$HOME"/.dotfiles/.local/.profile.local >> ~/.zshrc

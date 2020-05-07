#!/bin/bash
CPWD=$PWD
if [[ $OSTYPE == "linux-gnu"* ]]
then
	echo Linux machine. 
 	
	### LINUX
	
	## Update apt
	apt update -y
	## Install wget
	apt install wget -y
	
	## Install git
	apt install git -y

    ## Install lsd (colorful ls)
    wget -c -O /tmp/lsd.deb 'https://github.com/Peltoche/lsd/releases/download/0.17.0/lsd-musl_0.17.0_amd64.deb'
    dpkg -i /tmp/lsd.deb

	## Install zsh
	# Get zsh
	apt install zsh -y
	# Use zsh as default
	chsh -s /bin/zsh
	
	## Install oh-my-zsh
    wget -c -O /tmp/oh-my-zsh.sh 'https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh'

    [[ ! -d "$HOME"/.oh-my-zsh ]] && echo y | sh /tmp/oh-my-zsh.sh -y || echo Oh-my-zsh existed
    
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
    apt install python -y
    cd
    git clone git://github.com/wting/autojump.git
    cd autojump && python ./install.py

    ## Install tmux & plugins
    # tmux
    apt-get install tmux -y
    # plugins: Tmux Resurrect
    [[ ! -d ~/tmux_plugins/tmux-resurrect/]] \
    && git clone https://github.com/tmux-plugins/tmux-resurrect ~/tmux_plugins/
    
   ### Create simlink

   ## Backup .zshrc config  ( incase )
    [[ -f ~/.zshrc ]] &&  mv ~/.zshrc ~/.zshrc.bak

    [[ -f ~/.profile ]] && mv ~/.profile ~/.profile.bak
    
    ## Create simlink for dotfiles.
    # [ ! -d ~/.dotfiles ] && mkdir ~/.dotfiles
    cd "$CPWD"
    cp "$PWD"/.zshrc ~ 
    cp "$PWD"/.tmux.conf ~
    echo source "$PWD"/.profile >> ~/.zshrc

fi

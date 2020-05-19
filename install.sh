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
    # plugins management
    git clone https://github.com/tmux-plugins/tpm  ~/.tmux/tpm
    # plugins: Tmux Resurrect
    [[ ! -d ~/tmux_plugins/tmux-resurrect/ ]] \
    && git clone https://github.com/tmux-plugins/tmux-resurrect  ~/.tmux/plugins/tmux-resurrect \
    && [ ! -d ~/.tmux/plugins/ ] &&  tmux && tmux source ~/.tmux.conf && ~/.tmux/plugins/tpm/scripts/update_plugin.sh
    
   ### Create simlink

   ## Backup .zshrc config  ( incase )
   ## New ~/.zshrc will source .zshrc.local ( your old zsh )
   ## Please modify your .zshrc.local to be suitable ( it's better to be separate with zshrc
   ## like .node ; .nvm ; .android; .go ; .ros... for better for your mainternance

    [[ -f ~/.zshrc ]] &&  mv ~/.zshrc ~/.zshrc.local

    [[ -f ~/.profile ]] && mv ~/.profile ~/.profile.bak
    
    ## Create simlink for dotfiles.
    # [ ! -d ~/.dotfiles ] && mkdir ~/.dotfiles
    cd "$CPWD"
    cp "$PWD"/.zshrc ~ 
    cp "$PWD"/.tmux.conf ~
    echo source "$PWD"/.profile >> ~/.zshrc
    # zsh
fi

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
    if ! [ -d "$HOME"/.oh-my-zsh ]
    then
        echo y | sh /tmp/oh-my-zsh.sh -y
    echo Oh-my-zsh existed
    fi
    
    ## Install font
    ## Install p10k theme
    if  ! [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k ]
    then
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
    fi
    
    # Install auto suggestion plugin
    if ! [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]
    then
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    fi

    if ! [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]
    then
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting   
	fi

    ## Install autojump
    apt install python -y
    cd
    git clone git://github.com/wting/autojump.git
    cd autojump && python ./install.py

    ## Install tmux & plugins
    # tmux
    apt-get install tmux -y
    # plugins: Tmux Resurrect
    git clone https://github.com/tmux-plugins/tmux-resurrect ~/tmux_plugins/
    git clone https://github.com/tmux-plugins/tmux-continuum ~/tmux_plugins/
    
   ### Create simlink

   ## Backup .zshrc config  ( incase )
   if [ -f ~/.zshrc ]
   then 
       mv ~/.zshrc ~/.zshrc.bak
    fi

    if [ -f ~/.profile ]
    then
      mv ~/.profile ~/.profile.bak
    fi
    
    ## Create simlink for dotfiles.
    # [ ! -d ~/.dotfiles ] && mkdir ~/.dotfiles
    cd "$CPWD"
    cp "$PWD"/.zshrc ~ 
    cp "$PWD"/.tmux.conf ~
    echo source "$PWD"/.profile >> ~/.zshrc

fi

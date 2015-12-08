# Utile pour lancer chruby, à mettre en premier pour permettre à ZSH de fonctionner
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby $(cat ~/.ruby-version)
#chruby `cat ~/.ruby-version`

export EDITOR='~/bin/subl --new-window'

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster2"


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(autojump brew bundler            gem git github heroku node osx pow rails redis-cli      textmate vagrant)
# plugins=(autojump brew bundler capistrano gem git        heroku      osx pow rails           ruby          vagrant)
plugins=(autojump brew brew-cask bundler capistrano chruby coffee common-aliases dirhistory docker gem git git-flow-avh github heroku history node osx pow rails rake redis-cli ruby sublime textmate vagrant zeus)

source $ZSH/oh-my-zsh.sh


############################################################################
# Customize to your needs...
############################################################################
export PATH=/usr/texbin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/sbin:$PATH
export PATH=/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=~/bin:$PATH
export PATH=./bin:$PATH

# Mes alias
source ~/.zsh_alias

# Lance la mise à jour de BREW une fois par jour ...
~/bin/brew-auto_update.rb

fpath=(/usr/local/share/zsh-completions $fpath)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

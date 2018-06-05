# PKG_CONFIG
export PKG_CONFIG=/opt/pkgconfig/bin/pkg-config
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/X11/lib/pkgconfig

# nvm
# export NVM_DIR=~/.nvm; source /usr/local/opt/nvm/nvm.sh

# rust
source $HOME/.cargo/env

# library path
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

# racer
export RUST_SRC_PATH=/usr/local/src/rust/src/

# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_20.jdk/Contents/Home

# get path from .path_file
path_file=$(cat ~/.path_file)
export PATH=$(echo $path_file | tr -d ' ')

################################################################################

if [[ $TERM_PROGRAM == "Hyper" ]]; then
  export PS1="👾 \w\$ "
elif [[ $TERM_PROGRAM == "Apple_Terminal" ]]; then
  export PS1="👾  \w\$ "
else
  export PS1="\w\$ "
fi

# export PS1="\w\$ "
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced # dark theme
export HISTCONTROL=ignoreboth:erasedups

# export NVM_DIR="/Users/JacobWunder/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


################################################################################
function shorts {
  echo " * cdd <folder name> – open ~/Documents/<folder name>"
  echo " * bup – update and upgrade homebrew"
  echo " * proj [ --babel | --grunt ] – create new project"
  echo " * pyserver – clear and run python SimpleHTTPServer in current folder"
  echo " * f – opens current folder in finder"
  echo " * editrc - opens .bash_profile in atom"
  echo " * edithy - opens .hyperterm.js in atom"
  echo " * rerc - re-runs .bash_profile"
}

alias f='open -a Finder ./'

alias py2=python2
alias py3=python3
alias pyserver='clear && python3 -m http.server'

function activate {
  source "$1/bin/activate";
}


function quote {
  echo "\"$1\" -$2 $3" >> ~/Dropbox/quotes.md
}

function cdd {
  cd ~/Documents/$1
}

function _cdd {
  local cur=${COMP_WORDS[COMP_CWORD]}
  directories="$(ls -d ~/Documents/*)"
  completions=$(echo "$directories" | sed 's/\/Users\/jacob\/Documents\///g')
  COMPREPLY=( $(compgen -W "$completions" -- $cur) )
}
complete -F _cdd cdd

function bup {
  brew update
  brew upgrade
}

function projNpmInit {
  if [[ ! -a ./package.json ]]; then
    npm init
  fi
}

function editrc {
  atom ~/.bash_profile
}

function edithy {
  atom ~/.hyper.js
}

function rerc {
  . ~/.bash_profile
}

function cs {
  num=$1

  case ${#num} in
    1 )
      num=00$num;;
    2 )
      num=0$num;;
  esac

  folder=""

  case $2 in
    "-a" )
      folder=assignment$3;;
    "-l" )
      folder=lab$3;;
  esac

  if [[ ! -a ~/Documents/cs$num/$folder ]]; then
    mkdir ~/Documents/cs$num/$folder
  fi

  cdd cs$num/$folder
}

function pathadd {
  echo :$1 >> ~/.path_file
}

function typora {
  open -a Typora $1
}

# nvm use > /dev/null

clear

# tput setaf 7
# echo "INFO: type \"shorts\" for a list of your shortcuts"
# tput sgr0

clear
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="parin"
source ~/.bash_profile

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

mycomputer() {
  # install neovim
  curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
  tar xzf nvim-macos.tar.gz
  ./nvim-macos/bin/nvim

  brew install mkcert
  # #install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  # install prisma
  brew install prisma
  brew install --cask prisma-studio
  # openlens
  brew install --cask openlens
  pnpm install --no-store
}

run() {
  dotnet watch run
}

tsproject() {
  args=("$@")
  for arg in "${args[@]}"; do

    npx typescript-express-starter ${arg}
  done
}

mono-service() {
  args=("$@")
  for arg in "${args[@]}"; do
    :
    git clone https://codelanding@gitlab.com/mono-product/mono-template.git ${arg}
    cd ${arg}
    rm -rf .git
    cd ..
  done
}

plandict() {
  echo 'password : f478fb75b477'
  ssh root@95.111.195.20
}

submodule() {
  git submodule update --init --recursive
  git fetch --recurse-submodules
}

dcleanup() {
  docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
  docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

extension() {
  npm install -g yo generator-code

}

cmd() {
  sh command.sh $1
}

webstorm() {
  open -a WebStorm $1
}
alias w='webstorm'

rider() {
  open -a Rider $1
}
alias r='rider'

config() {
  sudo code ~/.zshrc
}
dev() {
  # pnpm run dev
  yarn dev -p 80
}

pm2() {
  yarn pm2
}

backup() {
  rm ~/Documents/Github/Sandbox/my-mac/.zshrc
  cp ~/.zshrc ~/Documents/Github/Sandbox/my-mac/
  rm ~/Documents/Github/Sandbox/my-mac/.bash_profile
  cp ~/.bash_profile ~/Documents/Github/Sandbox/my-mac/
  current_dir=$(pwd)
  cd ~/Documents/Github/Sandbox/
  fly "update : renew zshrc"
  cd $current_dir
  reload
}

reload() {
  source ~/.zshrc
  # service network-manager restart.
  # systemctl restart systemd-hostnamed.
  if [ -d "./package.json" ]; then
    refresh
  fi
}

alias ..="cd .."
alias hosts="code /etc/hosts"

alias c='clear'
alias r='reset'
alias e='exit'
alias i='pnpm i'
#nvim
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
alias vimdiff="nvim -d"
alias zshconfig="nvim ~/.zshrc"

alias mono-project="cd ~/Documents/workspace/mono-project/"
alias mono-libs="cd ~/Documents/workspace/mono-libs/"
alias mono-system="cd ~/Documents/limbo/mono-system"
alias limbo="cd ~/Documents/limbo/"
alias github="cd ~/Documents/github/"
alias workspace="cd ~/Documents/workspace/"
alias makesflow="cd ~/Documents/workspace/makesflow"
alias ps="docker ps -a"
alias up='docker-compose up'

alias fup='docker-compose down;docker-compose up'

boom() {
  # sudo rm -r ~/Documents/limbo/
  # sudo rm -r ~/Documents/GitHub/
  # sudo rm -r ~/Documents/gi/
  # sudo rm -r /Applications/Navicat\ Premium.app/reset.sh
  # backup
  # mv ~/.zshrc_bak ~/.zshrc
  echo boom

}

sh /Applications/Navicat\ Premium.app/reset.sh

alias vhost="code /etc/hosts"

redocker() {
  docker stop $(docker ps -a -q)
  docker rm $(docker ps -a -q)
  docker rmi $(docker images -q)
  docker volume rm $(docker volume ls -q)
  docker network rm $(docker network ls -q)
  docker-compose up
}
# sp stand for save point
sp() {
  git add .
  git commit -m "temp : checkpoint"
  git push
  git fetch
}

lint() {
  npx sort-package-json
  npx prettier --write './**/*.{ts,json}'
}

run() {
  if test -f "./package-lock.json"; then
    rm package-lock.json
    touch package-lock.json
  fi
  npm run $1
}

jump() {
  echo 🚀🚀🚀 'jump to repo' 🚀🚀🚀
  echo 🚀🚀🚀 'with verify check' 🚀🚀🚀
  git add .
  git commit -m "$1"
  git push
  git fetch
  echo 🛰🛰🛰 "I'm move like jagger" 🛰🛰🛰
}

fly() {
  echo 🚀🚀🚀 'quick push to repo' 🚀🚀🚀
  echo 🚀🚀🚀 'without verify check' 🚀🚀
  git add .
  git commit -m "$1" --no-verify
  git push
  git fetch
  echo 🛰🛰🛰 "I'm in the sky" 🛰🛰🛰
}

save() {
  git add .
  git commit -m "$1"
  git push
  git fetch
}
load() {
  git reset --hard HEAD
  git pull --rebase
  git fetch
}

update() {
  git add .
  git commit -m "update : $1"
  git push
  git fetch
}

fixed() {
  git add .
  git commit -m "fixed : $1"
  git push
  git fetch
}

sleep() {
  pmset sleepnow
}

refresh() {
  echo 🔥🔥🔥 refresh 🔥🔥🔥
  # git clean -xdf

  dirs=("dist")
  for dir in "${dirs[@]}"; do
    if [ -d "./$dir" ]; then
      rm -r "./$dir"
    fi
  done

  # clear yarn package
  if [ -f ".yarnrc.yml" ]; then
    files=("./pnpm-lock.yaml" "./package-lock.json" "./yarn.lock" ".pnp.*")
    for file in "${files[@]}"; do
      if [ -f "./$file" ]; then
        rm "./$file"
      fi
    done
    touch yarn.lock
    yarn cache clean
    yarn install
  fi

  # clear pnpm package
  if [ -d "./node_modules" ]; then
    files=("./pnpm-lock.yaml" "./package-lock.json")
    for file in "${files[@]}"; do
      if [ -f "./$file" ]; then
        rm "./$file"
      fi
    done
    rm -r "./node_modules"
    pnpm install
  fi

  echo 🔥🔥🔥 "already refresh" 🔥🔥🔥
}

mono() {
  code ~/Documents/limbo/project.code-workspace
}

reorder() {
  find ./ -name .DS_Store -delete
  killall Finder
  find . -type d -empty -delete
}

kill-port() {
  #!/bin/bash

  # killport - Kill a process using a specific port
  # Usage: killport <port> [-f|--force] [-u|--udp]
  # Example: killport 3000
  # Author: https://github.com/BalliAsghar

  # Colors
  RED='\033[0;31m'
  GREEN='\033[0;32m'
  YELLOW='\033[0;33m'
  NC='\033[0m' # No Color

  # Parse command line arguments
  force=0
  udp=0
  port=""

  # write a cleanup function which basically aborts the script
  cleanup() {
    echo -e "${RED}Aborting${NC}"
    exit 1
  }

  # Parse the port number from the command line arguments
  if [[ $# -gt 0 ]]; then
    port=$1
  else
    echo "Usage: killport <port> [-f|--force] [-u|--udp]" >&2
    exit 1
  fi

  # Validate the port number
  if ! [[ $port =~ ^[0-9]+$ && $port -gt 0 && $port -lt 65536 ]]; then
    echo -e "${RED}Invalid port number: $port${NC}" >&2
    exit 1
  fi

  # Parse any additional command line arguments
  shift
  while [[ $# -gt 0 ]]; do
    case $1 in
    -f | --force)
      force=1
      shift
      ;;
    -u | --udp)
      udp=1
      shift
      ;;
    *)
      echo -e "${RED}Invalid argument: $1${NC}" >&2
      exit 1
      ;;
    esac
  done

  # Find the process using the port
  if [[ $udp -eq 1 ]]; then
    command="lsof -n -i udp:$port"
  else
    command="lsof -n -i tcp:$port"
  fi

  if [[ $force -eq 1 ]]; then
    kill_command="kill -9"
  else
    kill_command="kill"
  fi

  # set the trap to call the cleanup function
  trap cleanup SIGINT SIGTERM

  # Check if the lsof and kill commands are available
  if ! command -v lsof >/dev/null 2>&1 || ! command -v kill >/dev/null 2>&1; then
    echo -e "${RED}Error: lsof and kill commands are required${NC}" >&2
    exit 1
  fi

  # Try running the command and capture any errors
  if ! pids=$(eval "$command" 2>/dev/null | awk '{if(NR>1) print $2}'); then
    echo -e "${RED}Error: Failed to find process using port $port${NC}" >&2
    exit 1
  fi

  pids=$(eval "$command" | awk '{if(NR>1) print $2}')
  if [[ -z $pids ]]; then

    echo -e "${YELLOW}No process is using port $port${NC}"
    exit 1
  fi

  # Prompt the user before killing the process(es), if force mode is not enabled
  if [[ $force -eq 0 ]]; then
    echo -e "${YELLOW}The following process(es) are using port $port:${NC}"
    eval "$command"
    echo -e -n "Kill the process(es)? [y/N] "
    read answer
    if [[ $answer != "y" && $answer != "Y" ]]; then
      cleanup
    fi
  fi

  #

  # Kill the process(es)
  for pid in $pids; do
    # Try running the kill command and capture any errors
    if ! eval "$kill_command $pid" 2>/dev/null; then
      echo -e "${RED}Error: Failed to kill process with PID $pid${NC}" >&2
    else
      echo -e "PID ${YELLOW}$pid${NC} killed"
    fi
  done

  echo -e "${GREEN}Done${NC}"
}

prettier() {
  npx sort-package-json &
  prettier --write "./**/*.{js,ts,json}"
  npx prisma format
}

mkfile() {
  mkdir -p $1
  touch $1/$2
}

# Git
git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2>/dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return
    ref=$(command git rev-parse --short HEAD 2>/dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

#

plugins=(git)
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# pnpm
export PNPM_HOME="~/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

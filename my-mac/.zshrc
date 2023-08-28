clear
export PATH="/usr/local/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="parin"
source ~/.bash_profile

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export DOTNET_ROOT=/usr/local/Cellar/dotnet/7.0.100/libexec

plandict() {
  echo 'password : f478fb75b477'
  ssh root@95.111.195.20
}

dcleanup() {
  docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
  docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

cmd() {
  sh command.sh $1
}

config() {
  sudo code ~/.zshrc
}

camel() {

  # Loop through each file in the current directory
  for file in *; do
    # Extract the first character of the file name
    first_char=$(echo $file | cut -c1)

    # Convert the first character to lowercase
    lower_first_char=$(echo $first_char | tr 'A-Z' 'a-z')

    # Extract the rest of the file name (from 2nd character to the end)
    rest_of_file=$(echo $file | cut -c2-)

    # Combine the lowercase first character with the rest of the file name
    new_file="${lower_first_char}${rest_of_file}"

    # Rename the file
    if [ "$file" != "$new_file" ]; then
      mv "$file" "$new_file"
    fi
  done
}

backup() {
  rm ~/Documents/Github/Sandbox/my-mac/.zshrc
  cp ~/.zshrc ~/Documents/Github/Sandbox/my-mac/
  rm ~/Documents/Github/Sandbox/my-mac/.bash_profile
  cp ~/.bash_profile ~/Documents/Github/Sandbox/my-mac/
  current_dir=$(pwd)
  cd ~/Documents/Github/Sandbox/
  save "update : renew zshrc"
  cd $current_dir
  reload
}

cdesk() {
  current_dir=$(pwd)
  cd ~/Desktop
  rm *.png
  rm *.mov
  reorder
  cd "$current_dir"
}

reload() {
  source ~/.zshrc
  # service network-manager restart.
  # systemctl restart systemd-hostnamed.
}

alias ..="cd .."
alias hosts="code /etc/hosts"

alias c='clear'
alias r='reset'
alias e='exit'
#nvim
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
alias vimdiff="nvim -d"
alias zshconfig="nvim ~/.zshrc"

alias limbo="cd ~/Documents/limbo/"
alias github="cd ~/Documents/github/"
alias workspace="cd ~/Documents/workspace/"
alias makesflow="cd ~/Documents/workspace/makesflow"
alias siamraj="cd ~/Documents/workspace/siamraj"
alias ps="docker ps -a"
alias up='docker-compose up'
# alias fup='docker-compose down;docker-compose up'

fup() {
  docker-compose down
  yes | docker image prune
  docker-compose up --force-recreate
}

booom() {
  backup
  sudo rm -r ~/Documents/limbo/
  sudo rm -r ~/Documents/GitHub/
  sudo rm -r ~/Documents/git/
  sudo rm -r /Applications/Navicat\ Premium.app/reset.sh
  echo boom

}
rider() {
  cat /Applications/Rider.app/key.txt
}

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
  iteration=0
  while [ $iteration -lt 2 ]; do
    git add .
    git commit -m "temp : save point"
    iteration=$((iteration + 1))
  done
  echo "All changes have been pushed."
  git fetch
}

test() {
  sh test.sh
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
  sh update.sh
}

module() {
  current_dir=$(pwd)
  DIR=./libs
  for dir in $(find $DIR -mindepth 1 -maxdepth 1 -type d); do
    cd $dir
    [ "$1" = "pull" ] && git fetch && git reset --hard HEAD && git pull origin $2
    [ "$1" = "push" ] && git add . && git commit -m "Update submodule" && git push
    [ "$1" = "update" ] && git submodule update --init --recursive && git fetch --recurse-submodules
    [ "$1" = "rebase" ] && git reset --hard HEAD && git pull --rebase origin main
    cd $current_dir
  done
}

relibs() {
  modules=(
    "underscore git@gitlab.com:mono-libs/underscore.git"
    "webapi git@gitlab.com:mono-product/service-core.git"
  )

  for module in "${modules[@]}"; do
    name=${module%% *}
    url=${module#* }

    git submodule deinit "./libs/$name"
    git rm -r "./libs/$name"
    git submodule add "$url" "./libs/$name"
  done
}

merged() {
  git add .
  git commit -m "update : merged from $1"
  git push
  git fetch
}

fixed() {
  git add .
  git commit -m "fixed : $1"
  git push
  git fetch
}

# sleep() {
#   pmset sleepnow
# }

restart() {
  osascript -e 'tell application "System Events" to set quitapps to name of every application process whose visible is true and name is not "Finder"' -e 'repeat with closeall in quitapps' -e 'quit application closeall' -e 'end repeat'
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

fast_copy() {
  # Check if the correct number of arguments are passed
  if [ "$#" -ne 2 ]; then
    echo "Usage: $0 SOURCE_DIR DEST_DIR"
    exit 1
  fi

  # Check if source directory exists
  if [ ! -d "$1" ]; then
    echo "Source directory $1 does not exist."
    exit 1
  fi

  # Count total files in source directory
  total_files=$(find "$1" -type f | wc -l)

  # Initialize counter for copied files
  copied_files=0

  # Perform the copy with rsync, showing progress for each file
  rsync -a --progress "$1" "$2" | while read line; do
    # Detect lines that signal the end of a file copy
    if [[ $line == *to-chk=* ]]; then
      ((copied_files++))
      # Calculate percentage completion
      percent=$(printf "%.2f" $(echo "$copied_files / $total_files * 100" | bc -l))
      echo -ne "Overall Progress: ${percent}%\r"
    fi
  done

  echo -e "\nCopy complete."
}

reorder() {
  find ./ -name .DS_Store -delete
  find . -type d -empty -delete
  # find . -type d -empty -delete 2>/dev/null
  killall Finder
}
# find ./ -name "._*" -type f -delete
kill() {
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

pullall() {
  current_dir=$(pwd)
  for file in "."/*; do
    if [ -d "$file" ]; then
      cd $file
      git reset --hard HEAD
      git pull --rebase
      cd ..
    fi
  done
}

dropbox() {
  cd ~/Dropbox
}
#
plugins=(git)
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# pnpm
export PNPM_HOME="~/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

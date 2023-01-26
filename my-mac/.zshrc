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

}

webstorm() {
  open -a WebStorm $1
}

config() {
  sudo code ~/.zshrc
}
dev() {
  # pnpm run dev
  yarn dev
}

backup() {
  rm /Users/Parin/Documents/Github/Sandbox/my-mac/.zshrc
  cp ~/.zshrc /Users/Parin/Documents/Github/Sandbox/my-mac/
  rm /Users/Parin/Documents/Github/Sandbox/my-mac/.bash_profile
  cp ~/.bash_profile /Users/Parin/Documents/Github/Sandbox/my-mac/
  current_dir=$(pwd)
  cd /Users/Parin/Documents/Github/Sandbox/
  fly "update : renew zshrc"
  cd $current_dir
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
alias fup="docker-compose up --force-recreate"
# prisma
alias introspect="npx prisma introspect"

sh /Applications/Navicat\ Premium.app/reset.sh

alias vhost="code /etc/hosts"

update() {
  npx ncu -u
  yarn install
}
lint() {
  npx sort-package-json
  npx prettier --write './**/*.{tsx,ts,json}'
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
  fi
  touch yarn.lock
  yarn cache clean
  yarn install
  # clear pnpm package
  if [ -d "./node_modules" ]; then
    files=("./pnpm-lock.yaml" "./package-lock.json")
    for file in "${files[@]}"; do
      if [ -f "./$file" ]; then
        rm "./$file"
      fi
    done
    rm -r "./node_modules"

  fi
  pnpm install
  echo 🔥🔥🔥 "already refresh" 🔥🔥🔥
}

pack() {
  if [ -d "./public" ]; then
    rm -r ./public
  fi
  if [ -d "./system" ]; then
    rm -r ./system
  fi
  yarn install
  yarn build
  mkdir ./public
  yarn pack
  mv ./package.tgz ./public
}

mono() {
  code /Users/Parin/Documents/limbo/project.code-workspace
}

reorder() {
  find ./ -name .DS_Store -delete
  killall Finder
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
alias g=git
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'
alias gc='git commit -v'
alias 'gc!'='git commit -v --amend'
alias gca='git commit -v -a'
alias 'gca!'='git commit -v -a --amend'
alias gcam='git commit -a -m'
alias 'gcan!'='git commit -v -a --no-edit --amend'
alias 'gcans!'='git commit -v -a -s --no-edit --amend'
alias gcb='git checkout -b'
alias gcd='git checkout develop'
alias gcf='git config --list'
alias gcl='git clone --recursive'
alias gclean='git clean -fd'
alias gcm='git checkout master'
alias gcmsg='git commit -m'
alias 'gcn!'='git commit -v --no-edit --amend'
alias gco='git checkout'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcs='git commit -S'
alias gcsm='git commit -s -m'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdct='git describe --tags `git rev-list --tags --max-count=1`'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdw='git diff --word-diff'
alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'
alias gg='git gui citool'
alias gga='git gui citool --amend'
alias ggpull='git pull origin $(git_current_branch)'
alias ggpush='git push origin $(git_current_branch)'
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias ghh='git help'
alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
alias gk='\gitk --all --branches'
alias gke='\gitk --all $(git log -g --pretty=%h)'
alias gl='git pull'
alias glg='git log --stat'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glgp='git log --stat -p'
alias glo='git log --oneline --decorate'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glol='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit'
alias glola='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit --all'
alias glp=_git_log_prettily
alias glum='git pull upstream master'
alias gm='git merge'
alias gmom='git merge origin/master'
alias gmt='git mergetool --no-prompt'
alias gmtvim='git mergetool --no-prompt --tool=vimdiff'
alias gmum='git merge upstream/master'
alias gp='git push'
alias gpd='git push --dry-run'
alias gpoat='git push origin --all && git push origin --tags'
alias gpristine='git reset --hard && git clean -dfx'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gpu='git push upstream'
alias gpv='git push -v'
alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grbm='git rebase master'
alias grbs='git rebase --skip'
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias gru='git reset --'
alias grup='git remote update'
alias grv='git remote -v'
alias gsb='git status -sb'
alias gsd='git svn dcommit'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'
alias gsta='git stash save'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gsu='git submodule update'
alias gts='git tag -s'
alias gtv='git tag | sort -V'
alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'
alias gpfwl='git push --force-with-lease'
#

plugins=(git)
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# pnpm
export PNPM_HOME="/Users/Parin/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

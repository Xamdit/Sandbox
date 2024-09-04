#!/bin/bash
 
export ANDROID_SDK_ROOT=$HOME/Library/Developer/Xamarin/android-sdk-macosx
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
clear

# omz update
export PATH="/usr/local/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="parin"
source ~/.bash_profile
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/usr/local/mysql-8.3.0-macos14-arm64/bin"
export DOTNET_ROOT=/usr/local/Cellar/dotnet/7.0.100/libexec
export PATH="/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH"

pm2_restart(){
  pm2 save
  pm2 kill
  pm2 resurrect
}

sql_backup(){
  # mysqldump -u root -p --no-data your_database_name > output_file.sql
  mysqldump -u root -p --no-data $1 > $1.sql
}

jetbrain_reset(){
  for product in IntelliJIdea WebStorm DataGrip PhpStorm CLion PyCharm GoLand RubyMine Rider; do
  echo "Closing $product"
  ps aux | grep -i MacOs/$product | cut -d " " -f 5 | xargs kill -9

  echo "Resetting trial period for $product"

  echo "removing evaluation key..."
  rm -rf ~/Library/Preferences/$product*/eval

  # Above path not working on latest version. Fixed below
  rm -rf ~/Library/Application\ Support/JetBrains/$product*/eval

  echo "removing all evlsprt properties in options.xml..."
  sed -i '' '/evlsprt/d' ~/Library/Preferences/$product*/options/other.xml

  # Above path not working on latest version. Fixed below
  sed -i '' '/evlsprt/d' ~/Library/Application\ Support/JetBrains/$product*/options/other.xml

  echo
done
echo "removing additional plist files..."
rm -f ~/Library/Preferences/com.apple.java.util.prefs.plist
rm -f ~/Library/Preferences/com.jetbrains.*.plist
rm -f ~/Library/Preferences/jetbrains.*.*.plist

echo "restarting cfprefsd"
killall cfprefsd

echo "That's it, enjoy ;)"

}

xampp_restart(){
  sudo /Applications/XAMPP/xamppfiles/bin/apachectl stop
  sudo /Applications/XAMPP/xamppfiles/bin/apachectl start
} 
xampp_start(){
  sudo /Applications/XAMPP/xamppfiles/bin/apachectl start
}
xampp_stop(){
  sudo /Applications/XAMPP/xamppfiles/bin/apachectl stop
}

gmobi_gateway(){
  ssh -i /Users/parinkanthakamala/.ssh/gmobi root@188.166.197.194
}

gmobi_content(){
  ssh -i /Users/parinkanthakamala/.ssh/gmobi root@143.198.95.231
}
lotto(){
  echo "*6Cj)nB,dXUrqd?+"
  ssh root@45.76.181.177
  #  *6Cj)nB,dXUrqd?+
}

ef_update(){
  if [ ! -f ".env" ]; then
    exit 1
  fi
  set -a
  source .env
  set +a
  if [ -z "$CONNECTION_STRING" ]; then
    exit 1
  fi
  
  yarn install
  npx prisma db push --schema prisma/schema.prisma
  SEARCH_DIR="./Entities"
  dotnet ef dbcontext scaffold "$CONNECTION_STRING" Microsoft.EntityFrameworkCore.SqlServer -c ServiceContext -o "$SEARCH_DIR" -f --schema "$SCHEMA"
  find "$SEARCH_DIR" -type f -name "*.cs" -exec sed -i '' 's/float/bool/g' {} +
  rm -rf prisma/client
  rm -rf logs
  echo "Operations completed successfully."
}

alias ef="entities"

# Function to print directory tree
print_tree() {
  local indent="$2"
  local dir="$1"
  # Print directory name
  echo "${indent}${dir}"
  # Increase indent for child items
  local new_indent="  $indent|-- "
  for item in "$dir"/*; do
    # If the item is a directory, recurse into it
    if [ -d "$item" ]; then
      print_tree "$item" "$new_indent"
    else
      # Print item name
      echo "${new_indent}${item##*/}"
    fi
  done
}
count() {
  # Check if directory exists
  if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/directory [extension]"
    exit 1
  fi
  if [ ! -d "$1" ]; then
    echo "Error: Directory '$1' doesn't exist."
    exit 1
  fi
  # Prepare find command string
  FIND_CMD="find \"$1\" -type f"
  # Check for optional extension
  if [ ! -z "$2" ]; then
    FIND_CMD="$FIND_CMD -name \"*.$2\""
  fi
  # Count files by extension (or by the given extension)
  eval $FIND_CMD | awk -F. 'NF>1 {exts[$NF]++} END {for (ext in exts) print ext, exts[ext]}' | sort
}

toggle_readonly() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
  fi
  filename="$1"
  if [ ! -e "$filename" ]; then
    echo "File not found: $filename"
    exit 1
  fi
  if [ -w "$filename" ]; then
    # File is writeable, make it readonly
    chmod a-w "$filename"
    echo "File '$filename' is now readonly."
  else
    # File is readonly, make it writeable
    chmod a+w "$filename"
    echo "File '$filename' is now writeable."
  fi
}
cls() {
  find . -name .DS_Store -delete
  find . -type d -empty -delete
  # find . -type d -name "app" -exec rm -rf {} +
  find . -type d -name "node_modules" -exec rm -rf {} +
  find . -type d -name "bin" -exec rm -rf {} +
  find . -type d -name "obj" -exec rm -rf {} +
  killall Finder
}
cmd() {
  sh command.sh $1
}
config() {
  sudo code ~/.zshrc
}
rmtree() {
  find . -type d -name $1 -exec rm -rf {} +
}
rmfile() {
  find . -type f -name $1 -exec rm -rf {} +
}
jpg_to_png() {
  # need
  # brew install imagemagick
  # Check if at least one argument is provided
  if [ "$#" -lt 1 ]; then
    echo "Usage: $0 file1.jpg [file2.jpg ...]"
    exit 1
  fi
  # Loop through all the file arguments
  for jpg_file in "$@"; do
    # Check if file exists
    if [ ! -f "$jpg_file" ]; then
      echo "File '$jpg_file' not found!"
      continue
    fi
    # Extract the file name without the extension
    filename=$(basename -- "$jpg_file")
    extension="${filename##*.}"
    filename="${filename%.*}"
    # Check if the file is a JPEG file by its extension
    if [ "$extension" != "jpg" ] && [ "$extension" != "jpeg" ]; then
      echo "Skipping '$jpg_file' as it does not have a .jpg or .jpeg extension."
      continue
    fi
    # Convert to PNG
    png_file="${filename}.png"
    convert "$jpg_file" "$png_file"
    echo "Converted '$jpg_file' to '$png_file'"
  done
}
capitalize_first_letter() {
  echo "$1" | awk '{ $0=toupper(substr($0,1,1)) tolower(substr($0,2)); } 1'
}
# Recursive function to loop through each file and directory
# example : ucfirst .
ucfirst() {
  for entry in "$1"/*; do
    if [ -d "$entry" ]; then
      # If it's a directory, recurse into it
      ucfirst "$entry"
    else
      # If it's a file, capitalize the first letter of the file name
      # Extract filename and extension
      filename=$(basename -- "$entry")
      extension="${filename##*.}"
      filename="${filename%.*}"
      # Capitalize the first letter
      new_filename=$(capitalize_first_letter "$filename")
      # Rename file, but only if the filename actually needs to change
      if [ "$new_filename" != "$filename" ]; then
        mv "$entry" "$(dirname "$entry")/$new_filename.$extension"
      fi
    fi
  done
}
# Function to convert snake_case to CamelCase
snake_to_camel() {
  echo $1 | awk 'BEGIN{FS="_"; OFS=""} {for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))} 1'
}
# Recursive function to loop through each file and directory
makeCamel() {
  for entry in "$1"/*; do
    if [ -d "$entry" ]; then
      # If it's a directory, recurse into it
      makeCamel "$entry"
    else
      # If it's a file, rename it if it's in snake_case
      # Extract filename and extension
      filename=$(basename -- "$entry")
      extension="${filename##*.}"
      filename="${filename%.*}"
      # Skip filenames that don't contain an underscore
      if [[ ! "$filename" =~ "_" ]]; then
        continue
      fi
      # Convert to CamelCase
      new_filename=$(snake_to_camel "$filename")
      # Rename file
      mv "$entry" "$(dirname "$entry")/$new_filename.$extension"
    fi
  done
}
camel() {
  # Loop through each file in the current directory and its subdirectories
  find . -type f -print0 | while IFS= read -r -d '' file; do
    # Extract the file name from the path
    filename=$(basename -- "$file")
    # Extract the first character of the file name
    first_char=$(echo $filename | cut -c1)
    # Convert the first character to lowercase
    lower_first_char=$(echo $first_char | tr 'A-Z' 'a-z')
    # Extract the rest of the file name (from 2nd character to the end)
    rest_of_file=$(echo $filename | cut -c2-)
    # Combine the lowercase first character with the rest of the file name
    new_file="${lower_first_char}${rest_of_file}"
    # Create a new path for the renamed file
    dir=$(dirname -- "$file")
    new_path="${dir}/${new_file}"
    # Rename the file
    if [ "$file" != "$new_path" ]; then
      mv "$file" "$new_path"
    fi
  done
}
to_snake_case() {
  echo $1 | sed -r 's/([a-zA-Z])([A-Z])/\1-\2/g' | tr 'A-Z' 'a-z'
}
snake() {
  # Function to convert CamelCase to snake-case
  # Loop through each file in the current directory and its subdirectories
  find . -type f -print0 | while IFS= read -r -d '' file; do
    # Extract the file name from the path
    filename=$(basename -- "$file")
    # Convert the filename to snake-case
    new_file=$(to_snake_case $filename)
    # Create a new path for the renamed file
    dir=$(dirname -- "$file")
    new_path="${dir}/${new_file}"
    # Rename the file
    if [ "$file" != "$new_path" ]; then
      mv "$file" "$new_path"
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
  # rm *.png
  # rm *.mov
  rm Screenshot*
  rm Screen\ Recording*
  reorder
  cd "$current_dir"
}
cdock(){
  docker stop $(docker ps -q -a)
  yes | docker system prune
}

reload() {
  source ~/.zshrc
  sudo dscacheutil -flushcache
  sudo killall -HUP mDNSResponder
}
alias ..="cd .."
alias hosts="code /etc/hosts"
alias c='clear'
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

alias up='docker-compose up'

alias vhost="code /etc/hosts"

# sp stand for save point
sp() {
  iteration=0

  git add .
  git commit -m "temp : save point"

  echo "All changes have been pushed."
  git fetch
}
test() {
  # [ $# -eq 0 ] && { ./test.sh; exit 1; }
  # ./test.sh $1
  sh test.sh
}
alias t="test"
save() {
  if [ $# -eq 0 ]; then
  echo "Please provide a string as an argument."
  exit 1
fi
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
start() {
  update="start.sh"
  if [ ! -f "$update" ]; then
    touch "$update"
  else
    echo ""
  fi
  sh start.sh
}
setup(){ update="setup.sh"; [ ! -f "$update" ] && touch "$update" || echo ""; sh setup.sh; }
update(){ update="update.sh"; [ ! -f "$update" ] && touch "$update" || echo ""; sh update.sh; }

alias u="update"
b() {
  dotnet build
}
p() {
  if [ -d "./bin/Publish" ]; then
    rm -r ./bin/Publish
  fi
  dotnet clean
  export ENVIRONMENT="prod"
  dotnet publish -c Release --framework net8.0 --runtime linux-x64 --self-contained false -o ./bin/Publish -p:Environment="$ENVIRONMENT"
}

run(){
  rm -r bin
  rm -r obj
  dotnet clean
  dotnet restore
  dotnet build
  # Use the first argument as the environment variable, or default to 'Development'
  ASPNETCORE_ENVIRONMENT=${1:-Development}

  # Set the environment variable
  export ASPNETCORE_ENVIRONMENT

  # Run the application with dotnet watch
  dotnet watch run
  dotnet watch run --framework net8.0
}

alias r='dotnet watch run --framework net8.0'

reorder() {
  find . -name .DS_Store -delete
  find . -type d -empty -delete 2>/dev/null
  killall Finder
}
# find ./ -name "._*" -type f -delete

#
plugins=(git)
source $ZSH/oh-my-zsh.sh
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# pnpm
export PNPM_HOME="~/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end


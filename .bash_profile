# Load ~/.bash_prompt, ~/.exports, ~/.aliases, ~/.functions and ~/.extra
# ~/.extra can be used for settings you don’t want to commit
for file in bashrc bash_prompt exports aliases functions extra; do
  file="$HOME/.$file"
  [ -e "$file" ] && source "$file"
done

# Larger bash history (default is 500)
export HISTFILESIZE=10000
export HISTSIZE=10000

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

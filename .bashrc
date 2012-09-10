
#for n in .bashrc-search .bashrc-colors; do
#    if [[ -f ~/$n ]]; then
#        . ~/$n
#    fi
#done

# Virtualenv wrappers.  Make sure this directory has been created already.
export WORKON_HOME=~/.virtualenvs
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
# Note, the path to this shell script can vary depending on platform
source /usr/local/bin/virtualenvwrapper.sh
#source /opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh
# Pip
export PIP_RESPECT_VIRTUALENV=true
#export PIP_REQUIRE_VIRTUALENV=true

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

source ~/.local/bin/bashmarks.sh

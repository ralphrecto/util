################################################################################
# Bash settings                                                                #
################################################################################

# Use vi keyboard shortcuts in bash
# (for example, Escape then j will move the cursor one left in Terminal)
set -o vi
export CLICOLOR=1

# bash-completion - enables smart bash completion
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

# Set the prompt
PS1="☮ ♥ λ \\w >: "

# use 256 colors
export TERM="screen-256color-bce"

# setup solarized dark 256-color lscolors
eval `gdircolors ~/.dir_colors/dircolors.256dark.txt`

################################################################################
# Development stuff                                                            #
################################################################################

# General ######################################################################
# MacPorts Installer addition on 2014-10-06_at_22:58:41: adding an appropriate PATH variable for use with MacPorts.
export PATH="/usr/bin/z3/bin:/opt/local/bin:/opt/local/sbin:$PATH"

# Set up vi command line editing
set -o vi

# Vim ##########################################################################
export VIMRUNTIME="/Users/ralphrecto/.vim"
alias vim='mvim -v'
# Use vim anytime an editor is needed by bash
export EDITOR="vim"

# OCaml ########################################################################
# OPAM configuration
. /Users/ralphrecto/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Java #########################################################################
export JAVA_HOME="`/usr/libexec/java_home`"

# Rust #########################################################################
source ~/.cargo/env

# JS ###########################################################################
export PATH="/usr/local/lib/node_modules:$PATH"

# Handy aliases ################################################################
alias l="ls"
alias q="clear"

# Terminal navigation ##########################################################

# set up z directory jumper
. /usr/bin/z/z.sh

# j: jump back various levels of nesting from the current directory to an ancestor.
# invoking with no arguments shows options for jumping.
# invoking with "j $n" jumps n levels back, e.g.
# if cwd == /foo/bar/baz,
# > j 1
# will cd to /foo/bar and
# > j 2
# will cd to /foo
j() {
  dirs[0]=`pwd`

  if [[ $# -eq 0 ]] ; then
    for i in $(seq 1 9) ; do
      export prev_index=`expr $i - 1`
      dirs[$i]=`dirname ${dirs[$prev_index]}`
      echo "[$i] ${dirs[$i]}"
    done
  fi

  if [[ $# -ne 0 ]] ; then
    cd ${dirs[$1]}
  fi
}

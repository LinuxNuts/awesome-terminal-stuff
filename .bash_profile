#############################################################
# Shorthand aliases											#
#############################################################
alias ..='cd ..'
alias ls='ls -G'
alias sourceit='source ~/.bash_profile'
alias fn='find . -name'

#############################################################
# Shortcuts													#
#############################################################

alias d='cd ~/Dropbox'
alias s='cd ~/src'
alias e='subl'

#############################################################
# git aliases												#
#############################################################
alias gc='git checkout'
alias gm='git commit -m'
alias gb='git branch'
alias gd='git diff --color'
alias gs='git status'
alias ga='git add -A'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'
alias gsl='git stash list'

git_stash_apply () {
	git stash apply stash@{$1}
}

alias gsa=git_stash_apply

git_commit_everything () {
	ga
	gs
	NEXT_COMMIT_MESSAGE=`curl -s http://whatthecommit.com | perl -p0e '($_)=m{<p>(.+?)</p>}s'`
	echo $NEXT_COMMIT_MESSAGE
	gm "$NEXT_COMMIT_MESSAGE"
}

alias gce=git_commit_everything

#############################################################
# Rails aliases												#
#############################################################

alias bi='bundle install'

#############################################################
# Shortcut for grepping stuff								#
#############################################################
find_in_files () {
	if [ $# -ne 1 ]
	then
		echo "Whoa buddy, you need to enter a term to search for."
		echo "Example:"
		echo "	ff 'dave'"
	else
		grep -lr -i $1 .
	fi
}

alias ff=find_in_files

#############################################################
# Xcode / Cocoapods											#
#############################################################
alias repod='rm -rf Pods Podfile.lock ; pod install'
close_and_repod () {
	ruby ~/src/awesome-terminal-stuff/close_xcode_window.rb
	repod
	open *.xcworkspace
}

alias crepod=close_and_repod

nuke_derived_data () {
	rm -rf ~/Library/Developer/Xcode/DerivedData/
}

alias oxw='open *.xcworkspace'

#############################################################
# Git info													#
#############################################################
function parse_git_branch {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo "("${ref#refs/heads/}")"
}

#############################################################
# Bash colors												#
#############################################################

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NORMAL="\[\e[0m\]"

PS1="$RED\$(date +%H:%M) \W$YELLOW \$(parse_git_branch) $NORMAL"

#############################################################
# Path														#
#############################################################
PATH="~/bin:${PATH}"

#############################################################
# Saucey intro												#
#############################################################

echo "****************************"
echo "* HELLO DAVE               *"
echo "*                          *"
echo "* WELCOME TO YOUR COMPUTER *"
echo "*                          *"
echo "* YOU LOOK GREAT TODAY BTW *"
echo "****************************"

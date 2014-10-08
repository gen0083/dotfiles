#! /bin/bash

# this script make symboliclink to user's home directory

# .files
# if you create a new dotfile, add the dotfile name to DOTFILES_LIST
# e.g. create .vimrc then add "vimrc" to DOTFILES_LIST
DOTFILES_LIST="vimrc gvimrc bashrc bash_profile gitconfig\
	gitignore_global"
for DOTFILE in $DOTFILES_LIST
do
	if [ -f ~/.$DOTFILE ]; then
		if [ ! -f ~/.$DOTFILE.old ]; then
			mv ~/.$DOTFILE ~/.$DOTFILE.old
		fi
	fi
	ln -fs ~/dotfiles/_$DOTFILE ~/.$DOTFILE
done
# .directory
if [ -d ~/.vim ]; then
	if [ ! -d ~/.vim.old ]; then
		mv ~/.vim ~/.vim.old
	fi
fi
ln -fs ~/dotfiles/vimfiles ~/.vim

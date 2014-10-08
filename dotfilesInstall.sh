#! /bin/bash

# this script make symboliclink to user's home directory

# .files
# if you create a new dotfile, add the dotfile name to DOTFILES_LIST
# e.g. create .vimrc then add "vimrc" to DOTFILES_LIST
DOTFILES_DIRECTORY="dotfiles"
DOTFILES_LIST="vimrc gvimrc bashrc bash_profile gitconfig\
	gitignore_global"
for DOTFILE in $DOTFILES_LIST
do
	if [ -f ~/.$DOTFILE ]; then
		if [ ! -L ~/.$DOTFILE ]; then
			# カスタマイズ済みのドットファイルを退避
			mv ~/.$DOTFILE ~/.$DOTFILE.old
		else
			# シンボリックリンクを削除
			rm ~/.$DOTFILE
		fi
	fi
	ln -s ~/$DOTFILES_DIRECTORY/_$DOTFILE ~/.$DOTFILE
done
# .directory
if [ -d ~/.vim ]; then
	if [ ! -L ~/.vim ]; then
		# カスタマイズ済みの.vimを退避する
		mv ~/.vim ~/.vim.old
	else
		# ディレクトリのシンボリックリンクを削除する
		rm ~/.vim
	fi

fi
ln -s ~/$DOTFILES_DIRECTORY/vimfiles/ ~/.vim

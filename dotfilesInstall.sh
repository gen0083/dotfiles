#! /bin/bash

# this script make symboliclink to user's home directory

# .files
# if you create a new dotfile, add the dotfile name to DOTFILES_LIST
# e.g. create .vimrc then add "vimrc" to DOTFILES_LIST
DOTFILES_DIRECTORY="dotfiles"
DOTFILES_LIST="vimrc gvimrc bashrc bash_profile gitconfig\
	gitignore_global ideavimrc"
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
ln -s ~/$DOTFILES_DIRECTORY/vimfiles ~/.vim

# TODO zsh対応
#ln -s ~/.bash_profile ~/.zprofile
#ln -s ~/.bashrc ~/.zshrc

# install Dein.vim https://github.com/Shougo/dein.vim
mkdir -p ~/.cache/dein
cd ~/.cache/dein

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein

# install git-completion
# TODO: zsh対応
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
chmod a+x ~/.git-completion.bash
chmod a+x ~/.git-completion.bash
# wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh -O ~/.git-completion.zsh
# chmod a+x ~/.git-completion.zsh

# install git-prompt
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
chmod a+x ~/.git-prompt.sh


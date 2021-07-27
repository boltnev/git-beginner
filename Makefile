CURRENT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

path:
	echo "export PATH=$$PATH:$(CURRENT_DIR)/bin/" >> ~/.bashrc


git:
	cp .gitconfig ~/.gitconfig


vim:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	cp .vimrc ~/.vimrc

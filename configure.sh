#!/bin/bash

repos=(
	#color scheme
	git@github.com:ayu-theme/ayu-vim.git
	#filesystem navigation
	#git@github.com:scrooloose/nerdtree.git
	git@github.com:tpope/vim-vinegar.git
	#improved incremental search
	git@github.com:haya14busa/incsearch.vim.git
	#surround because yay surround
	git@github.com:tpope/vim-surround.git
	#matchit for %-ing xml tags
	git@github.com:tmhedberg/matchit.git
	#indent lines for readability
	git@github.com:Yggdroot/indentLine.git
	#snippets for html w/ dependencies
	git@github.com:honza/vim-snippets.git
	git@github.com:garbas/vim-snipmate.git
	git@github.com:tomtom/tlib_vim.git
	git@github.com:MarcWeber/vim-addon-mw-utils.git
)

if [ "$1" == "-rc" ]; then
	printf "updating .bashrc\n"
	cp .bashrc /home/$(whoami)/.bashrc
	. /home/$(whoami)/.bashrc
	printf "updating .vimrc\n"
	cp .vimrc /home/$(whoami)/.vimrc
fi

if [ -d "/home/$(whoami)/.vim" ]; then
	if [ -d "/home/$(whoami)/.vim/autoload" ]; then
		if [ ! -f "/home/$(whoami)/.vim/autoload/pathogen.vim" ]; then
			printf "Installing Pathogen Plugin Manager\n"
			curl -LSso /home/$(whoami)/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
		fi
	else
		mkdir /home/$(whoami)/.vim/autoload
		printf "Installing Pathogen Plugin Manager\n"
		curl -LSso /home/$(whoami)/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	fi
	if [ ! -d "/home/$(whoami)/.vim/bundle" ]; then
		mkdir /home/$(whoami)/.vim/bundle
	fi
else
	mkdir /home/$(whoami)/.vim
	mkdir /home/$(whoami)/.vim/autoload
	mkdir /home/$(whoami)/.vim/bundle
	printf "Installing Pathogen Plugin Manager\n"
	curl -LSso /home/$(whoami)/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi



for repo in "${repos[@]}"; do
	filename="$(echo "$repo" | cut -d'/' -f 2 | rev | cut -d'.' -f 1 --complement | rev)"
	filepath="/home/$(whoami)/.vim/bundle/${filename}"
	printf "\n${filepath}\n"
	if [ -d "$filepath" ]; then
		printf "repo found\n"
		cd ${filepath}
		git pull 
	else
		printf "repo not found\n"
		git clone ${repo} ${filepath}
	fi
done


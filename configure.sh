#!/bin/bash

repos=(
	#color scheme
	git@github.com:ayu-theme/ayu-vim.git
	#filesystem navigation
	git@github.com:scrooloose/nerdtree.git
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
	cp .bashrc /home/$(whoami)/.bashrc
	cp .vimrc /home/$(whoami)/.vimrc
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


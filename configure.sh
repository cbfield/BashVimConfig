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

for repo in "${repos[@]}"; do
	echo "$repo"
done

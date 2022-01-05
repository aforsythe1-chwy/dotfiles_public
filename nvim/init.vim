call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'dracula/vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " Use release branch (recommend)
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'antoinemadec/coc-fzf'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'pangloss/vim-javascript'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-commentary'
  "File Browser:
  Plug 'scrooloose/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'mkitt/tabline.vim'
  Plug 'ryanoasis/vim-devicons'
  "Color:
  Plug 'morhetz/gruvbox'
  "Golang:
  Plug 'fatih/vim-go'
  "Autocomplete:
  Plug 'ncm2/ncm2'
  Plug 'ncm2/ncm2-go'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
  "Snippets:
  Plug 'ncm2/ncm2-ultisnips'
  Plug 'SirVer/ultisnips'
  "Git:
  Plug 'tpope/vim-fugitive'
call plug#end()


filetype plugin on
"Load in 'modules'
source $HOME/.config/nvim/coc_configuration.vim

"COLORS & SYNTAX:
" ------------------------------------------------------------------
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula
set foldmethod=syntax
"NUMBERING:
" ------------------------------------------------------------------
" turn hybrid line numbers on
set number relativenumber
set nu rnu

" GO Specific Settings:
" ------------------------------------------------------------------
let g:go_fmt_command = "goimports"
" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

"SNIPPETS:
" ------------------------------------------------------------------
"Change default expand since TAB is used to cycle options
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"FILE SEARCH:
" ------------------------------------------------------------------
"allows FZF to open by pressing CTRL-F
map <C-p> :FZF<CR>

"FILE BROWSER:
" ------------------------------------------------------------------
"allows NERDTree to open/close by typing 'n' then 't'
map <Leader> nt :NERDTreeTabsToggle<CR>
"Start NERDtree when dir is selected (e.g. "vim .") and start NERDTreeTabs
let g:nerdtree_tabs_open_on_console_startup=2
"Add a close button in the upper right for tabs
let g:tablineclosebutton=1
"Automatically find and select currently opened file in NERDTree
let g:nerdtree_tabs_autofind=1
"Add folder icon to directories
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
"Hide expand/collapse arrows
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
highlight! link NERDTreeFlags NERDTreeDir

"SOURCING:
" ------------------------------------------------------------------
"Automatically reloads neovim configuration file on write (w)
autocmd! bufwritepost init.vim source %

"CUSTOM FUNCTIONS:

" Going to come back to this sourcing problem later. May just have to write is
" as a one liner mapped to something
" delfunction "*SourceVim"
" function! SourceVim()
" 	echo "Sourcing vim right now and maybe later!! -> " . $MYVIMRC
" 	source $MYVIMRC
" 	
" endfunction



"NAVIGATION:
"

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

"smart indent when entering insert mode with i on empty lines

"MOUSE:
" ------------------------------------------------------------------
"Allow using mouse helpful for switching/resizing windows
set mouse+=a
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif

"TEXT SEARCH:
" ------------------------------------------------------------------
"Makes Search Case Insensitive
set ignorecase

"SWAP:
" ------------------------------------------------------------------
set dir=~/.local/share/nvim/swap/

"GIT (FUGITIVE):
" ------------------------------------------------------------------
map fgb :Gblame<CR>
map fgs :Gstatus<CR>
map fgl :Glog<CR>
map fgd :Gdiff<CR>
map fgc :Gcommit<CR>
map fga :Git add %:p<CR>

"SYNTAX HIGHLIGHTING:
" ------------------------------------------------------------------
syntax on

"HIGHLIGHTING:
" ------------------------------------------------------------------

"<Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
" Highlight the current line the cursor is on
set cursorline

"CUSTOM SHORTCUTS:
" ------------------------------------------------------------------
let mapleader=","
" set timeout timeoutlen=3000
" Commentary configuration
" noremap <leader>/ :Commentary<cr>

let g:go_rename_command = 'gopls'

"Open file at same line last closed
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g'\"" | endif
endif

nnoremap <silent> <Leader>f :Rg<CR>
"
map svs :vsplit<CR>

" The following is required so that the 'k' and 'j' keys don't
" mess things up when in insert mode
:autocmd InsertEnter * set timeoutlen=50
:autocmd InsertLeave * set timeoutlen=1000

" Can be typed even faster than jj, and if you are already in
" normal mode, you (usually) don't accidentally move:
:imap jk <Esc>
:imap kj <Esc>

nnoremap <silent> <Leader><Leader> :call SourceVim()<cr>


"WORKING WITH BUFFERS:
"Some useful settings for working with copying/pasting/deleting

" Use 'Y' to put the current line in the clipboard without including the
" newline char
nnoremap Y y$

"
"" Everything below this is old stuff that should be
" cleaned up soon
" ------------------------------------------------------------------
"

" Editor spacing config
nnoremap <silent> <C-g> :NERDTreeToggle<CR>



nnoremap <C-p> :FZF<CR>
nnoremap <C-b> :Buffers<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}


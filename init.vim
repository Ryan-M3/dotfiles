set wildmenu
set wildmode=longest:full,full
set wildignore+=*.pyc,*~,*.o
set smartcase
set ignorecase
set incsearch
set path+=**
syntax on
filetype plugin on
filetype indent on
set ai
set si
" set autoread

call plug#begin('~/.local/share/nvim/plugged')

" Navigate files
Plug 'scrooloose/nerdtree'

" Autocomplete
"Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Syntax features
Plug 'vim-syntastic/syntastic'

" Highlight all words matching what's under the cursor.
Plug 'osyo-manga/vim-brightest'

" Integrate Vim with Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
"Plug 'jpalardy/vim-slime'
Plug 'jgdavey/tslime.vim'
let g:tslime_always_current_session = 1
let g:tslime_always_current_window  = 1
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

" Keybinds for dealing with "", '', (), {}, etc.
Plug 'tpope/vim-surround'

" Colorschemes
Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'vim-scripts/Wombat'

" Center vim
Plug 'junegunn/goyo.vim'

" Ctags integration.
Plug 'kien/ctrlp.vim'
nnoremap <silent> <Leader>B :CtrlP<CR>

Plug 'majutsushi/tagbar'  " adds tag window
nnoremap <silent> <Leader>b :TagbarToggle<CR>

Plug 'xolox/vim-easytags' " automatic tag generation
Plug 'xolox/vim-misc'

" DevOps Tools
Plug 'pearofducks/ansible-vim'   " YAML
Plug 'plasticboy/vim-markdown'   " Markdown syntax
Plug 'junegunn/goyo.vim'         " Markdown prettify
Plug 'hashivim/vim-terraform'    " Terraform
Plug 'elzr/vim-json'		     " JSON
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'martinda/Jenkinsfile-vim-syntax' " Jenkins Syntax

" Auto-updating markdown on port 8090
"Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 6969
"let g:instant_markdown_python = 1

" Git
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'

" Python folding support.
"Plug 'tmhedberg/SimpylFold'
"Plug 'klen/python-mode'

" Snipmates
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
nnoremap <leader>sn :split ~/.local/share/nvim/plugged/neosnippet-snippets/neosnippets/<CR>
nnoremap <leader>SN :vsplit ~/.local/share/nvim/plugged/neosnippet-snippets/neosnippets/<CR>
imap <C-Space> <Plug>(neosnippet_expand_or_jump)
smap <C-Space> <Plug>(neosnippet_expand_or_jump)
xmap <C-Space> <Plug>(neosnippet_expand_target)

" Orgmode
"Plug 'jceb/vim-orgmode'

" Haskell
Plug 'neovimhaskell/haskell-vim'
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_indent_if = 0

"Plug 'alx741/vim-hindent' " this plugin causes saving to move cursor!
Plug 'bitc/vim-hdevtools'
Plug 'dense-analysis/ale'
Plug 'jaspervdj/stylish-haskell'
Plug 'calebsmith/vim-lambdify'

" Rust
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1

call plug#end()

" Basic display settings
set termguicolors
syntax on
set relativenumber
set number
color molokai
" My terminal has a transparent black background, and I
" don't want vim to draw over that.
hi Normal guibg=NONE ctermbg=None

" Create a column at 80 characters.
set colorcolumn=80
highlight ColorColumn ctermbg=Black
highlight ColorColumn guibg=#081818

" More natural split direction.
set splitbelow
set splitright

" Go
augroup GoFiles
	au!
	autocmd BufReadPost,BufNewFile *.go set tabstop=4
	autocmd BufReadPost,BufNewFile *.go set noexpandtab
	autocmd BufReadPost,BufNewFile *.go set shiftwidth=4
	autocmd BufReadPost,BufNewFile *.go set softtabstop=4
	autocmd BufReadPost,BufNewFile *.go set foldmethod=syntax
augroup END

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set foldmethod=syntax

" set formatting for comments
set formatprg=par\ -w60f
"autocmd BufEnter *.hs set formatprg=pointfree
autocmd BufNewFile,BufRead *.x set syn=haskell
autocmd BufNewFile,BufRead *.y set syn=haskell

au BufNewFile,BufRead *.py let g:python_highlight_all = 1

" Remappings
nnoremap Y y$
inoremap <S-CR> <esc>j

" move line down one
nnoremap - ddp
nnoremap _ ddkP

" Quicker switching between splits.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Open specific files on the computer.
nnoremap <leader>rc :split  ~/.config/nvim/init.vim<cr>
nnoremap <leader>RC :vsplit ~/.config/nvim/init.vim<cr>

" Faster file nav opening.
nnoremap <leader>N :NERDTree<cr>

" Ctrl+A interferes with tmux.
nnoremap <Leader><C-x> <C-a>

" Clear recent search.
nnoremap <Leader><bs> /ASDFWTFBBQ<cr>

" Autocorrect
iab retrun return
iab improt import
iab gloabl global
iab import\ import impot
iab ednl endl

syntax match mul "*" conceal cchar=×

"augroup BufNewFile,BufRead *.plx 
"    au!
"    iab -> →
"    iab != ≠
"    iab // ÷
"    iab \\ √ 
"    iab <= ≤ 
"    iab >= ≥ 
"    iab ~~ !
"	iab TRUE ⊤
"    iab FALSE ⊥
"	iab SUM ∑
"	iab PRODUCT ∏
"	iab AND ⋀
"	iab OR ⋁
"	iab UNION ⋃
"	iab INTERX ⋂
"	iab IN ∈
"	iab \N ℕ
"	iab \Z ℤ
"    iab \Q ℚ
"    iab \R ℝ
"	iab \~ ¬
"augroup END

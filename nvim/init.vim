if &compatible
  set nocompatible
endif
" dein.vimのディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  let s:toml = '~/.config/nvim/dein.toml'
  let s:lazy_toml = '~/.config/nvim/dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable
colorscheme molokai

set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set autochdir

set number
set smartindent
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest

nnoremap j gj
nnoremap k gk

set expandtab
set tabstop=4
set shiftwidth=4
set autoindent

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
:set guicursor=
set clipboard+=unnamedplus

set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
set tags=.tags;~
".tags作成コマンド
"ctags -R -f .tags
autocmd FileType c,cpp nested :TagbarOpen

inoremap <silent> jj <ESC>

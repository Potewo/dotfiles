set number
syntax enable
set list
set listchars=tab:>.,trail:･,extends:>,precedes:<,nbsp:%
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
set autoindent
set shiftwidth=2
set expandtab
set clipboard=unnamed
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:deoplete#enable_at_startup = 1
let g:ale_fix_on_save = 1

set nobackup
" バックアップファイルを作らない
set noswapfile
" スワップファイルを作らない
set autoread
" 編集中のファイルが変更されたら自動で読み直す
set hidden
" バッファが編集中でもその他のファイルを開けるように
set showcmd
" 入力中のコマンドをステータスに表示する
set number
" 行番号を表示
set showmatch
" 括弧入力時の対応する括弧を表示
set laststatus=2
" ステータスラインを常に表示
set tabstop=2
" 行頭以外のTab文字の表示幅
set ignorecase
" 検索文字の大文字小文字を区別しない
set wrapscan
" 検索文字をハイライト表示
set guioptions+=a
" ヤンクでクリップボードにコピー
set hlsearch
" 検索結果をハイライト

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
" set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('davidhalter/jedi')
  call dein#add('vim-airline/vim-airline')
  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-fugitive')
  call dein#add('thinca/vim-quickrun')
  call dein#add('hhatto/autopep8')
  call dein#add('Shougo/denite.nvim')
  call dein#add('kballard/vim-swift')
  call dein#add('keith/swift.vim')
  call dein#add('vim/killersheep')
  call dein#add('dense-analysis/ale')
  call dein#add('alvan/vim-closetag')
  call dein#add('kana/vim-operator-user')
  call dein#add('kana/vim-operator-replace')
  call dein#add('tpope/vim-commentary')
  call dein#add('mattn/emmet-vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('jelera/vim-javascript-syntax');
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

"シェルをzshにする
set sh=zsh

"キーマッピング
inoremap <C-t> terminal
" 保存時のみ実行する
let g:ale_lint_on_text_changed = 0
" 表示に関する設定
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '⛔'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
map R <Plug>(operator-replace)

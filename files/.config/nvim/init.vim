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

set nobackup
" バックアップファイルを作らない
set nowritebackup
" ファイル上書き時にバックアップを作らない

" set noswapfile
" スワップファイルを作らない
set updatetime=300


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
set shortmess+=c
" Don't pass messages to |ins-completion-menu|.(coc.nvim)

set mouse=a
" マウスの有効化

let mapleader = "\<Space>"

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
  call dein#add('vim-airline/vim-airline')
  call dein#add('scrooloose/nerdtree')

  "Gitの操作
  call dein#add('tpope/vim-fugitive')

  call dein#add('thinca/vim-quickrun')
  call dein#add('hhatto/autopep8')
  call dein#add('Shougo/denite.nvim')
  call dein#add('vim/killersheep')
  call dein#add('alvan/vim-closetag')

  " ヤンクした中身を置き換えるオペレータ
  call dein#add('kana/vim-operator-user')
  call dein#add('kana/vim-operator-replace')

  " gcc/gcでコメントアウト
  call dein#add('tpope/vim-commentary')

  " HTML/CSSのスニペットの展開
  call dein#add('mattn/emmet-vim')

  " Gitの差分表示
  call dein#add('airblade/vim-gitgutter')


  " coc.nvim language server protocol
  call dein#add('neoclide/coc.nvim', { 'merged': 0 })

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
" Rをオペレータにしてヤンクした中身で置き換える
map R <Plug>(operator-replace)



"coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

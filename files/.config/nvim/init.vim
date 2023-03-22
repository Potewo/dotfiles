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

set noswapfile
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
set matchtime=1
" 対応したカッコの待ち時間を0.5から0.1に変更
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

" 検索後、カーソルを中央に持ってくる
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

let mapleader = "\<Space>"

" 106

nnoremap + <C-a>
" インクリメント
nnoremap - <C-x>
" デクリメント
nnoremap Y y$
" 末尾までヤンク

"install dein-----------------------------
let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif
"-----------------------------------------

"dein Scripts-----------------------------
" https://github.com/Shougo/dein.vim#basic-installation
" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set dein base path (required)
let s:dein_base = '~/.cache/dein/'

" Set dein source path (required)
let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set dein runtime path (required)
execute 'set runtimepath+=' .. s:dein_src

" Call dein initialization (required)
call dein#begin(s:dein_base)

call dein#add(s:dein_src)

call dein#add('vim-airline/vim-airline')

"Gitの操作
call dein#add('tpope/vim-fugitive')

" call dein#add('alvan/vim-closetag')

" ヤンクした中身を置き換えるオペレータ
call dein#add('kana/vim-operator-user')
call dein#add('kana/vim-operator-replace')


" HTML/CSSのスニペットの展開
call dein#add('mattn/emmet-vim')

" Gitの差分表示
call dein#add('airblade/vim-gitgutter')


" coc.nvim language server protocol
call dein#add('neoclide/coc.nvim', { 'rev': 'release', 'merged': 0 })

" " advanced syntax highlight
" call dein#add('sheerun/vim-polyglot')
" syntax highlight
call dein#add('neoclide/coc-highlight')

" snipet
call dein#add('SirVer/ultisnips')

" syntax highlight for react
call dein#add('pangloss/vim-javascript')

" svelte highlighting
call dein#add('evanleck/vim-svelte')

" rust
call dein#add('rust-lang/rust.vim')


" Finish dein initialization (required)
call dein#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Uncomment if you want to install not-installed plugins on startup.
"if dein#check_install()
" call dein#install()
"endif
"end of dein script -----------------------------------

"シェルをzshにする
set sh=zsh

"キーマッピング
inoremap <C-t> terminal
" Rをオペレータにしてヤンクした中身で置き換える
map R <Plug>(operator-replace)



"coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>qf <Plug>(coc-fix-current)
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
nmap <leader>fmt <Plug>(coc-format)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" uninstall dein plugins
call map(dein#check_clean(), "delete(v:val, 'rf')")
"
" then `:call dein#recache_runtimepath()

" Ultisnips settings
let g:UltiSnipsExpandTrigger="<Down>"
imap <C-l> <Plug>(coc-snippets-expand)

" CocList settings
nnoremap <silent><nowait> <leader>lf :<C-u>CocList files<cr>
nnoremap <silent><nowait> <leader>ld :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <leader>lo :<C-u>CocList outline<cr>

let g:coc_global_extensions = [
      \'coc-tsserver',
      \'coc-rust-analyzer',
      \'coc-json',
      \'coc-go',
      \'coc-clangd',
      \'coc-snippets',
      \'coc-lists',
      \'coc-yaml',
      \'coc-vetur',
      \'coc-stylelint',
      \'coc-sourcekit',
      \'coc-pyright',
      \'coc-go',
      \'coc-css',
      \'coc-cmake',
      \]
" Typescript
" Rust
" json
" Go
" Clang C++
" Ultisnips
" buffer,files,filetypes etc.
" Discord (Now Playing)
" yaml
" vue
" css lint
" Swift
" Python
" Go
" CSS
" CMake

inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
nnoremap <C-j><C-j> :<C-u>nohlsearch<CR><Esc>

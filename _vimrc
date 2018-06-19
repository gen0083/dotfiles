if &compatible
  set nocompatible
endif

let s:dein_directory=$HOME . '/.cache/dein/repos/github.com/Shougo/dein.vim'
let s:plugin_directory=$HOME . '/.cache/dein'
exe 'set runtimepath+=' . expand(s:dein_directory)

" プラグインのセットアップ（dein.vim）
if dein#load_state(s:plugin_directory)
  call dein#begin(s:plugin_directory)

  call dein#add(s:dein_directory)
  " My Bundles here:
  " ファイルオープンを便利に
  call dein#add('Shougo/unite.vim')
  " Unite.vimで最近使ったファイルを表示できるようにする
  call dein#add('Shougo/neomru.vim')
  " ファイルをツリー表示
  call dein#add('scrooloose/nerdtree')
  " 複数行コメントを手軽に実行
  call dein#add('tomtom/tcomment_vim')
  " インデントに色をつけて見やすくする
  call dein#add('nathanaelkane/vim-indent-guides')
  " Gitを便利に使う
  call dein#add('tpope/vim-fugitive')
  " 行末の半角スペースを可視化
  call dein#add('bronson/vim-trailing-whitespace')
  " surround.vim
  call dein#add('tpope/vim-surround')
  " emmet-vim
  call dein#add('mattn/emmet-vim')
  " Syntax-plugins
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('cakebaker/scss-syntax.vim')
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('chase/vim-ansible-yaml')

  " for ruby plugins
  call dein#add('ngmy/vim-rubocop')
  " for rails useful plugin
  call dein#add('tpope/vim-rails')
  " add automatically close block e.g. def with end etc.
  call dein#add('tpope/vim-endwise')
  " apply color for files included ANSI color information
  call dein#add('vim-scripts/AnsiEsc.vim')

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

""""""""""""""""""""
" 各種オプション設定
""""""""""""""""""""
" 色設定
colorscheme desert
set background=dark
syntax on
" 行番号表示
set number
set ruler
" バックアップ・スワップファイルを作成しない
set nobackup
set noswapfile
set undodir=~/tmp/vim
" タイトルバーにファイルのパス情報を表示
set title
" 作業ディレクトリを現在表示中のファイルの場所に設定する
set autochdir
" コマンドラインモードでタブキーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンド表示
set showcmd
" コマンドラインで使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示
set laststatus=2
" ステータス行に表示させる情報の指定
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ステータス行に現在のGitブランチを表示する
set statusline+=%{fugitive#statusline()}
" 検索設定
set hlsearch
set incsearch
" 対応するカッコやプレースを表示する
set showmatch
" 不可視文字を表示する
set list
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" 改行時にインデントを継承する
set autoindent
set smartindent
" カーソルを行頭・行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" Xキーで文字削除する際にレジスタに入れない
nnoremap x "_x
vnoremap x "_x
nnoremap c "_c
vnoremap c "_c
" 使わないキーマップを無効化
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
" move tabs
nnoremap <Left> <C-w>h
nnoremap <Right> <C-w>l
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j
nnoremap <S-q><S-q> <C-w>q
" カーソル移動
noremap <S-h> ^
noremap <S-l> $

" vim起動時に自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unite.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""

" filetypeの自動検出(最後の方に書いた方がいいらしい)
filetype on

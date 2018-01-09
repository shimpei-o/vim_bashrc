" 新しい行のインデントを現在行と同じにする
set autoindent
" バックアップファイルのディレクトリを指定する
set backupdir=$HOME/vimbackup
" vi互換をオフする
set nocompatible
" スワップファイル用のディレクトリを指定する
set directory=$HOME/vimbackup
" 変更中のファイルでも、保存しないで他のファイルを表示する
set hidden
" インクリメンタルサーチを行う
set incsearch
" 行番号を表示する
set number
" 閉括弧が入力された時、対応する括弧を強調する
set showmatch
" 新しい行を作った時に高度な自動インデントを行う
"set smarttab
" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" 不可視文字を表示する
set list
set listchars=tab:»-,trail:-,nbsp:%,eol:↲
set paste

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>
nnoremap <Space>v :<C-u>VimShell<CR>

"タブを表示するときの幅
set tabstop=4
"タブを挿入するときの幅
set shiftwidth=4
"タブをタブとして扱う(スペースに展開しない)
set noexpandtab
"新規タブを下で開く
set splitright

set vb t_vb=

:set noundofile
autocmd FileType php :set dictionary=~/.vim/dict/php.dict
augroup MyXML
	autocmd!
	autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
	autocmd Filetype php inoremap <buffer> </ </<C-x><C-o>
	autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
	autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END

"----------
" カラースキーム
"----------
syntax enable
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
let g:rehash256 = 1
set background=dark

"行番号の色や現在行の設定
set cursorline
highlight clear CursorLine

autocmd VimEnter *：VimFiler -buffer-name = explorer -split -toggle -no-quit）

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
call plug#end()

let g:go_fmt_command = "goimports"


if &compatible
	  set nocompatible
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/shimpei/.vim/dein')
  call dein#begin('/Users/shimpei/.vim/dein')

  call dein#add('/Users/shimpei/.vim/dein/repos/github.com/Shougo/dein.vim')

    call dein#add('Shougo/neosnippet.vim')
	call dein#add('Shougo/neosnippet-snippets')
	call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
	  call dein#end()
	    call dein#save_state()
	endif

	filetype plugin indent on
	syntax enable

	" If you want to install not installed plugins on startup.
	if dein#check_install()
	  call dein#install()
	endif

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
	set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#snippets_directory='~/.vim/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets/'

colorscheme myTheme
let mapleader=","
set encoding=utf-8 "编码设置
set fileformat=unix
"set cursorline
"set cursorcolumn
set hlsearch
set t_Co=256
set nowrap
syntax on "语法高亮
set number "显示行号
set ruler
set tabstop=4 "设置tab为4格
set softtabstop=4
set shiftwidth=4
filetype plugin indent on
set autoindent
set cindent
set showmode
set smartindent
set autoread
set showcmd
set expandtab
set nocompatible
set backspace=indent,eol,start
filetype off
"窗口快速切换
nnoremap ww <C-w><C-w> 
"多文件切换
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

"------------python设置---------------------------------
au BufNewFile,BufRead *.py 
            \ set textwidth=79
""au BufRead,BufNewFile *.py, *.pyw, *.c, *.h, *.cpp, *.java match BadWhitespace /\s\+$/
let python_highlight_all=1
"-------------------------------------------------------

"-----------前端配置------------------------------------
au BufNewFile,BufRead *.js, *.html, *.css
            \ set tabstop=2
            \ set softtabstop=2
            \ set shiftwidth=2
"-------------------------------------------------------

"------------NERDTree-----------------------------------
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=0
let NERDTreeAutoCenter=1
let NerdTreeShowHidden=1
let NERDTreeWinSize=30
"autocmd VimEnter * NERDTree
"let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swp']
let NERDTreeShowBookmarks=1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
"-------------------------------------------------------

"------------tagbar-------------------------------------
"autocmd VimEnter * nested :TagbarOpen
nnoremap <C-l> :TagbarToggle<CR>
let tagbar_right=1
let tagbar_width=30
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
    \ 'kinds' : [
        \ 'd:macros:1',
        \ 'g:enums',
        \ 't:typedefs:0:0',
        \ 'e:enumerators:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:global:0:0',
        \ 'x:external:0:0',
       \ 'l:local:0:0'
     \ ],
     \ 'sro' : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }
"-----------------------------------------------------

"---------nerdcommenter快速注释-----------------------
map <C-c> <leader>cc
map <C-u> <leader>cu
"-----------------------------------------------------

"---------airline-------------------------------------
let g:airline_theme='powerlineish'
let g:airline#extensions#tabline#enabled=1
"-----------------------------------------------------

"---------YouCompleteMe-------------------------------
let g:ycm_semantic_triggers={
    \ 'c,python' : ['->', '.', 're![_a-zA-Z0-9]'],
    \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
    \             're!\[.*\]\s'],
    \   'ocaml' : ['.', '#'],
    \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
    \   'perl' : ['->'],
    \   'php' : ['->', '::'],
    \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
    \   'ruby' : ['.', '::'],
    \   'lua' : ['.', ':'],
    \   'erlang' : [':'],
\ }
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_key_invoke_completion='<F9>'
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
nnoremap <C-g> :YcmCompleter GoToDefinitionElseDeclaration<CR>
set completeopt=longest,menu
set pumheight=10 "补全菜单高度
let g:ycn_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_strings=1
autocmd InsertLeave * if pumvisible()==0|pclose|endif
"-----------------------------------------------------

"-------------indentLine------------------------------
let g:indentLine_char='┆'
"----------------------------------------------------

"-------------vim-autoformat--------------------------
autocmd FileType python nnoremap <F4> :0,$!yapf<CR>
"----------------------------------------------------

"Vundle管理插件
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' "插件管理插件
Plugin 'Valloric/YouCompleteMe' "ycm自动补齐插件
""Plugin 'nathanaelkane/vim-indent-guides.git' "缩进对齐显示  
Plugin 'Yggdroot/indentLine'
Plugin 'file://~/.vim/bundle/vim-airline'
Plugin 'majutsushi/tagbar' "ctrl+t键打开左侧导航
Plugin 'scrooloose/nerdcommenter' "cc快速注释,cu快速取消注释
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree' "树型目录
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'kien/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'davidhalter/jedi-vim' "python补全插件

call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本

" 常用的命令
" :PluginList       - 列出所有已配置的插件
" :PluginInstall     - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        " exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc

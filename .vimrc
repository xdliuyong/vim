"-----------------------------vundle----------------------------------------
"source ~/.vim/bundles.vim
"不太方便,还是直接在vimrc里面配置
"使用vundle管理插件
set nocompatible              " be iMproved, required
filetype off                  " required
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"plugins
" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

"模糊查询
Plugin 'kien/ctrlp.vim' 
"括号自动补全       
Plugin 'Raimondi/delimitMate' 
"自动补全    
"Plugin 'Shougo/neocomplcache'   
"文件浏览  
Plugin 'xdliuyong/nerdtree' 
"python 格式检查   
Plugin 'klen/python-mode' 
"tab自动补全        
Plugin 'ervandew/supertab'     
"依赖，暂时去不掉   
Plugin 'majutsushi/tagbar' 
"coffee支持       
Plugin 'kchmck/vim-coffee-script'
"less支持
Plugin 'groenewege/vim-less'
"依赖，暂时去不掉 
Plugin 'tpope/vim-fugitive'  
"jinja支持(可能会导致文件浏览卡顿暂时去掉)
"Plugin 'lepture/vim-jinja'
"文件浏览框tab页支持        
Plugin 'jistr/vim-nerdtree-tabs'  
"vim状态栏(可能会导致文件浏览卡顿暂时去掉)
"Plugin 'Lokaltog/vim-powerline'  
"html 标签匹配高亮(可能会导致文件浏览卡顿暂时去掉)
"Plugin 'Valloric/MatchTagAlways'
"vimwiki
Plugin 'vimwiki/vimwiki'
"markdown
Plugin 'tpope/vim-markdown'
"光标跳转类似于chrome vim插件
Plugin 'easymotion/vim-easymotion'

call vundle#end()            " required

"--------------------------------------------vim----------------------------------------------------
" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" enable syntax hightlight and completion
syntax on

"自动 read 变化
set autoread
"光标放一段时间,插件文件是否变化
autocmd CursorHold * checktime
"刚进入 tab 检查是否发生变化
autocmd TabEnter * checktime

"colorscheme desert
set t_Co=256
colorscheme Tomorrow-Night

"vim和系统共用剪切板
let g:copycat#auto_sync = 1

"设置缓存路径
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

set smartindent
"让backspace可以删除indent
set backspace=indent,eol,start
"tab 改为 4 空格
set expandtab
"是否将输入的TAB自动展开成空格。开启后要输入TAB，需要Ctrl-V<TAB>
set softtabstop=4
set tabstop=4
set shiftwidth=4
"vim 换行时不切断单词
set linebreak

set hlsearch "高亮查找字符

"光标,mac要用 iTerm2 才有用
if exists('$TMUX')
      let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
      let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
      let &t_SI = "\<Esc>]50;CursorShape=1\x7"
      let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"-----------------------------------------------html------------------------------------------------
"html折叠
setlocal foldmethod=indent
filetype indent on

"-----------------------------------------tree--------------------------------------
"shift+i 显示隐藏文件
"默认打开tree
let g:nerdtree_tabs_open_on_console_startup=1
"tab \n 打开关闭 tree
map <Leader>n <plug>NERDTreeTabsToggle<CR>

"ctr + l 或者 ctr + h 切换标签页面
nnoremap <C-l> gt
nnoremap <C-h> gT

"让tree打开在tab
autocmd BufNew * if winnr('$') == 1 | tabmove99 | endif

let NERDTreeIgnore=['\~$', '\.pyc$', 'nohup.out', '\.swp$', 'node_modules']

"同个文件,只激活tab,自带的无法解决,使用xdliuyong/nerdtree
"set switchbuf=usetab

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\     if line("'\"") > 0 && line ("'\"") <= line("$") |
\         exe "normal g'\"" |
\     endif |
\ endif

"--------------------------------------vimwiki--------------------------------------------
autocmd BufNewFile,BufRead *.wiki set filetype=wiki
"vimwiki 配置文件
let wiki = {}
"保存时是否自动生成html
let wiki.auto_export=1
" 是否在计算字串长度时用特别考虑中文字符
let wiki.vimwiki_CJK_length=1
"使用markdown语法
let wiki.path='~/Dropbox/knowledge/data/'
let wiki.path_html='~/Dropbox/knowledge/html/'
let wiki.template_path='./'
let wiki.template_default='def_template'
let wiki.template_ext='.html'
let wiki.index='wiki_index'

let wiki.nested_syntaxes={'python': 'python', 'c++': 'cpp', 'bash': 'sh', 'as3': 'actionscript', 'mxml': 'mxml', 'sql': 'sql', 'html': 'html', 'java': 'java', 'xml': 'xml', 'js': 'javascript', 'coffee':'javascript', 'less':'less', 'css':'css'}
"search.py能够正常工作，否则都是在路径 ~/下
autocmd BufNewFile,BufRead *.wiki cd %:p:h

let g:vimwiki_list=[wiki]
"不需要驼峰英文成为维基词条
let g:vimwiki_camel_case=0
let g:vimwiki_file_exts='py,pdf,txt,doc,rtf,xls,php,zip,rar,7z,html,gz'
let g:vimwiki_browsers=['google-chrome']

"---------------------------------------vue----------------------------------------------
"支持vue高亮
autocmd BufNewFile,BufRead *.vue set filetype=html

"----------------------------------------markdown-----------------------------------------------
autocmd BufNewFile,BufReadPost *.md set filetype=markdown


"vim-easymotion的快捷键
map f <Plug>(easymotion-overwin-f2)


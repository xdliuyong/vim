"=============================================================================
"     FileName: .vimrc
"         Desc: MacVim and VIM Config plugin
"       Author: liuyong
"        Email: xdliuyong@gmail.com
"     HomePage: http://ly.hoywe.com/
"       Update: 2017.6.24
"=============================================================================

""基本配置
set nocompatible    ""vundle和vimwiki要求, 去除VIj兼容模式,必须首先关闭了
"mapleader 映射为,
let mapleader = ","
let g:mapleader = ","

" 解决vim卡
set re=1
set ttyfast
set lazyredraw

"快捷键映射
"跳转到句首第一个单词
:map g( ^
:map g) $

"设置文件编码检测类型及支持格式
set fencs=utf-8
" 解决中文乱码
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
" 设置 utf-8 编码
set encoding=utf-8

syntax on                   "语法高亮
set number                  "打开行号
" set relativenumber          "打开相对行号
set nowrap                                 " 不自动折行
set incsearch                              " 搜索时: 输入的时候就可以即时查看结果
set ignorecase                             " 搜索时: 忽略大小写
set smartcase                              " 搜索时: 如果有一个大写字母，则切换到大小写敏感查找

filetype off  " required

"用文件类型plugin脚本(可以在ftplugin文件夹中添加文件类型对应的脚本)
filetype plugin indent on

"colorscheme 主题/配色(主题在colors文件夹下)
set t_Co=256
" colorscheme Tomorrow-Night
colorscheme solarized

set ambiwidth=double        "防止符号无法显示

"tab 改为 4 空格
set expandtab "是否将输入的TAB自动展开成空格。开启后要输入TAB，需要Ctrl-V<TAB>
set softtabstop=4
set tabstop=4
set shiftwidth=4

"不同的文件设置不同的缩进
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
" 2个空格
autocmd FileType javascript,vue setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType sass,scss,css,less setlocal tabstop=2 shiftwidth=2 softtabstop=2

set nobackup                ""关闭备份
"设置自定备份路径,需要在.vim中mkdir tmp
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
 \ if ! exists("g:leave_my_cursor_position_alone") |
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \ exe "normal g'\"" |
 \ endif |
 \ endi

" shell切换快捷键
:noremap <c-d> :sh<cr>

"vim 换行时不切断单词
set linebreak
set hlsearch                ""高亮显示搜索结果

set clipboard=unnamed       "vim和系统共用剪切板

set autoread                "当文件在外部被修改时自动更新该文件
"光标放一段时间,插件文件是否变化
autocmd CursorHold * checktime
"刚进入 tab 检查是否发生变化
autocmd TabEnter * checktime
"html文件类型检查
autocmd BufNewFile,BufRead *.html set filetype=html
autocmd BufNewFile,BufRead *.wxml set filetype=html

"映射在新窗口中打开文件
nnoremap <Leader>o :tabnew<CR>
"关闭不保存文件映射
nnoremap <Leader>q :q<CR>
"强制不保存退出
nnoremap <Leader>q! :q!<CR>
"保存退出
nnoremap <Leader>wq :wq<CR>
"强制保存退出
nnoremap <Leader>wq! :wq!<CR>
"保存不退出
nnoremap <Leader>w :w<CR>
"强制保存不退出
nnoremap <Leader>w! :w!<CR>

set tabline=%!tabber#TabLine() "显示tab

"美化macvim,只有在单独启动mvim的时候生效,在iterm2中不生效
if has("gui_running")
    set go=aAce                 " 去掉难看的工具栏和滑动条
    set guifont=Monaco:h13      " 设置默认字体为monaco
    set showtabline=2           " 开启自带的tab栏
    set guioptions-=e           "设置tab状态栏样式
    set fu                      "全屏模式启动macvim
endif

" 使用yapf来进行python格式化, leader=来运行yapf
autocmd FileType python nnoremap <Leader>= :0,$!yapf<CR>

"插件管理使用vim-plug，在plugs.vim中配置插件,放到最后不然有些插件依赖于.vimrc的全局设置就会失效
source ~/.vim/plugs.vim


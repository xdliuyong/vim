"-------------------------------------------------------------------------VIM-----------------------------------------------------------------------------
"设置自定备份路径,需要在.vim中mkdir tmp
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

"vimwiki要求,所以首先关闭了 “compatible” 选项
set nocompatible

"用文件类型plugin脚本(可以在ftplugin文件夹中添加文件类型对应的脚本)
filetype plugin on

"语法高亮
syntax on

"pathogen plugin管理 manage your runtimepath
execute pathogen#infect()
filetype plugin indent on

" 设置文件编码检测类型及支持格式
set fencs=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,latin1
"colorscheme 主题/配色(主题在colors文件夹下)
set t_Co=256
colorscheme Tomorrow-Night


"-------------------------------------------------------------------------vim-nerdtree-tabs----------------------------------------------------------------
"shift+i 显示/隐藏文件
"默认打开tree
let g:nerdtree_tabs_open_on_console_startup=1

"\n 打开关闭 tree
map <Leader>n <plug>NERDTreeTabsToggle<CR>


"-------------------------------------------------------------------------vimwiki----------------------------------------------------------------
"设置文件后缀为wiki
autocmd BufNewFile,BufRead *.wiki set filetype=wiki
"把字幕文件当wiki，方便查词
autocmd BufNewFile,BufRead *.srt set filetype=wiki
"vimwiki 配置文件
let wiki = {}
"保存时是自动生成html
let wiki.auto_export=1
"在计算字串长度时特别考虑中文字符
let wiki.vimwiki_CJK_length=1
"wiki list 文件
let wiki.index='index'
"使用markdown语法
"let wiki.syntax='markdown'
"wiki路径
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
"默认打开的浏览器
let g:vimwiki_browsers=['google-chrome']




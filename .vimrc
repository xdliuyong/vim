"-------------------------------------------------------------------------VIM-----------------------------------------------------------------------------
"设置自定备份路径,需要在.vim中mkdir tmp
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

"vimwiki要求,所以首先关闭了 “compatible” 选项
set nocompatible

"用文件类型plugin脚本(可以在ftplugin文件夹中添加文件类型对应的脚本)
filetype plugin on

"pathogen plugin管理 manage your runtimepath
execute pathogen#infect()
filetype plugin indent on

"语法高亮
syntax on

"tab 改为 4 空格
set expandtab "是否将输入的TAB自动展开成空格。开启后要输入TAB，需要Ctrl-V<TAB>
set softtabstop=4
set tabstop=4
set shiftwidth=4

"vim 换行时不切断单词
set linebreak

" 设置文件编码检测类型及支持格式
set fencs=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,latin1

"colorscheme 主题/配色(主题在colors文件夹下)
set t_Co=256
colorscheme Tomorrow-Night

"高亮查找字符
set hlsearch

"开启delete
set nocompatible

"vim和系统共用剪切板
let g:copycat#auto_sync = 1

"-------------------------------------------------------------------------vim-nerdtree-tabs----------------------------------------------------------------
"shift+i 显示/隐藏文件
"默认打开tree
let g:nerdtree_tabs_open_on_console_startup=1

"\n 打开关闭 tree
map <Leader>n <plug>NERDTreeTabsToggle<CR>

"nerdtree ignore
let NERDTreeIgnore = ['\.pyc$','nohup.out', 'node_modules']
" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
 \ if ! exists("g:leave_my_cursor_position_alone") |
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \ exe "normal g'\"" |
 \ endif |
 \ endif


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

"-------------------------------------------------------------------------支持vue高亮----------------------------------------------------------------
"vim-vue-syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_vue_checkers = ['eslint']
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
    let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
    let g:syntastic_javascript_eslint_exec = local_eslint
    let g:syntastic_vue_eslint_exec = local_eslint
endif


"-------------------------------------------------------------------------syntastic错误提示-------------------------------------------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"改用syntastic来做python lint
let g:pymode_lint_write = 0
let g:syntastic_python_flake8_args='--ignore=E501'

"----------------------------------------------------------------VimShellPop---------------------------------------------------------------------------------------------------------------------------
let g:vimshell_popup_command="belowright 10split"
map <f7> :VimShellPop<CR>
map <f8> :VimShellTab<CR>

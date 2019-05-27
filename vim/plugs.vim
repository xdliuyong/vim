" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes"plugins
"------------------------------------------------------------------------
" 大纲导航
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" nginx configure syntax
Plug 'chr4/nginx.vim'

" js语法补全,
" 已经包含在了YouCompleteMe中,此处重新安装一下,寻求心理安慰，新增js tern plugins时直接在YouCompleteMe下的tern路径下安装即可
" 可以在tern plugins中安装，貌似都不生效TT
Plug 'ternjs/tern_for_vim'

" 解决html5语法高亮支持
Plug 'othree/html5.vim'

" 高亮光标当前同名单词
Plug 'hotoo/highlight-cursor-word.vim'
"支持所有文件
autocmd CursorMoved,CursorHold * silent! call HighlightCursorWord()

" 多行编辑
"非插入模式下 ctrl+n 连续选中更当前光标相同的单词， 按下c进行修改 esc修改完成退出
Plug 'terryma/vim-multiple-cursors'
" c change text I insert at start of range A insert at end of range
" change select alt+n to ctrl+a
let g:multi_cursor_select_all_word_key = '<C-a>'
let g:multi_cursor_select_all_key      = 'g<C-a>'

" word add extend  tag
Plug 'tpope/vim-surround'
" surround depend repeat
Plug 'tpope/vim-repeat'

" git vim plugins
Plug 'airblade/vim-gitgutter'

" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" 使用ctrl+space完成snippets的自动补全
let g:UltiSnipsExpandTrigger = "<s-tab>"

"快速定位
Plug 'easymotion/vim-easymotion'
"<leader><leader>w 单词定位
" <leader><leader>f 字符定位
" <leader><leader>s 搜索定位
" 行级跳转
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
" 行内跳转
map <Leader><Leader>l <Plug>(easymotion-lineforward)
map <Leader><Leader>h <Plug>(easymotion-linebackward)
" 重复上一次动作
map <Leader><leader>. <Plug>(easymotion-repeat)


" 代码补全YouComplete
Plug 'Valloric/YouCompleteMe'
" {{{
""" 插件安装命令: ./install.py --clang-completer --system-libclang --js-completer
" 向下选择ctrl+j
let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
" 向上选择ctrl+k
let g:ycm_key_list_previous_completion = ['<c-k>', '<Up>']
" 屏蔽自带的诊断消息
let g:ycm_show_diagnostics_ui = 0
" 两个字符后补全
let g:ycm_min_num_identifier_candidate_chars = 2
" 在注释输入也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入也能补全
let g:ycm_complete_in_strings = 1
" 开启语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
"让Vim的补全菜单行为与一般IDE一致
set completeopt=longest,menu
" 按照语义补全, 使用默认值ctrl+space
" let g:ycm_key_invoke_completion = '<C-Space>'
" 关闭参数提示的小窗口
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 以下文件中忽略自动补全
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}
" 四空格起始的行，以及冒号后+空格和HTML关闭标签时，也可以触发一下自动补全
let g:ycm_semantic_triggers = {
    \   'css': [ 're!^\s{4}', 're!:\s+'],
    \   'html': [ '</' ],
    \ }
" 跳转到定义处, 水平分屏打开
let g:ycm_goto_buffer_command = 'horizontal-split'
" 跳转到定义处， 目前支持当前文件中、import进来的, 系统级的会报runtime error
" 跳转到定义处和声明处
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 跳转到定义
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
" 跳转到声明
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
" }}}
"

" 文件搜索
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" 搜索文件，用leader f，搜索缓存，用leader b, 需要先安装依赖 brew install fzf
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
" 搜索文件里面的内容，用leander a, 需要先安装 brew install the_silver_searcher
nnoremap <silent> <Leader>a :Ag<CR>

" fzf find in project root directory
Plug 'airblade/vim-rooter'

" 异步完成的语法检查
Plug 'w0rp/ale'
" 只是在文件保存时进行语法检查
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
"将所有错误显示在列表中
let g:ale_open_list = 0
" 修改错误提示图标
let g:ale_sign_error = '•'
" 修改警告提示图标
let g:ale_sign_warning = '•'
" 语法错误的时候，左边小原点的颜色
hi ALEErrorSign ctermfg=196 ctermbg=NONE cterm=bold
hi ALEWarningSign ctermfg=192 ctermbg=NONE cterm=bold
hi SignColumn ctermfg=NONE ctermbg=NONE cterm=bold

let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'sh' : ['shellcheck'],
\    'vim' : ['vint'],
\    'html' : ['tidy'],
\    'css': ['stylelint'],
\    'python': ['flake8']
\}
" Do not lint or fix html files.
let g:ale_pattern_options = {
\    '\.html$': {'ale_linters': [], 'ale_fixers': []},
\}
" If you configure g:ale_pattern_options outside of vimrc, you need this.
let g:ale_pattern_options_enabled = 1
" python3没生效
let b:ale_python_flake8_executable = 'python2'
let b:ale_python_flake8_options = '-m flake8 --ignore=E722 --max-line-length=200'
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
"<Leader>s触发/关闭语法检查
nmap <Leader>t :ALEToggle<CR>
"普通模式下，sk前往上一个错误或警告，sj前往下一个错误或警告
nmap sk <Plug>(ale_previous_wrap)
nmap sj <Plug>(ale_next_wrap)


"去掉末尾空格
Plug 'bronson/vim-trailing-whitespace'

" 代码折叠
Plug 'tmhedberg/SimpylFold'

"vue语法高亮
Plug 'posva/vim-vue'
" syntax highlighting stop working randomly
autocmd FileType vue syntax sync fromstart
" 解决vue文件卡顿问题
let g:vue_disable_pre_processors=1

" es6 syntax highlighting
Plug 'isRuslan/vim-es6'

" 快速对齐
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"gui下tab栏样式
Plug 'gcmt/taboo.vim'
"设置显示格式
let g:taboo_tab_format  = '%f[%N]'

"coffee script语法高亮
Plug 'kchmck/vim-coffee-script'

"自动注释
"<leader>cc 注释当前行
"<leader>cs 优雅注释
"<leader>cu 取消注释当前行
Plug 'scrooloose/nerdcommenter'
" 注释的时候自动加加空格
let g:NERDSpaceDelims=1

"vim-nerdtree-tabs
Plug 'xdliuyong/nerdtree'
"{{{
"shift+i 显示/隐藏文件
"默认打开tree
let g:nerdtree_tabs_open_on_console_startup=1
"默认打开时，光标总是落在内容上
let g:nerdtree_tabs_smart_startup_focus = 2
",n 打开关闭 tree
map <Leader>n <plug>NERDTreeTabsToggle<CR>
"让tree打开在tab
autocmd BufNew * if winnr('$') == 1 | tabmove99 | endif
"nerdtree ignore
let NERDTreeIgnore = ['\.pyc$','nohup.out', 'node_modules']
"打开文件时改变path
autocmd BufEnter * lcd %:p:h
"}}}

"文件浏览框tab页支持
Plug 'jistr/vim-nerdtree-tabs'

" 状态栏里显示错误数目
Plug 'maximbaz/lightline-ale'

"vim状态栏
Plug 'itchyny/lightline.vim'
"底部状态栏 lightline
"配合Tomorrow-Night 主题
" colorscheme': 'wombat',
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'tab_component_function': {
    \   'filename': 'MyTabFilename',
    \ },
    \ 'component': {
    \   'filename': '%f',
    \   'close': '',
    \ },
    \ 'active': {
    \   'left': [['mode', 'paste'], ['filename', 'modified']],
    \   'right': [['lineinfo'], ['percent'], ['fileencoding'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
    \ },
    \ 'component_expand': {
    \   'linter_warnings': 'LightlineLinterWarnings',
    \   'linter_errors': 'LightlineLinterErrors',
    \   'linter_ok': 'LightlineLinterOK'
    \ },
    \ 'component_type': {
    \   'readonly': 'error',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error'
    \ }
\}

function! MyTabFilename(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let bufnum = buflist[winnr - 1]
  let bufname = expand('#'.bufnum.':t')
  let buffullname = expand('#'.bufnum.':p')
  let buffullnames = []
  let bufnames = []
  for i in range(1, tabpagenr('$'))
    if i != a:n
      let num = tabpagebuflist(i)[tabpagewinnr(i) - 1]
      call add(buffullnames, expand('#' . num . ':p'))
      call add(bufnames, expand('#' . num . ':t'))
    endif
  endfor
  let i = index(bufnames, bufname)
  if strlen(bufname) && i >= 0 && buffullnames[i] != buffullname
    return substitute(buffullname, '.*/\([^/]\+/\)', '\1', '')
  else
    return strlen(bufname) ? bufname : '[No Name]'
  endif
endfunction

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction
function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction
function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

" Update and show lightline but only if it's visible (e.g., not in Goyo)
autocmd User ALELint call s:MaybeUpdateLightline()
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction


""快速写html
Plug 'mattn/emmet-vim'

let g:user_emmet_install_global = 0
let g:user_emmet_expandabbr_key = '<leader><CR>'
"支持html和vue的文件类型
autocmd FileType html,vue EmmetInstall

"括号自动补全
Plug 'jiangmiao/auto-pairs'

"vimwiki
Plug 'vimwiki/vimwiki'
"{{{
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
"}}}

" required
call plug#end()

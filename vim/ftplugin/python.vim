cd %:p:h

let g:pymode_lint_ignore = "E501,W0403,C0110,C0301,W0703,R0201,E265"
let g:pymode_rope = 1
let g:pymode_rope_autoimport = 0
"关了自动补全,太慢了.
let g:pymode_rope_completion=0
let g:pymode_rope_lookup_project = 0
let g:pymode_options_max_line_length = 279
""跳转定义的时候,用 e new vnew tabnew 哪种方式打开
let g:pymode_rope_goto_definition_cmd = 'tabnew'

"带着的folding太蠢了
let g:pymode_folding = 0
set foldmethod=indent

let g:pymode_indent = 1
map <buffer> <f1> i#!/usr/bin/env python<cr># -*- coding: utf-8 -*-<cr><cr>if __name__ == '__main__':<cr>pass<Esc>
"用autopep8来自动格式化python
map <buffer> <f2> :!autopep8 --max-line-length 444 --in-place --aggressive --aggressive % <cr><cr>:edit<cr>
" 使用yapf来格式化 F3,也可以在vimrc中使用leader=来格式化
map <buffer> <f3> :w<cr>:0,$!yapf<CR>
map <buffer> <f4> :w<cr> :cd %:p:h<cr> :!python %<cr>
"插入生成代码的相关信息
inoremap <buffer> <f5> create by liuyong at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr>
inoremap <buffer> <f6> modify by liuyong at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr>

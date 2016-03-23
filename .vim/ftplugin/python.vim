"python-mode
cd %:p:h
let g:pymode_lint_ignore = "E501,W0403,C0110,C0301,C901,W0703,R0201,E265"
let g:pymode_rope_completion=0
let g:pymode_options_max_line_length = 120
"跳转定义的时候,用 e new vnew tabnew 哪种方式打开
let g:pymode_rope_goto_definition_cmd = 'tabnew'
let g:pymode_indent = 0
map <f1> i#!/usr/bin/env python<cr># -*- coding: utf-8 -*-<cr><cr>if __name__ == '__main__':<cr>pass<Esc>
"用autopep8来自动格式化python
map <f2> :!autopep8 --max-line-length 444 --in-place --aggressive --aggressive % <cr><cr>:edit<cr>
"语法检测
map <f3> :w<cr>:PymodeLint <cr>
"执行python
map <f4> :w<cr> :cd %:p:h<cr> :!python %<cr>
"插入生成代码的相关信息
inoremap <buffer> <f5> create by liuyong at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr> 
inoremap <buffer> <f6> modify by liuyong at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr> 

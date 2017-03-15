setlocal foldmethod=indent
map <buffer> <f1> i<!DOCTYPE html><cr><html lang="zh"><cr><body><cr></body><cr></html><Esc>kko
"找不google-chrome占时取消
map <buffer> <f4> :!google-chrome %<cr><cr>

"插入注释块
inoremap <buffer> <f5> <!--   --><Esc>4hi

filetype indent on
"set filetype=html  
setlocal softtabstop=2
setlocal tabstop=2
setlocal shiftwidth=2

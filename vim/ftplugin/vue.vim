setlocal foldmethod=indent
filetype indent on
map <buffer> <f2> i<template><cr></template><cr><script><cr>export default {<cr>}<cr></script><cr><style scoped><cr></style><Esc>4ko

"插入生成代码的相关信息
inoremap <buffer> <f5> //<Space>create by liuyong at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr>
inoremap <buffer> <f6> //<Space>modify by liuyong at <c-r>=strftime("%y/%m/%d %H:%M:%S")<cr>
"插入注释块
inoremap <buffer> <f7> //<Space> <Esc>i

setlocal softtabstop=2
setlocal tabstop=2
setlocal shiftwidth=2



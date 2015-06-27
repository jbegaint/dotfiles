nnoremap <buffer> <silent> <F7> :LatexTOCToggle<CR>
setlocal sw=4 ts=4 sts=4
setlocal fo=cq
autocmd BufWritePre *.tex :%s/\s\+$//e

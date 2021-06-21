 " Equivalent to the above.
 let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
 let g:ale_fixers = {
 \   '*': ['remove_trailing_lines', 'trim_whitespace'],
 \   'javascript': ['eslint'],
 \}

 let g:ale_sign_error = '❌'
 let g:ale_sign_warning = '⚠️'
 let g:ale_fix_on_save = 1
 let g:airline#extensions#ale#enabled = 1



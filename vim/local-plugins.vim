" vim: ft=vim
"
" This file keeps come plugins that might be useful to you.
" You can copy/paste what you like to `local-plugins.vim` that
" will be source in vimrc

" Interactive command execution in Vim.
call dein#add('Shougo/vimproc.vim', {'build': 'make'}, {'on_source': 'unite.vim'})

" True Sublime Text style multiple selections for Vim
call dein#add('terryma/vim-multiple-cursors')

" fugitive.vim: a Git wrapper so awesome, it should be illegal
call dein#add('tpope/vim-fugitive')

" gitk for Vim.
call dein#add ('gregsexton/gitv', {'on_cmd': 'Gitv'})

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
call dein#add('airblade/vim-gitgutter')

" extended % matching for HTML, LaTeX, and many other languages
call dein#add('tmhedberg/matchit')

" wisely add "end" in ruby, endfunction/endif/more in vim script, etc
call dein#add('tpope/vim-endwise')

" Better whitespace highlighting for Vim
call dein#add('ntpeters/vim-better-whitespace')
  autocmd BufEnter * EnableStripWhitespaceOnSave
  autocmd BufEnter * DisableWhitespace

" vim-interestingwords allows you to highlight and navigate through (multiple) different words in a buffer
call dein#add('lfv89/vim-interestingwords')

" awesome Python autocompletion with VIM
" call dein#add('davidhalter/jedi-vim', {
"       \ 'if': "!has('nvim')",
"       \ 'on_ft': 'python'
"       \ })

" neo-snippet plugin contains neocomplete snippets source
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neosnippet.vim', {
      \ 'depends': ['neosnippet-snippets'],
      \ 'on_event': 'InsertCharPre',
      \ 'on_ft': 'snippet',
      \ 'hook_source': 'imap <C-k>  <Plug>(neosnippet_expand_or_jump)'
      \})

" A simple, easy-to-use Vim alignment plugin.
call dein#add('junegunn/vim-easy-align', {
      \ 'hook_add': 'vmap <Enter> <Plug>(EasyAlign)'
      \})

" Enhanced LaTeX support for Vim
call dein#add('jcf/vim-latex', {'on_ft': ['tex']})
  set shellslash
  let g:tex_flavor                 = 'latex'
  let g:Tex_DefaultTargetFormat    = 'pdf'
  let g:Tex_CompileRule_pdf        = 'xelatex --interaction=nonstopmode $*'
  let g:Tex_MultipleCompileFormats = 'pdf,bib,pdf'
  if has("unix") && match(system("uname"),'Darwin') != -1
    let g:Tex_ViewRule_pdf = 'Skim'
  endif

" unite yank
call dein#add('Shougo/neoyank.vim')
  nnoremap <silent> [unite]y :<C-u>Unite -toggle -auto-resize -buffer-name=yanks    history/yank<cr>

" Efficient way to edit remote files on multiple environments with Vim.
call dein#add('zenbro/mirror.vim')

" set makeprgs based on different projects (Makefile, SConstruct)
call dein#add('vim-scripts/makeprgs')

" solarized theme
call dein#add('vim-airline/vim-airline-themes')
  let g:airline_theme='solarized'
  let g:airline_powerline_fonts=1

call dein#add('rhysd/vim-clang-format')
  let g:clang_format#code_style='google'
  let g:clang_format#style_options = {
            \ "PointerAlignment" : "Right",
            \ "DerivePointerAlignment" : "false",
            \ "TabWidth" : 2,
            \ "UseTab" : "Never",
            \ "ColumnLimit" : "100"}

set rtp+=/home/rice/.linuxbrew/opt/fzf

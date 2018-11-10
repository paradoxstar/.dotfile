" ==========================================
" Plugin 插件管理和配置
" ==========================================

"-------------------- begin of configs ------------------------

" 非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader = ","
let g:mapleader = ","

" set the runtime path to include Vundle and initialize
" Load vundle.
let $CACHE = expand('$DOTFILEDIR/bundle')
let s:vundle_dir = finddir('Vundle.vim', '.;')
if s:vundle_dir != '' || &runtimepath !~ '/Vundle.vim'
  if s:vundle_dir == '' && &runtimepath !~ '/Vundle.vim'
    let s:vundle_dir = expand('$CACHE/vundle')
          \. '/Vundle.vim'
    if !isdirectory(s:vundle_dir)
      execute '!git clone https://github.com/VundleVim/Vundle.vim' s:vundle_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
        \ fnamemodify(s:vundle_dir, ':p') , '/$', '', '')
endif
"call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin(expand('$CACHE/vundle'))


"=================================================
" 	插件管理 Vundle
"=================================================
" 使用Vundle来管理插件
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"================== PART  END =======================


"=================================================
" 	自动补全 YouCompleteMe
"=================================================
Plugin 'Valloric/YouCompleteMe'

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_use_ultsudisnips_completer = 1 "提示UltiSnips
let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全

" 跳转到定义处, 分屏打开
let g:ycm_goto_buffer_command = 'horizontal-split'
" nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

" 引入，可以补全系统，以及python的第三方包 针对新老版本YCM做了兼容
" old version
if !empty(glob("$DOTFILEDIR/bundle/vundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
endif
" new version
if !empty(glob("$DOTFILEDIR/bundle/vundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
    let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
endif

" 直接触发自动补全 insert模式下
" let g:ycm_key_invoke_completion = '<C-Space>'
" 黑名单,不启用
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'gitcommit' : 1,
      \}
"========================== PART  END ========================================


"=================================================
" 	代码片段快速插入 (snippets中,是代码片段资源,需要学习)
"=================================================
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'

let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories  = ['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
" 定义存放代码片段的文件夹 .vim/UltiSnips下，使用自定义和默认的，将会的到全局，有冲突的会提示
" 进入对应filetype的snippets进行编辑
map <leader>us :UltiSnipsEdit<CR>

" ctrl+j/k 进行选择
func! g:JInYCM()
    if pumvisible()
        return "\<C-n>"
    else
        return "\<c-j>"
    endif
endfunction

func! g:KInYCM()
    if pumvisible()
        return "\<C-p>"
    else
        return "\<c-k>"
    endif
endfunction
inoremap <c-j> <c-r>=g:JInYCM()<cr>
au BufEnter,BufRead * exec "inoremap <silent> " . g:UltiSnipsJumpBackwordTrigger . " <C-R>=g:KInYCM()<cr>"
let g:UltiSnipsJumpBackwordTrigger = "<c-k>"
"=================================================PART  END ====================================================


"=================================================
" 	vim-airline vim状态栏插件
"=================================================

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '¦'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

set t_Co=256 
let g:airline_powerline_fonts = 1
"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline_theme = 'solarized'
"=================================================PART  END ====================================================


"=================================================
" 	vim-git vim-git插件
"=================================================
" fugitive.vim: a Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'
" gitk for Vim.
Plugin 'gregsexton/gitv'
" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plugin 'airblade/vim-gitgutter'
"====================================PART  END =================================


"=================================================
" 括号显示增强
"=================================================
Plugin 'kien/rainbow_parentheses.vim'
" 不加入这行, 防止黑色括号出现, 很难识别
" \ ['black',       'SeaGreen3'],
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"====================================PART  END =================================


"=================================================
" 显示增强-主题 
"=================================================" 
" 主题 solarized
Plugin 'altercation/vim-colors-solarized'
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
" let g:solarized_termcolors=256

" 主题 molokai
Plugin 'tomasr/molokai'
" monokai原始背景色
let g:molokai_original = 1

" 主题 tomorrow
Plugin 'chriskempson/vim-tomorrow-theme'
"====================================PART  END =================================


"=================================================
" 	Tagbar 标签导航
"=================================================
Plugin 'majutsushi/tagbar'
nmap <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" go语言的tagbar配置
" 1. install gotags 'go get -u github.com/jstemmer/gotags'
" 2. make sure `gotags` in you shell PATH, you can call check it with `which gotags`
" for gotags. work with tagbar
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
"====================================PART  END =================================


"=================================================
"	NERDTree 目录导航
"=================================================
Plugin 'scrooloose/nerdtree'
map <F7> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
" s/v 分屏打开文件
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'
"====================================PART  END =================================


"=================================================
"	taglist plugin
"=================================================
Plugin 'taglist.vim'
map <F8> :TlistToggle<CR>

"-- Taglist setting --
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=0 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=1 "实时更新tags
let Tlist_Inc_Winwidth=0
"====================================PART  END =================================


"=================================================
" 	Golang 开发插件
"=================================================

" 1.install golang and install gocode 'go get github.com/nsf/gocode'
" 2.make sure gocode in your path: `which gocode` (add $GOPATH/bin to you $PATH)
Plugin 'fatih/vim-go'
"=========================== PART  END =========================================


"=================================================
" 	Vim-template 插件
"=================================================
Plugin 'paradoxstar/vim-template'
let g:user = "Hongkun Yu"
let g:email = "staryhk@gmail.com"

"=========================== PART  END =========================================


"=================================================
" 	Vim-polyglot 插件
"=================================================
"A solid language pack for vim
Plugin 'sheerun/vim-polyglot'
"=========================== PART  END =========================================


"=================================================
" 	Vim-incsearch 插件
"=================================================
" incrementally highlights ALL pattern matches unlike default 'incsearch'.
Plugin 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
"=========================== PART  END =========================================


"=================================================
" 	Vim-commentary 插件
"=================================================
" comment stuff out
Plugin 'tpope/vim-commentary'
"=========================== PART  END =========================================


"=================================================
" 	Unite 插件
"=================================================
" Unite and create user interfaces
Plugin 'Shougo/unite.vim'
Plugin 'thinca/vim-unite-history'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite-outline'
let g:unite_enable_auto_select = 0
let g:unite_source_rec_max_cache_files=100
"call unite#custom#profile('default', 'context', {
"      \ 'start_insert' : 1
"      \ })
"call unite#custom#source(
"      \ 'buffer,file/async,file_rec,file_rec/async,file_rec/git', 'matchers',
"      \ ['converter_relative_word', 'matcher_fuzzy'])
"call unite#custom#source(
"      \ 'file_mru', 'matchers',
"      \ ['matcher_project_files', 'matcher_fuzzy',
"      \  'matcher_hide_hidden_files', 'matcher_hide_current_file'])
"call unite#custom#source(
"      \ 'file_rec,file_rec/async,file_rec/git,file_mru', 'converters',
"      \ ['converter_uniq_word'])
"call unite#custom#source(
"      \ 'buffer', 'converters',
"      \ ['converter_uniq_word','converter_word_abbr'])
"call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#filters#matcher_default#use(['matcher_fuzzy'])

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
  \ '-i --vimgrep --hidden --ignore ' .
  \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif

" Source rec.
let s:source_file_rec = {
    \ 'name' : 'file_rec',
    \ 'description' : 'candidates from directory by recursive',
    \ 'hooks' : {},
    \ 'default_kind' : 'file',
    \ 'max_candidates' : 50,
    \ 'ignore_globs' : [
    \         '.', '*~', '*.o', '*.exe', '*.bak',
    \         'DS_Store', '*.pyc', '*.sw[po]', '*.class',
    \         '.hg/**', '.git/**', '.bzr/**', '.svn/**',
    \         'tags', 'tags-*'
    \ ],
    \ 'matchers' : [ 'converter_relative_word',
    \                'matcher_default', 'matcher_hide_hidden_files' ],
    \ }

"call unite#custom#source('file_rec,file_rec/async', 'matchers',
"    \ ['converter_relative_word', 'matcher_project_ignore_files', 'matcher_default'])

function! s:unite_settings() abort
  nmap <buffer> <esc> <plug>(unite_exit)
  imap <buffer> <esc> <plug>(unite_exit)
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
endfunction
autocmd FileType unite call s:unite_settings()

nmap <space> [unite]
nnoremap [unite] <nop>
nnoremap <silent> [unite]r :<C-u>Unite -toggle -auto-resize -buffer-name=files    file_rec/async<cr><c-u>
nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files    file<cr><c-u>
nnoremap <silent> [unite]b :<C-u>Unite -toggle -auto-resize -buffer-name=buffers  buffer file_mru<cr>
nnoremap <silent> [unite]l :<C-u>Unite -toggle -auto-resize -buffer-name=line     line<cr>
nnoremap <silent> [unite]/ :<C-u>Unite -toggle -auto-resize -buffer-name=search   grep:.<cr>
nnoremap <silent> [unite]o :<C-u>Unite -toggle -auto-resize -buffer-name=outline  outline<cr>
nnoremap <silent> [unite]c :<C-u>Unite -default-action=execute -buffer-name=commands  history/command<CR>
"=========================== PART  END =========================================


call vundle#end()            " required
" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on

" theme主题
set background=dark
set t_Co=256
colorscheme solarized
" colorscheme Tomorrow-Night
" colorscheme Tomorrow-Night-Bright
" colorscheme desert
"colorscheme molokai
"-------------------- end of configs ------------------------

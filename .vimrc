call plug#begin('~/.vim/plugged')
	Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'w0rp/ale'
  Plug 'yggdroot/indentline'
" Plug 'Valloric/YouCompleteMe'
  Plug 'Chiel92/vim-autoformat'
  Plug 'tell-k/vim-autopep8'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
  Plug 'aperezdc/vim-template'
  Plug 'altercation/vim-colors-solarized'
  Plug 'iCyMind/NeoSolarized'
  Plug 'jiangmiao/auto-pairs'
  Plug 'rhysd/vim-clang-format'
" 自动补全插件
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
" Plug 'vim-syntastic/syntastic'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
" markdown插件
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'

	"此处可以添加其他插件
	"Plug 'github网站上的其他vimscript插件'
call plug#end()

" 语法高亮
syntax enable
syntax on

" 关闭 [Scratch] - PRV
set completeopt=menu

" 使用vim的键盘模式
set nocompatible
set noswapfile

" vim在instert模式下使用backspace
set backspace=indent,eol,start

" 开启行号显示
set nu
set nohlsearch

" 设置可以让第一次进入文件的时候使用绝对行号，
" 进入编辑模式再退出到normal模式时再显示相对行号
augroup relative_numbser
  autocmd!
  autocmd InsertEnter * :set norelativenumber
  autocmd InsertLeave * :set relativenumber
augroup END


" 设置tab键4格
set tabstop=2

" 设置格式化时制表符占用空格数
set shiftwidth=2

" 让vim把连续数量的空格视为一个制表符
set softtabstop=2

" 将制表符扩展为空格
set expandtab

" 显示光标当前位置
set ruler

set numberwidth=4
" 高亮显示当前行列
set cursorline
""set cursorcolumn

" 自适应不同语言的智能缩进
filetype indent on
set ignorecase 

" 设置自动缩进
set autoindent
set smartindent
set showcmd

" 光标移动到顶部和底部时保持3行距离
set scrolloff=10


" termguicolors 开启真彩色
if has("termguicolors")
  " fix bug for vim
  " termguicolors 用来开启真彩色，前面两行用来解决 vim 的 BUG (neovim 不需要），
  " 其中 ^[ 是代表 ESC 键，需要在 vim 中按 Ctrl-v ESC 来输入
  set t_8f=[38;2;%lu;%lu;%lum
  set t_8b=[48;2;%lu;%lu;%lum

  " enbale true color
  set termguicolors
endif

" 设置256色
""if !has("gui_running")
""    set t_Co=256
""  set term=screen-256color
""endif

" 配色方案
colorscheme NeoSolarized
""colorscheme molokai

" 设置背景色
set background=dark
""set background=light

" NeoSolarized OPTIONS:
" ---------------------------------------------------------------------
" g:neosolarized_contrast
" g:neosolarized_visibility
" g:neosolarized_diffmode
" g:neosolarized_termtrans
" g:neosolarized_bold
" g:neosolarized_underline
" g:neosolarized_italic
 
" 设置solarized主题为256色
let g:neosolarized_termcolors = 256
let g:neosolarized_contrast = "high"
let g:neosolarized_termtrans = 0
let g:neosolarized_visibility = "normal"
" solarized 允许bold,ital"
let g:neosolarized_bold = 1
let g:neosolarized_underline = 0
let g:neosolarized_italic = 1


" 设置<leader>键为","
let mapleader = ","

" vim-markdown的concealcursor特性与indentLine冲突。
" 如果你安装了indentLine，_vimrc中增加下面一句问题就解决了
let g:indentLine_concealcursor = ''

" Markdown配置
" ------------------------------------------------
" 不折叠显示，默认是折叠显示，看个人习惯
let g:vim_markdown_folding_disabled = 1  
let g:vim_markdown_override_foldtext = 0
" 可折叠的级数，对应md的标题级别
let g:vim_markdown_folding_level = 6    
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_emphasis_multiline = 0
set conceallevel=2
let g:vim_markdown_frontmatter=1


" coc.nvim 补全设置
" ==============================================================================

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes


" vim-coc配置
" ==============================================================================
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


let g:coc_snippet_next = '<tab>'

"" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

"" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

"" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

"" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)"


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" airline配置
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.notexists = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" 顶部tab显示
let g:airline#extensions#tabline#enabled=1 
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_buffers = 1
" 显示branch
let g:airline#extensions#branch#enabled=1 
" 设置tabline分隔符
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
" 关闭状态显示空白符号计数 
let g:airline#extensions#whitespace#enabled = 0 
let g:airline#extensions#whitespace#symbol = '!'
" 设置airline主题
let g:airline_theme = 'solarized'

" 总是显示状态栏
set laststatus=2
""set statusline=%t\ %y\ format:\ %{&ff};\ [%c,%l]

" 防止特殊字符无法正常显示statusline
" set ambiwidth=double

" 设置tab键映射"
nmap <tab> :bn<CR>

" 缩进指示线  '┊'字体必须支持
let g:indentLine_char='┊'
let g:indentLine_enable=1

" 设置参考线颜色
let g:indentLine_color_term = 239 

" 开启/关闭对齐线
nmap <leader>i :IndentLinesToggle<CR>   
" 映射到ctrl+i键
" map <C-i> :IndentLinesToggle<CR>


" 映射<ESC>键
inoremap jk <ESC>


" NERDTree设置
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1

" 是否显示隐藏文件
let NERDTreeShowHidden=1

" 设置宽度
let NERDTreeWinSize=31

" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1

" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']

" 显示书签列表
let NERDTreeShowBookmarks=1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" NERDCommenter 使用方法
" 注释的时候自动加个空格
let g:NERDSpaceDelims=1

" ,cc 注释当前行和选中行  
" ,cn 没有发现和\cc有区别  
" ,c<空格> 如果被选区域有部分被注释，则对被选区域执行取消注释操作，其它情况执行反转注释操作  
" ,cm 对被选区域用一对注释符进行注释，前面的注释对每一行都会添加注释  
" ,ci 执行反转注释操作，选中区域注释部分取消注释，非注释部分添加注释  
" ,cs 添加性感的注释，代码开头介绍部分通常使用该注释  
" ,cy 添加注释，并复制被添加注释的部分  
" ,c$ 注释当前光标到改行结尾的内容  
" ,cA 跳转到该行结尾添加注释，并进入编辑模式  
" ,ca 转换注释的方式，比如： /**/和//  
" ,cl \cb 左对齐和左右对其，左右对其主要针对/**/  
" ,cu 取消注释  

" 设置clang-format 定义源代码格式化
" 退出插入模式是自动格式化
let g:clang_format#auto_format_on_insert_leave = 0
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 0
" 这样当编辑*.c,*.h,*.cc,*.cpp时，会自动格式化，也可以是使用ctrl+f格式化一行或者选中的区域
map <C-K> :py3f ~/sbin/clang-format.py<cr>
imap <C-k> <c-o>:py3f ~/sbin/clang-format.py<cr>
function Formatonsave()
    let l:formatdiff = 1
    py3f ~/sbin/clang-format.py
endfunction
autocmd BufWritePre *.c,*.h,*.cc,*.cpp call Formatonsave()

" 自动格式化python文件
let g:formatter_yapf_style = 'autopep8'
autocmd BufWrite *.py :Autoformat

" 设置ale
" 始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"let g:ale_change_sign_column_color = 1
let g:ale_change_sign_column_color = 0

@wen  " 设置列颜色
@wen  highlight ALESignColumnWithoutErrors ctermfg=10 ctermbg=0
@wen  highlight ALESignColumnWithErrors ctermfg=10 ctermbg=0
" 设置列颜色
"highlight ALESignColumnWithoutErrors ctermfg=15 ctermbg=0
"highlight ALESignColumnWithErrors ctermfg=15 ctermbg=0

" 设置error和warning图标颜色
highlight ALEErrorSign ctermfg=1 ctermbg=0
highlight ALEWarningSign ctermfg=5 ctermbg=0

" 自定义error和warning图标
" let g:ale_sign_error = 'x'
" let g:ale_sign_warning = '>'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '►'

" 在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '► %d', '✔ OK']

" 显示Linter名称,出错或警告等相关信息
" let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 1
" let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_list_window_size = 5

" 普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)

" <Leader>s触发/关闭语法
nmap <Leader>s :ALEToggle<CR>

" <Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

" 设置状态栏显示的内容
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %{ALEGetStatusLine()}

" 文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'

" 打开文件时不进行检查
let g:ale_lint_on_enter = 0

" 使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = { 
      \ 'c++': ['clang'], 
      \ 'c': ['clang'], 
      \} 


" Auto Pair设置
" -------------------------------------------------------------
"设置要自动配对的符号
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}

"添加要自动配对的符号<>
""let g:AutoPairs['<']='>'

"设置要自动配对的符号，默认为g:AutoPairs，可以通过自动命令来对不同文件类型设置不同自动匹配对符号。
let b:AutoPairs = g:AutoPairs

"设置插件打开/关闭的快捷键，默认为ALT+p。
let g:AutoPairsShortcutToggle = 'p'

"设置自动为文本添加圆括号的快捷键，默认为ALT+e。
let g:AutoPairsShortcutFastWrap = 'e'

"设置调到下一层括号对的快捷键，默认为ALT+n。
let g:AutoPairsShortcutJump = 'n'

"设置撤销飞行模式的快捷键，默认为ALT+b。
let g:AutoPairsShortcutBackInsert = 'b'

"把BACKSPACE键映射为删除括号对和引号，默认为1。
let g:AutoPairsMapBS = 1

"把ctrl+h键映射为删除括号对和引号，默认为1。
let g:AutoPairsMapCh = 1

"把ENTER键映射为换行并缩进，默认为1。
let g:AutoPairsMapCR = 1

"当g:AutoPairsMapCR为1时，且文本位于窗口底部时，自动移到窗口中间。
let g:AutoPairsCenterLine = 1

"把SPACE键映射为在括号两侧添加空格，默认为1。
let g:AutoPairsMapSpace = 1

"启用飞行模式，默认为0。
let g:AutoPairsFlyMode = 0

"启用跳出多行括号对，默认为1，为0则只能跳出同一行的括号。
let g:AutoPairsMultilineClose = 0

" When the filetype is FILETYPE then make AutoPairs only match for parenthesis
" 自定义文件类型
" au Filetype FILETYPE let b:AutoPairs = {"(": ")"}
au FileType php        let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})
au FileType html       let b:AutoPairs = AutoPairsDefine({'<':'>'})
au FileType markdown   let b:AutoPairs = AutoPairsDefine({'```':'```//n','<!--':'-->'})


" vim-template 自定义目录
" ==============================================================================
let g:templates_directory = '/home/wen/.vim/templates'
let g:templates_user_variables = [['MY_EMAIL','GetEmail'],]

function GetEmail()
    return '1175445093@qq.com'
endfunction

" 设置中文
" multi-encoding setting
if has("multi_byte")

" set bomb
set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latin1
" CJK environment detection and corresponding setting
if v:lang =~ "^zh_CN"
" Use cp936 to support GBK, euc-cn == gb2312
set encoding=cp936
set termencoding=cp936
set fileencoding=cp936
elseif v:lang =~ "^zh_TW"
" cp950, big5 or euc-tw
" Are they equal to each other?
set encoding=big5
set termencoding=big5
set fileencoding=big5
elseif v:lang =~ "^ko"
" Copied from someone's dotfile, untested
set encoding=euc-kr
set termencoding=euc-kr
set fileencoding=euc-kr
elseif v:lang =~ "^ja_JP"
" Copied from someone's dotfile, untested
set encoding=euc-jp
set termencoding=euc-jp
set fileencoding=euc-jp
endif
" Detect UTF-8 locale, and replace CJK setting if needed
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
endif
else
echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif

" hilight function name
autocmd BufNewFile,BufRead * :syntax match MyFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
autocmd BufNewFile,BufRead * :syntax match MyFunctions "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi MyFunctions ctermfg=2             cterm=none

" 高亮当前行号
hi CursorLineNr cterm=bold ctermfg=255 ctermbg=24 gui=none guifg=white guibg=#2aa198
" 设置当前行号颜色
hi LineNr ctermfg=240 ctermbg=none gui=none guifg=#657b83 guibg=#002B36
" 设置光标颜色
hi Cursor ctermfg=15 ctermbg=2 guifg=white guibg=cyan

set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
""hi Cursor ctermfg=15 ctermbg=2 guifg=#002b36 guibg=#839496
" 修改显示行号那一列颜色

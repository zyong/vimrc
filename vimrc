"*******************************************
"全局条件
"*******************************************
"设定操作系统
if has("win32") || has("win64") || has("win32unix")
    let g:isWin = 1
    let $VIMFILES = $VIM.'/vimfiles'
else
    let g:isWin = 0
    let $VIMFILES = $HOME.'/.vim'
endif


"*******************************************
"常规
"*******************************************

"文件编码
"set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk
set fileencoding=utf-8
"文件类型识别,添加相关类型的插件和缩进脚本
"filetype on
"filetype plugin on
filetype plugin indent on
"设置文件格式
set fileformat=unix
set fileformats=unix
"设置shell
if g:isWin == 0
    set shell=bash
endif
"会话设置
set sessionoptions+=slash,unix 
"关闭兼容模式
set nocompatible
"外部修改时自动读取
set autoread
"设置鼠标
set mouse=a
"设置历史
set history=200
"语法高亮
syntax enable
"查找结果高亮
set hlsearch
" 超过当前行长度的行会回绕
set wrap

"行号设置
set nu
"智能缩进，ts tabstop 转换tab键为空格来显示，主要用于屏幕显示和打印, 
"如果页面全部用的tab，在tabstop=4和tabstop=8的地方页面显示的宽度是不同的
"sts softtabstop 在编辑的时候转换tab为空格的数量，需要和expandtab一起用
"et expandtab 在插入模式里插入tab时使用合适数量的空格代替
"sw shiftwidth 自动缩进每一步时使用的空白数目
set ai ts=4 sts=4 et sw=4
"设置色彩方案
if has("gui_running")
    colorscheme desertEx
else
    colorscheme desert
endif

"改变vim扫描标签的规则
"vim缺省的补全顺序是 ".,w,b,u,t,i"，它意味着扫描:
"1. 当前缓冲区 . 
"2. 其它窗口的缓冲区 window??
"3. 其它载入的缓冲区 b ... 
set cpt=.,w,b

"自动保存文件 autowrite
set aw

"搜索时忽略大小写
set ignorecase
"set ic

"增强命令行补全, type :h and press <Tab> to look what happens
set wildmenu

" 允许在未保存的情况下切换缓存
set hid

" 报告行为发生后改变的行数
set report=0

" 当光标移动时显示的最小数量的屏幕行数
set scrolloff=10 

" 设置响铃和闪屏
set novisualbell t_vb=

" 设置错误响
set noerrorbells

"加载系统特定的脚本
"source $VIMRUNTIME/vimrc_example.vim
if g:isWin == 1
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>


set ambiwidth=double
set smarttab
set backspace=2
set textwidth=0

"解决补全下无法使用tab问题
map! <c-tab> <tab>

"设置不备份
set nobackup
"设置打开文件的编码
"设置文件打开时的编码猜测列表
"set fencs=utf-8,gb18030,utf-16,big5
"设置大于603版本时的帮助语言
if version >= 603
    set helplang=cn
endif


let mapleader=","

" 重启后撤销历史可用 persistent undo 
set undofile
set undodir=$VIMFILES/\_undodir
set undolevels=100 "maximum number of changes that can be undone

" Ctrl-C的复制
vmap <C-C> "+y
imap <C-C> "+y
map <C-C> "+y
vmap <C-Insert> "+y

" Ctrl-V的粘贴
" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>		"+gP

cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']


"nmap <C-v> "+gP
"vmap <C-v> d"+gP<cr>
"imap <C-v> <esc>"+gP
"map <C-v> "+gP
"map <C-V> "+gP
"map <S-Insert> "+gP
"cmap <C-V>  <C-R>+
"cmap <S-Insert> <C-R>+
"exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
"exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
"imap <S-Insert>  <C-V>
"vmap <S-Insert>  <C-V>


" 内容全选快捷键
map <C-a> gg0vG$<cr>

" 设置tags
set tags+=./tags

" 设置取消swapfile
"set noswapfile

"*******************************
"设置Tlist
"*******************************
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Process_File_Always=0 "是否一直处理tags.1:处理;0:不处理。不是一直实时更新tags，因为没有必要
let Tlist_Show_One_File=1
" 如果 taglist 窗口是最后一个窗口，则退出 vim
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_Menu=1
let Tlist_WinHeight=25
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1
"tasklist
"map T :TaskList<CR>
nmap <silent> <F4> :TlistToggle<CR>


"*******************************
" 设置Winmanager
"*******************************

"WinManager
"let g:winManagerWindowLayout='NERDTree|TagList'
"let g:winManagerWindowLayout = 'NERDTree'
""设置winmanager的宽度，默认为25
"let g:winManagerWidth = 30
"nmap <F8> :WMToggle<cr>
"let g:AutoOpenWinManager = 1 


"*******************************
"  设置MiniBufExplorer
"*******************************
"let g:miniBufExplMapWindowNavVim = 1 
"let g:miniBufExplMapWindowNavArrows = 1 
"let g:miniBufExplMapCTabSwitchBufs = 1 
"let g:miniBufExplModSelTarget = 1
"map! <c-tab> :bn<cr>
map! <c-s-tab> :bp<cr>
" miniBuf always show
"let g:miniBufExplorerMoreThanOne=0


"*****************************
" BufExplorer
"*****************************

"let g:bufExplorerDefaultHelp=0       " Do not show default help.
"let g:bufExplorerShowRelativePath=1  " Show relative paths.
"let g:bufExplorerSortBy='mru'        " Sort by most recently used.
"let g:bufExplorerSplitRight=0        " Split left.
"let g:bufExplorerSplitVertical=1     " Split vertically.
"let g:bufExplorerSplitVertSize = 30  " Split width
"let g:bufExplorerUseCurrentWindow=1  " Open in new window.
"autocmd BufWinEnter \[Buf\ List\] setl nonumber 

"*****************************
" set Grep
"*****************************
if g:isWin == 1
    let Grep_Path = 'D:/GnuWin32/bin/grep.exe'
    let FGrep_Path = 'D:/GnuWin32/bin/fgrep.exe'
    let EGrep_Path = 'D:/GnuWin32/bin/egrep.exe'
endif
    
nnoremap <silent> <F3> :Grep<cr>


" *******************
" NERDTree set
" *******************

" set NERDTree curent dir
if g:isWin == 1
   cd d:\
else
   cd /home/zhaoyong
endif

" 切换到当前目录
"map <leader>cd :cd %:p:h<cr>

let g:NERDTree_title = "[NERD Tree]"
let NERDTreeShowBookmarks=1 "一直显示书签
let NERDTreeChDirMode=2 "打开书签时，自动将Vim的pwd设为打开的目录，如果你的项目有tags文件，你会发现这个命令很有帮助

function! NERDTree_Start()
    exe 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction 

nmap <silent> <F2> :NERDTreeToggle<CR>

"nmap <F4> :NERDTree  <CR>


" *******************
" FuzzyFinder
" *******************
let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 400
let g:fuf_mrucmd_maxItem = 400
let g:fuf_keyOpen = '<CR>'
let g:fuf_keyOpenSplit = '<C-j>'
let g:fuf_keyOpenTabpage = '<C-l>'
let g:fuf_dataDir = $VIMFILES . "/fuf_data"

"Key map for FuzzyFinder                                                       
let mapleader=","
map <leader>ff :FufFile<cr>
map <leader>fb :FufBuffer<cr>

" *******************
" php languange set "
" *******************

" set php document
fun! SetPhp()
    if &filetype=="php"
        if g:isWin == 1
            set runtimepath+=d:\program\ Files\Vim\php_doc
        else
            set runtimepath+=/home/zhaoyong/.vim/php_doc
        endif
    endif
    "autocmd BufWritePost *.php :!php -l % <CR>
endfun
autocmd BufRead,BufNewFILe *.php,*.phtml call SetPhp()
 

" *******************
" python language set 
" *******************
fun! SetPython()
    if g:isWin==1
        " set python document
        let g:pyref_python = 'D:\program files\Vim\python-html'
        "Pydiction
        let g:pydiction_location='D:\Program Files\Vim\vim73\ftplugin\pydiction\complete-dict'
    else
        let g:pyref_python = '/home/zhaoyong/.vim/python-html'
        let g:pydiction_location='/home/zhaoyong/.vim/pydiction/complete-dict'
    endif
    if &filetype=="python" 
        " exec python
        map <F6> :!python %

        " pythoncomplete c-x c-o

    endif
endfun
autocmd BufRead,BufNewFILe *.py call SetPython()

" *******************
" c/c++ language set 
" *******************
fun! SetCLang()
    if &filetype=="c" || &filetype=="cpp"
        set tags+=$VIMFILES/libstdc++/tags

        " omnicomplete plugin
        let OmniCpp_NamespaceSearch = 1
        let OmniCpp_GlobalScopeSearch = 1
        let OmniCpp_ShowAccess = 1
        let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
        let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
        let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
        let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
        let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
        " 自动关闭补全窗口
        au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        set completeopt=menuone,menu,longest"
    endif
    if &filetype == 'c' || &filetype == 'cpp'
        inoremap [ []<esc>:let leavechar="]"<cr>i
        inoremap { {<esc>o}<esc>:let leavechar="}"<cr>O
        inoremap { {}<esc>:let leavechar="}"<cr>i
        inoremap ( ()<esc>:let leavechar=")"<cr>i
        inoremap ' ''<esc>:let leavechar="'"<cr>i
        inoremap " ""<esc>:let leavechar='"'<cr>i
        "au BufNewFile,BufRead *.\(vim\)\@! inoremap " ""<esc>:let leavechar='"'<cr>i
        "au BufNewFile,BufRead *.\(txt\)\@! inoremap ' ''<esc>:let leavechar="'"<cr>i
        "imap <m-l> <esc>:exec "normal f" . leavechar<cr>a
        "imap <d-l> <esc>:exec "normal f" . leavechar<cr>
    endif
endfun
autocmd BufRead,BufNewFILe *.c,*.h,*.cpp call SetCLang()

" *******************
" plugin gdb 
" *******************
"run macros/gdb_mappings.vim


" *******************
" plugin MRU
" manage recently used files
" *******************
if g:isWin == 1
    let MRU_File = 'd:\myhome\_vim_mru_files'
else
    let MRU_File = '/home/zhaoyong/.vim/mru_files'
endif

" *******************
" SVN set
" *******************
"更新当前目录的代码
"map <F6>    :!svn up <cr>
"提交SVN(当前目录)
"map <F7>    :!svn ci -m "" 
"提交SVN(当前文件)
"map <F8>    :!svn ci -m "" %


" *******************
" supertab set
" *******************
"let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"


" syntax highlight function
function! ToggleSyntax()
    if exists("g:syntax_on")
        syntax off
    else
        syntax enable
    endif
endfunction

" 快速编辑vimrc文件的快捷键
if g:isWin == 1
    map <silent> <leader>e :e d:\program files\vim\_vimrc<cr>
    " 当vimrc已经保存后重载vimrc
    autocmd! bufwritepost *.vimrc source d:\program files\vim\_vimrc
else
    map <silent> <leader>e :e ~/.vimrc<cr>
    " 当vimrc已经保存后重载vimrc
    autocmd! bufwritepost *.vimrc source ~/.vimrc
endif

" 设置当前工作目录为buf文件的目录
autocmd BufEnter * lcd %:p:h


" 在vim退出前自动保存session
"if g:isWin == 0
    "let s:path='/home/zhaoyong/.vim/Session.vim'
"else
    "let s:path='d:\program files\vim\Session.vim'
"endif

if g:isWin == 0 && has("gui_running")
    " 当退出vim时候关闭minibuf,NERDTree,Tlist
    "autocmd VimLeave * \mbt
    autocmd VimLeave * NERDTreeClose
    autocmd VimLeave * TlistClose
    " 保存会话
    "autocmd VimLeave * exe "mksession! " . s:path
"    " 启动自动加载会话
    "autocmd VimEnter * exe "source " . s:path
endif

" show the correct man help info
if has("gui_running")
    runtime ftplugin/man.vim
    nmap K :Man <cword><cr>
endif

" 使用CTRL+w 关闭当前缓存
"map <silent> <C-W> <C-k> d <cr> <C-j>
" 新建一个标签
map <silent> <C-N> :tabnew<cr>

" 新建一个tab页
"map <silent> <C-t> :tabnew<cr>
map <leader>n :tabn<cr>
map <leader>p :tabp<cr>

map  <C-S> :w<cr>
imap  <C-S> <esc>:w<cr>

" 启动时最大化窗口
"au GUIEnter * simalt ~x
autocmd GUIEnter * winpos 0 0 | set lines=999 columns=9999

" 关闭当前的buf
map <silent> qq :bd<cr>

" 清理搜索高亮
map <silent> nhl /axkexiej<cr>

" 注释的映射键
map <silent> <leader>l :call NERDComment(0, "toggle")<cr> 
map <silent> <leader>k :call NERDComment(0, "sexy")<cr> 

" 映射 第一行和最后一行
map <silent> <leader>1 1G
map <silent> <leader>g GG

" 括号自动补全
" map auto complete
"inoremap ( ()<esc>:let leavechar=")"<cr>i

" 设置状态行
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]
set laststatus=2

" 高亮显示光标所在行
"set cursorline
set nocul

" toggle菜单和工具条
map <silent> <C-F2> :if &guioptions =~# 'T' <Bar>
                        \set guioptions-=T <Bar>
                        \set guioptions-=m <Bar>
                    \else <Bar>
                        \set guioptions+=T <Bar>
                        \set guioptions+=m <Bar>
                    \endif<CR>
                
" 设置tab短标签名
function! ShortTabLabel()
    let bufnrlist = tabpagebuflist(v:lnum)
    " show only the first 6 letters of the name + ..
    let label = bufname(bufnrlist[tabpagewinnr(v:lnum) – 1])
    let filename = fnamemodify(label,':h')
    " only add .. if string is more than 8 letters
    if strlen(filename) >=8
        let ret=filename[0:5].'..'
    else
        let ret = filename
    endif
    return ret
endfunction

" 简单实现鼠标提示功能
function! SimpleBallon()
    return 'Cursor is at line/column: ' . v:beval_lnum . 
        \'/' . v:beval_col .
        \ ' in file ' . bufname(v:beval_bufnr) .
        \ '. word under cursor is: "' . v:beval_text . '"'
endfunction
"set balloonexpr=SimpleBallon()
"set ballooneval


" cscope
map <F12> :call Do_CsTag()<CR>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
function! Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(g:isWin==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:isWin==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:isWin==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        "silent! execute "!ctags -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        if(g:isWin!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        else
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction

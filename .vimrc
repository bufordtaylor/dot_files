" Sexy vim configs with pathogen
"filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"filetype plugin indent on

set nocompatible                      " just in case system-wide vimrc has set this otherwise
set modelines=0                       " close security exploit by having modelines in files http://lists.alioth.debian.org/pipermail/pkg-vim-maintainers/2007-June/004020.html
set backspace=indent,start,eol        " allow unrestricted backspacing in insert mode
set t_Co=256                          " use 256 colors in gnome terminal
set ic                                " ignore case in search
set hlsearch                          " highlight search strings
set incsearch                         " incremental search ("find as you type")
set ignorecase                        " ignore case when searching
set smartcase                         " except when search string includes a capital letter
" remap / to /v to alleviate vim's built in regex handling
"nnoremap / /\v
"vnoremap / /\v
set number                            " show line numbers in gutter
set laststatus=2                      " always show status line
set ww=h,l,<,>,[,]                    " allow h/l/left/right to cross line boundaries
set autoread                          " if not changed in Vim, automatically pick up changes after "git co" etc
set guioptions-=T                     " don't show toolbar
set guioptions-=r
set guifont=Monaco:h12
set hidden                            " allows you to hide buffers with unsaved changes without being prompted
set wildmenu                          " show options as list when switching buffers etc
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class
set wildignore+=*.o,.git              " patterns to ignore during file-navigation
set wildmode=longest:full,full        " shell-like autocomplete to unambiguous portion set wildmode=list:full
set history=1000                      " longer search and command history (default is 20)
set scrolloff=5                       " start scrolling 5 lines before edge of viewport
set sidescrolloff=5                   " same, but for columns
set backupdir=~/.vim/sessions,.       " keep backup files out of the way
set dir=~/.vim/sessions,.             " keep swap files out of the way

" save on losing focus
au FocusLost * :wa

set ttimeoutlen=50                    " speed up O etc in the Terminal
set virtualedit=block                 " allow cursor to move where there is no text in visual block mode
set showmatch                         " show matching brackets
set showcmd                           " extra info in command line
set showmode
set nojoinspaces                      " don't autoinsert two spaces after '.', '?', '!' for join command
set shortmess+=A                      " ignore annoying swapfile messages
set shortmess+=I                      " no splash screen
set foldmethod=indent                 " not as cool as syntax, but faster
set foldlevelstart=99                 " start with some but not all folds closed
set foldlevel=99
set foldenable
set mouse=a                           " Mouse everywhere
set mousehide                         " Hide mouse pointer while typing
set mousemodel=popup
" Better modes.  Remeber where we are, support yankring
set viminfo=!,'100,\"100,:20,<50,s10,h,n~/.viminfo
set noswapfile                        " Turn off annoying swapfiles

" Enable Syntax Colors
syntax on

" This must happen before the syntax system is enabled
" aunmenu Help.
" aunmenu Window.
let no_buffers_menu=1

" Make mouse middle click paste without formatting it.
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized


" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

" Set <leader> to ',' and <localleader> to "\"
let mapleader=","
let maplocalleader="\\"

"quick ack access
nnoremap <leader>a :Ack

"noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>, <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>

noremap <leader>m <Esc>:marks<CR>

" <leader>dd to delete buffer
noremap <leader>dd <Esc>:bd<CR>
vnoremap <leader>dd <Esc>:bd<CR>

" Toggle pate with <F3>
set pastetoggle=<F3>

"  tab settings
" ctrl-t makes a new tab
noremap <C-t> <Esc>:tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>
nnoremap <C-t> <Esc>:tabnew<CR>
vnoremap <C-t> <Esc>:tabnew<CR>

" shift T turns a split window into it's own tab
noremap <S-T> <Esc><C-w>T
nnoremap <S-T> <Esc><C-w>T

" ctrl h and l moves left and right between tabs
noremap <C-h> <Esc>gT<CR>
inoremap <C-h> <Esc>gT<CR>
nnoremap <C-h> <Esc>gT<CR>
vnoremap <C-h> <Esc>gT<CR>
noremap <C-l> <Esc>gt<CR>
inoremap <C-l> <Esc>gt<CR>
nnoremap <C-l> <Esc>gt<CR>
vnoremap <C-l> <Esc>gt<CR>

" Left/Right arrow keys change buffers in all modes
noremap <Left> <Esc>:bp<CR>
inoremap <Left> <Esc>:bp<CR>
nnoremap <Left> <Esc>:bp<CR>
vnoremap <Left> <Esc>:bp<CR>
noremap <Right> <Esc>:bn<CR>
inoremap <Right> <Esc>:bn<CR>
nnoremap <Right> <Esc>:bn<CR>
vnoremap <Right> <Esc>:bn<CR>

nnoremap j gj
nnoremap k gk

" Disable up/down arrow keys so you learn, damn it
noremap <up> <nop>
noremap <down> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

" Rempam Vim 0 to ^
noremap 0 ^

" Remember cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" highlight bad whitespace
autocmd BufReadPost * match BadWhitespace /\s\+$/
autocmd InsertEnter * match BadWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match BadWhitespace /\s\+$/
highlight BadWhitespace ctermbg=1

" Enable automatic title setting for terminals
set title
set titleold="Terminal"
set titlestring=%F\ -\ Vim

" Enable filetype plugins and indention
filetype on
filetype plugin on

" Activate a permanent ruler
set ruler

" Disable Toolbar, Scrollbar
set guioptions-=T
set guioptions-=r

" Disable the stupid pydoc preview window for the omni completion
set completeopt-=preview

" Disable the blinking cursor.
set gcr=a:blinkon0

set ttyfast
set clipboard+=unnamed

" Go with smartindent if there is no plugin indent file.
set autoindent  smartindent
" But don't outdent hashes
inoremap # X#

" Global by default
set gdefault

" Hide matches on <leader>space
nnoremap <leader><space> :noh<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>
" uncomment to do this automatically for py files
"autocmd BufWritePre *.py :%s/\s\+$//e

" <leader>v selects the just pasted text
nnoremap <leader>v V`]

nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Copy/Paste to and from Desktop Environment
noremap <leader>yy "+y
noremap <leader>pp "+gP

"" easy escape with jj
inoremap jj <ESC>

" Quit window on <leader>q
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" NERDtree on <leader>t
nnoremap <leader>t :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

" Make the command line two lines high and change the statusline display to
" something that looks useful.
set cmdheight=2
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
set statusline=[%l,%v\ %P%M][CWD:\ %{CWD()}][FILE:\ %f]\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}\ %#warningmsg#%{SyntasticStatuslineFlag()}%*

" statusline
" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer
"   %) end of width specification
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

function! CWD()
    let curdir = substitute(getcwd(), '/home/mnazim', "~/", "g")
    return curdir
endfunction

" Tab Settings
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Tagbar
let g:tagbar_usearrows = 1
let g:tagbar_ctags_bin='/usr/local/Cellar/ctags/5.8/bin/ctags'
nnoremap <leader>l :TagbarToggle<CR>

" GUI Tab settings
function! GuiTabLabel()
  let label = ''
  let buflist = tabpagebuflist(v:lnum)
  if exists('t:title')
    let label .= t:title . ' '
  endif
  let label .= '[' . bufname(buflist[tabpagewinnr(v:lnum) - 1]) . ']'
  for bufnr in buflist
    if getbufvar(bufnr, '&modified')
      let label .= '+'
      break
    endif
  endfor
  return label
endfunction
set guitablabel=%{GuiTabLabel()}

" utf-8 default encoding
set enc=utf-8

" Prefer unix over windows over os9 formats
set fileformats=unix,dos,mac

" Don't bell or blink(Courtesy: Cream Editor).
if has('autocmd')
  autocmd GUIEnter * set vb t_vb=
endif


" hide some files and remove help
let g:netrw_list_hide='^\.,.\(pyc\|pyo\|o\)$'

" Split window management
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>W <C-w>s
nnoremap <leader>n :new<CR>

nnoremap <leader>s :w<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

nnoremap <C-i>oimport ipdb; ipdb.set_trace()<Esc>

" ; is an alias for :
nnoremap ; :

" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
autocmd FileType * setlocal colorcolumn=0

" python support
" --------------
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 colorcolumn=79
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" ruby support
" ------------
autocmd FileType ruby setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=79

" template language support (SGML / XML too)
" ------------------------------------------
" disable html rendering

fun! SelectHTML()
  let n = 1
  while n < 50 && n < line("$")
    " check for jinja
    if getline(n) =~ '{%\s*\(extends\|block\|macro\|set\|if\|for\|include\|trans\)\>'
      set ft=htmljinja
      return
    endif
    " check for mako
    if getline(n) =~ '<%\(def\|inherit\)'
      set ft=mako
      return
    endif
    " check for genshi
    if getline(n) =~ 'xmlns:py\|py:\(match\|for\|if\|def\|strip\|xmlns\)'
      set ft=genshi
      return
    endif
    let n = n + 1
  endwhile
  " go with html
  set ft=html
endfun

autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd BufNewFile,BufRead *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead *.mako setlocal ft=mako
autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
autocmd BufNewFile,BufRead *.html,*.htm  call SelectHTML()
let html_no_rendering=1

autocmd FileType html,htmldjango,htmljinja,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

" CSS
" ---
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" rst
" ---
autocmd BufNewFile,BufRead *.rst setlocal ft=rst
autocmd FileType rst setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=79
\ formatoptions+=nqt textwidth=74

" markdown
" ---
autocmd BufNewFile,BufRead *.txt,*.markdown,*.md setlocal ft=markdown colorcolumn=79
autocmd FileType rst setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=79

" vim
" ---
autocmd FileType vim setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" Javascript
" ----------
autocmd FileType javascript setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 colorcolumn=79
let javascript_enable_domhtmlcss=1


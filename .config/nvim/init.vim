" Key Remapping
imap jk <Esc>
nnoremap tn  :tabnew<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tc  :tabclose<CR>
let mapleader =','

"Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" Color Schemes
Plug 'flazz/vim-colorschemes'
Plug 'joshdick/onedark.vim'

" NERDTree
Plug 'scrooloose/nerdtree'
map <silent> <C-e> :NERDTreeToggle<CR> :NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" " AutoCompleteRelated
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" ES2015 code snippets (Optional)
Plug 'epilande/vim-es2015-snippets'
" React code snippets
Plug 'epilande/vim-react-snippets'

let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>
nnoremap <c-i> :Ag<cr>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
      \                         : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
      \                 <bang>0)

" EasyMotion
Plug 'easymotion/vim-easymotion'

" Fugitive
Plug 'tpope/vim-fugitive'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
set laststatus=2
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

" DelemitMate
Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" GitGutter
Plug 'airblade/vim-gitgutter'

" Code Formatter
Plug 'Chiel92/vim-autoformat'
nnoremap <Leader><Leader>a :Autoformat<cr>

" Plugins for Javascript
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim'
Plug 'mattn/emmet-vim'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'ap/vim-css-color'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" JSX
let g:jsx_ext_required = 0
let g:user_emmet_settings = {
      \  'javascript' : {
      \      'extends' : 'jsx',
      \  },
      \}

" Trailing Space
Plug 'bronson/vim-trailing-whitespace'
" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

" MultiCursor
Plug 'terryma/vim-multiple-cursors'

" MultiCursor is conflicting with deoplete
func! Multiple_cursors_before()
    call deoplete#init#_disable()
endfunc
func! Multiple_cursors_after()
    call deoplete#init#_enable()
endfunc

" ESLint
Plug 'w0rp/ale'
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0


" Plugins for Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" Plugins for Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

" All of your Plugins must be added before the following line
call plug#end()

" Color
set t_Co=256
syntax on
set background=dark
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE

" Line Numbers
set relativenumber
set number

" Clipboard
set clipboard=unnamed

" Make backspace work
set backspace=2

" Maps space to colon, time saver
nmap <space> :

" Indentation
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set ignorecase

" Vim can highlight whitespaces for you in a convenient way:
set list
set listchars=tab:>_,trail:.,extends:#,nbsp:.

" Nav to the lastly used tab
let g:lasttab = 1
nmap tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Undo buffer
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif

" Allows for mouse scrolling
set mouse=a

" Highlight Current Line/Columhn
set cursorline
hi CursorLine   cterm=NONE ctermbg=DarkGray
set cursorcolumn

" Highlight All Search Pattern
set hlsearch

" Javascript syntax fix
autocmd BufRead *.jsx set syntax=javascript

" Split remapping
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Swp file handling
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//


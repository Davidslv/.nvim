"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Dein Package Manager
"

" Required:
set runtimepath^=~/.config/nvim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('.'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/deoplete.nvim')

call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimfiler')

call dein#add('mhartington/oceanic-next')
call dein#add('powerline/powerline')

call dein#add('mileszs/ack.vim')
call dein#add('ctrlpvim/ctrlp.vim')


call dein#add('vim-scripts/file-line')
call dein#add('tpope/vim-fugitive.git')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-surround')
call dein#add('scrooloose/syntastic')
call dein#add('godlygeek/tabular')

call dein#add('vim-ruby/vim-ruby')
call dein#add('tpope/vim-rails')
call dein#add('tpope/vim-endwise')
call dein#add('ecomba/vim-ruby-refactoring')
call dein#add('tmhedberg/matchit')
call dein#add('thoughtbot/vim-rspec')

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup
"

"  Show when lines extend past column 80

highlight ColorColumn ctermfg=208 ctermbg=Black

function! MarkMargin (on)
    if exists('b:MarkMargin')
        try
            call matchdelete(b:MarkMargin)
        catch /./
        endtry
        unlet b:MarkMargin
    endif
    if a:on
        let b:MarkMargin = matchadd('ColorColumn', '\%81v\s*\S', 100)
    endif
endfunction

augroup MarkMargin
    autocmd!
    autocmd  BufEnter  *       :call MarkMargin(1)
    autocmd  BufEnter  *.vp*   :call MarkMargin(0)
augroup END


let mapleader= "\\"

set history=500                " Number of things to remember in history.
set timeoutlen=250             " Time to wait after ESC (default causes an annoying delay
set autoread                   " If the file is saved in another editor, it reloads

" Match and search
set hlsearch                   " highlight matches
set incsearch                  " incremental searching
set ignorecase                 " searches are case insensitive...
set smartcase                  " ... unless they contain at least one capital letter
set magic


" Formatting
set encoding=utf-8
set wildmode=longest,list       " At command line, complete longest common string, then list alternatives.
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set softtabstop=2
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

syntax on                      " enable syntax
filetype plugin indent on      " Automatically detect file types.


" Visual
set number                     " Line numbers off
set showmatch                  " Show matching brackets.
set matchtime=5                " Bracket blinking.
set visualbell                 " No blinking
set noerrorbells               " No noise.
set laststatus=2               " Always show status line.

set ruler                      " Shows column,line of the cursor
set showcmd                    " Display an incomplete command in the lower right corner of the Vim window

set splitbelow
set splitright

 " Theme
 syntax enable
 let $NVIM_TUI_ENABLE_TRUE_COLOR=1
 colorscheme OceanicNext
 set background=dark



" Turn On
call deoplete#enable()

autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd CompleteDone * pclose " To close preview window of deoplete automagically


""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands
"
com! FormatJSON %!python -m json.tool

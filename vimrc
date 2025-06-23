" Basic Settings
set nu rnu
syntax on

set t_Co=256
set mouse=a

colo habamax
set guifont=Iosevka_Extended:h14:cANSI:qDRAFT
set shortmess+=I

set directory^=$HOME/.vim/swapfiles//

function! SpamRandomString(max_len)
  call srand()
  let chars = split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', '\zs')
  let output = ''
  for i in range(0, a:max_len - 1)
    let output = output . chars[rand() % len(chars)]
  endfor
  echo output
endfunction

" Spam Greeting
autocmd VimEnter * call SpamRandomString(5 + rand() % 25)

" Editor Settings
set tabstop=3
set shiftwidth=3
set expandtab
set smartindent

set scrolloff=3
set textwidth=80
"set colorcolumn=+1
set formatoptions+=t
set wildmenu
set incsearch
set hlsearch

" Keymap Settings
let g:mapleader = " "
nnoremap <leader>n :tabnew<CR>
nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabNext<CR>
nnoremap <leader>H :tabm-1<CR>
nnoremap <leader>L :tabm+1<CR>
nnoremap <leader>q :tabclose<CR>

nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>E :NERDTreeToggle %:h<CR>


" Plugins
call plug#begin()

Plug 'preservim/nerdtree'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

" LSP
let g:lsp_settings = {
\  'clangd': {
\    'cmd': ['clangd'],
\    'allowlist': ['c', 'cpp', 'objc', 'objcpp']
\  }
\}

let g:lsp_diagnostics_virtual_text_enabled = 0
nnoremap <leader>k :LspHover<CR>
nnoremap <leader>K :LspDocumentDiagnostics<CR>
nnoremap <leader>rn :LspRename<CR>
nnoremap <leader>ca :LspCodeAction<CR>

set completeopt=menuone,noinsert,noselect
let g:asyncomplete_auto_popup = 0
autocmd FileType cpp setlocal omnifunc=lsp#complete
autocmd FileType c   setlocal omnifunc=lsp#complete


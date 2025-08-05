call plug#begin()

Plug 'ellisonleao/gruvbox.nvim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

set background=dark
colorscheme gruvbox

let g:airline#extensions#tabline#enabled = 1
syntax enable
set cursorline
set showmatch
set linebreak
set ignorecase
set smartcase
set wildmode=longest,list,full
set number relativenumber
set tabstop=4
set shiftwidth=4
set t_Co=256
set foldmethod=indent
lua require'nvim-treesitter.configs'.setup{highlight={enable=true}}
let g:airline_theme='atomic'

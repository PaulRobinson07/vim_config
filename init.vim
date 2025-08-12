"initializes all of the plugins
"gruvbox is my colorscheme
"nerdtree is my file grabber
"vim airline and airline-themes are the bottom line for vim for style
"treesitter improves text highlighting for up to date code 
"neoclide coc is the autocomplete
call plug#begin()

Plug 'ellisonleao/gruvbox.nvim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'

call plug#end()

"colorscheme settings
set background=dark
colorscheme gruvbox

"changes the colors so the colors show up correctly
set t_Co=256

"sets up the popup for commands
lua require("noice").setup()

"sets the bottom of the screen color scheme
let g:airline_theme='atomic'

"turns on the airline theme
let g:airline#extensions#tabline#enabled = 1

"turns on advanced syntax highlighting with treesitter
lua require'nvim-treesitter.configs'.setup{highlight={enable=true}}

"enables telescope basic functions
nnoremap ff :Telescope find_files<CR>
nnoremap fg :Telescope live_grep<CR>
nnoremap fb :Telescope buffers<CR>
nnoremap fh :Telescope help_tags<CR>

"shows my cursor spot and highlights the line I'm on
set cursorline
set linebreak

"vim's built in autocompete for picking things that are open in other tabs or
"in the current directory
set showmatch
set ignorecase
set smartcase

"I think this is settings for the autocompete menu
set wildmode=longest,list,full

"basic number and productivity vim stuff
set number relativenumber
set tabstop=4
set shiftwidth=4

"turns on folding and unfolding with zo and zc respectively
"useful for longer files
set foldmethod=syntax

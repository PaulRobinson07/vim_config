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

"colorscheme setting
set background=dark
colorscheme gruvbox
set showmode

"changes the colors so the colors show up correctly
set t_Co=256

"sets up the popup for commands
lua require("noice").setup()

"sets the bottom of the screen color scheme
let g:airline_theme='base16_gruvbox_light_soft'

"turns on the airline theme
let g:airline#extensions#tabline#enabled = 1
"turns on advanced syntax highlighting with treesitter
lua require'nvim-treesitter.configs'.setup{highlight={enable=true}}

"enables telescope basic functions
nnoremap ff :Telescope find_files<CR>
nnoremap fg :Telescope live_grep<CR>
nnoremap fb :Telescope buffers<CR>
nnoremap fh :Telescope help_tags<CR>

" Load Lua code in vimrc for Noice customization
lua << EOF
  require("noice").setup({
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,        -- command-line search to bottom
      command_palette = true,      -- command palette layout
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
  })

  -- Apply Gruvbox-like highlights to Noice elements
  local hl = vim.api.nvim_set_hl
  hl(0, "NoiceCmdlinePopup",       { fg = "#ebdbb2", bg = "#3c3836" }) -- light text, dark bg
  hl(0, "NoiceCmdlinePopupBorder", { fg = "#fabd2f", bg = "#3c3836" }) -- yellow border
  hl(0, "NoiceCmdlineIcon",        { fg = "#83a598", bg = "#3c3836" }) -- blue-ish icon
  hl(0, "NoiceLspProgressTitle",   { fg = "#b8bb26", bg = "NONE", bold = true }) -- green title
  hl(0, "NoiceLspProgressClient",  { fg = "#d3869b", bg = "NONE" }) -- purple client
  hl(0, "NoiceLspProgressSpinner", { fg = "#fe8019", bg = "NONE" }) -- orange spinner
EOF

"shows my cursor spot and highlights the line I'm on
set cursorline
set linebreak
set colorcolumn=80

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
set foldmethod=indent

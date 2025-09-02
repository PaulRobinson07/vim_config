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
Plug 'chomosuke/typst-preview.nvim', {'tag': 'v1.*'}
Plug 'kaarmu/typst.vim'
Plug 'tribela/vim-transparent'

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

  --typst preview setup
  require 'typst-preview'.setup {
	  -- Setting this true will enable logging debug information to
	  -- `vim.fn.stdpath 'data' .. '/typst-preview/log.txt'`
	  debug = false,

	  -- Custom format string to open the output link provided with %s
	  -- Example: open_cmd = 'firefox %s -P typst-preview --class typst-preview'
	  open_cmd = nil,

	  -- Custom port to open the preview server. Default is random.
	  -- Example: port = 8000
	  port = 0,

	  -- Setting this to 'always' will invert black and white in the preview
	  -- Setting this to 'auto' will invert depending if the browser has enable
	  -- dark mode
	  -- Setting this to '{"rest": "<option>","image": "<option>"}' will apply
	  -- your choice of color inversion to images and everything else
	  -- separately.
	  invert_colors = 'never',

	  -- Whether the preview will follow the cursor in the source file
	  follow_cursor = true,

	  -- Provide the path to binaries for dependencies.
	  -- Setting this will skip the download of the binary by the plugin.
	  -- Warning: Be aware that your version might be older than the one
	  -- required.
	  dependencies_bin = {
		['tinymist'] = nil,
		['websocat'] = nil
	  },

	  -- A list of extra arguments (or nil) to be passed to previewer.
	  -- For example, extra_args = { "--input=ver=draft", "--ignore-system-fonts" }
	  extra_args = nil,

	  -- This function will be called to determine the root of the typst project
	  get_root = function(path_of_main_file)
		local root = os.getenv 'TYPST_ROOT'
		if root then
		  return root
		end
		return vim.fn.fnamemodify(path_of_main_file, ':p:h')
	  end,

	  -- This function will be called to determine the main file of the typst
	  -- project.
	  get_main_file = function(path_of_buffer)
		return path_of_buffer
	  end,
	}
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

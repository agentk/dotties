-- [[ Setting options ]]
-- See `:help vim.opt`
--  For more options, you can see `:help option-list`

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Enable 24 bit RGB color in the terminal
vim.opt.termguicolors = true

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Avante views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

-- Use spaces instead of tabs
vim.opt.expandtab = true
-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 4
-- Number of spaces that a <Tab> in the file counts for
vim.opt.tabstop = 4
-- Number of spaces that a <Tab> counts for while editing
vim.opt.softtabstop = 4
-- Insert tabs and spaces when using <Tab> in insert mode
vim.opt.smarttab = true
-- Do smart auto indenting when starting a new line
vim.opt.smartindent = true
-- Copy indent from current line when starting a new line
vim.opt.autoindent = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Set column indicators
-- vim.opt.colorcolumn = '80,132'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 500

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Enable spell check highlighting by default
vim.opt.spell = true
-- Use Australian English as primary and US English as backup for spell checking
vim.opt.spelllang = { 'en_au', 'en_us' }

-- Disable spell checking for certain filetypes
-- vim.api.nvim_create_autocmd('FileType', {
--   group = vim.api.nvim_create_augroup('disable-spell-check', { clear = true }),
--   pattern = {
--     'bash',
--     'c',
--     'cpp',
--     'css',
--     'dockerfile',
--     'go',
--     'html',
--     'javascript',
--     'json',
--     'jsonc',
--     'lua',
--     'make',
--     'scss',
--     'sh',
--     'sql',
--     'typescript',
--     'yaml',
--     'yml',
--   },
--   callback = function() vim.opt_local.spell = false end,
-- })

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Disable the command line until needed for a cleaner look
vim.opt.cmdheight = 0

-- Disable language providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('create-term-open', { clear = true }),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.spell = false
  end,
})

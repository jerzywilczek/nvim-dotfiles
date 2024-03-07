-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Make unwanted invisible characters visible
vim.o.list = true
vim.o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions in a separate buffer
vim.o.inccommand = 'split'

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Keep the cursor 8 lines above the bottom
vim.o.scrolloff = 8

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.termguicolors = true

-- Relative line numbers
vim.o.relativenumber = true

-- Use nushell by default
vim.o.shell = 'nu'

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local remove_trailing_whitespace_group = vim.api.nvim_create_augroup('RmTrWhitespace', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  group = remove_trailing_whitespace_group,
  pattern = '*',
  command = [[%s/\s\+$//e]],
})


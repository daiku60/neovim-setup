require 'core.options'
require 'core.keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup {
  require 'plugins.neotree',
  require 'plugins.themes.bamboo',
  require 'plugins.themes.nord',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.autoformatting',
  require 'plugins.gitsigns',
  require 'plugins.alpha',
  require 'plugins.indent-blankline',
  require 'plugins.misc',
  require 'plugins.debug',
  require 'plugins.lazygit',
  require 'plugins.neoscroll',
  require 'plugins.obsidian',
}

vim.env.XDG_CONFIG_HOME = vim.fn.expand '$HOME/.config'

-- require('nord').set()
require('bamboo').load()

-- adds custom anumation durations to keymaps for neoscroll
neoscroll = require 'neoscroll'
local keymap = {
  ['<C-u>'] = function()
    neoscroll.ctrl_u { duration = 250 }
  end,
  ['<C-d>'] = function()
    neoscroll.ctrl_d { duration = 250 }
  end,
  ['<C-b>'] = function()
    neoscroll.ctrl_b { duration = 450 }
  end,
  ['<C-f>'] = function()
    neoscroll.ctrl_f { duration = 450 }
  end,
  ['<C-y>'] = function()
    -- this scrolls the editor animated, but does not move the cursor to that position
    neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
  end,
  ['<C-e>'] = function()
    -- this scrolls the editor animated, but does not move the cursor to that position
    neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
  end,
  ['zt'] = function()
    neoscroll.zt { half_win_duration = 250 }
  end,
  ['zz'] = function()
    neoscroll.zz { half_win_duration = 250 }
  end,
  ['zb'] = function()
    neoscroll.zb { half_win_duration = 250 }
  end,
}
local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end

-- LSP to open a float window for diagnostics when cursor is held
vim.api.nvim_create_autocmd('CursorHold', {

-- Set conceallevel for Obdisian (only in markdown files)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.opt.conceallevel = 2
  end,
})

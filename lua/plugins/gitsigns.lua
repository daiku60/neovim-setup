-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    signs_staged = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },

    -- on_attach function to set keymaps per buffer
    on_attach = function(bufnr)
      local gs = require 'gitsigns'
      local opts = { buffer = bufnr, remap = false }

      -- Navigate to next hunk
      vim.keymap.set('n', ']c', function()
        if vim.wo.diff then
          return ']c'
        end
        gs.next_hunk()
      end, opts)

      -- Navigate to previous hunk
      vim.keymap.set('n', '[c', function()
        if vim.wo.diff then
          return '[c'
        end
        gs.prev_hunk()
      end, opts)
    end,
  },
}

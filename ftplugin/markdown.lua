vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true
vim.opt_local.showbreak = '> '
vim.opt_local.spell = true
vim.opt_local.conceallevel = 2

local function open_in_typora()
  local file = vim.api.nvim_buf_get_name(0)

  if file == '' then
    vim.notify('Current buffer has no file on disk', vim.log.levels.WARN)
    return
  end

  vim.fn.jobstart({ 'open', '-a', 'Typora', file }, { detach = true })
end

vim.api.nvim_buf_create_user_command(0, 'Typora', open_in_typora, {
  desc = 'Open current Markdown file in Typora',
})

vim.keymap.set('n', 'j', function()
  return vim.v.count == 0 and 'gj' or 'j'
end, { expr = true, buffer = true, silent = true })

vim.keymap.set('n', 'k', function()
  return vim.v.count == 0 and 'gk' or 'k'
end, { expr = true, buffer = true, silent = true })

vim.keymap.set('n', '<leader>mt', open_in_typora, {
  buffer = true,
  silent = true,
  desc = 'Open current Markdown file in Typora',
})

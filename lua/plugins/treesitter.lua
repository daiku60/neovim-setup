return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    {
      'windwp/nvim-ts-autotag',
      config = function()
        require('nvim-ts-autotag').setup {
          opts = {
            enable_close = true, -- auto close tags
            enable_rename = true, -- auto rename tags
            enable_close_on_slash = false, -- </ auto close
          },
        }
      end,
    },
  },
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = {
      'lua',
      'python',
      'javascript',
      'typescript',
      'vimdoc',
      'vim',
      'regex',
      'terraform',
      'sql',
      'dockerfile',
      'toml',
      'json',
      'java',
      'groovy',
      'go',
      'gitignore',
      'graphql',
      'yaml',
      'make',
      'cmake',
      'markdown',
      'markdown_inline',
      'bash',
      'tsx',
      'css',
      'html',
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
    -- 🚫 remove "autotag = ..." from here!
  },
}

return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.startify'

    local default_header = {
      [[                                                    ]],
      [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
      [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
      [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
      [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[                                                    ]],
    }

    -- Read ASCII art from special.txt if it exists
    local function load_project_header()
      local cwd = vim.fn.getcwd()
      local file_path = cwd .. '/special.txt'
      if vim.fn.filereadable(file_path) == 1 then
        local lines = {}
        for line in io.lines(file_path) do
          table.insert(lines, line)
        end
        return lines
      end
      return default_header
    end

    dashboard.section.header.val = load_project_header()
    alpha.setup(dashboard.opts)

    -- Optional: refresh dashboard header if cwd changes
    vim.api.nvim_create_autocmd('DirChanged', {
      callback = function()
        dashboard.section.header.val = load_project_header()
        alpha.redraw()
      end,
    })
  end,
}

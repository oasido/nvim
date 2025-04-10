-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    -- { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<leader>pv', ':Neotree position=current<CR>', { desc = 'NeoTree netrw' } },
  },
  opts = {
    filesystem = {
      bind_to_cwd = true, -- Automatically change to the current working directory
      filtered_items = {
        visible = true, -- Show hidden files by default
        hide_dotfiles = false, -- Do not hide dotfiles
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}

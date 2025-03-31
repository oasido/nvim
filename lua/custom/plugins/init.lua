-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      vim.keymap.set('n', '<leader>-', function()
        harpoon:list():add()
      end, { desc = 'Harpoon: Mark file' })
      vim.keymap.set('n', '<leader>=', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Harpoon: Toggle menu' })

      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<leader>2', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<leader>3', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<leader>4', function()
        harpoon:list():select(4)
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end)
    end,
  },
  {
    'mbbill/undotree',
    keys = {
      {
        '<leader>u',
        vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle),
        desc = 'Toggle undotree',
      },
    },
    {
      'epwalsh/obsidian.nvim',
      version = '*', -- recommended, use latest release instead of latest commit
      -- lazy = true,
      event = { 'VimEnter' },
      ft = 'markdown',
      dependencies = {
        -- Required.
        'nvim-lua/plenary.nvim',
      },
      config = function()
        require('obsidian').setup {

          workspaces = {
            {
              name = 'sb',
              path = '~/sb',
            },
          },
          ui = { enable = false },
        }
        vim.keymap.set('n', '<leader>fn', ':ObsidianSearch<CR>')
        vim.keymap.set('n', '<leader>on', ':ObsidianNew<CR>')
        -- vim.gpt.conceallevel = 1
      end,
    },
    {
      'folke/persistence.nvim',
      -- event = 'BufReadPre', -- this will only start session saving when an actual file was opened
      opts = function()
        require('persistence').setup()
        vim.keymap.set('n', '<leader>qs', [[<cmd>lua require("persistence").load()<cr>]], { desc = 'Restore session of the current directory' })
        vim.keymap.set('n', '<leader>ql', [[<cmd>lua require("persistence").load({ last = true })<cr>]], { desc = 'Restore session' })
      end,
    },
    {
      'wakatime/vim-wakatime',
    },
  },
  {
    'shortcuts/no-neck-pain.nvim',
    version = '*',
    config = function()
      vim.keymap.set('n', '<leader>nn', ':NoNeckPain<cr>', { desc = 'NoNeckPain: Toggle' })
    end,
  },
  { 'lambdalisue/suda.vim' },
  { 'mfussenegger/nvim-jdtls' },
  {
    'lervag/vimtex',
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'zathura'
    end,
  },
}

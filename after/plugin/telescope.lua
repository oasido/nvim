local builtin = require('telescope.builtin')

-- local dirs = { "~/garden", "~/Sync", "~/personal/", "~/work" }
local dirs = { "~/Sync", "~/personal/", "~/work" }

require('telescope').setup {
  defaults = {
    preview = {
      filesize_limit = 25,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
    }
  }
}
require('telescope').load_extension('fzf')

vim.keymap.set('n', '<leader>fs', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fg', function()
  builtin.live_grep({
    search_dirs = dirs
  })
end, { desc = "Live Grep in specific directories" })

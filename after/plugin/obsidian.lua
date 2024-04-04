require("obsidian").setup({
  workspaces = {
    {
      name = "sb",
      path = "~/sb",
    },
  },

  notes_subdir = "0-inbox",

  -- Where to put new notes created from completion. Valid options are
  --  * "current_dir" - put new notes in same directory as the current buffer.
  --  * "notes_subdir" - put new notes in the default notes subdirectory.
  new_notes_location = "notes_subdir",

  completion = {
    -- Set to false to disable completion.
    nvim_cmp = true,

    -- Trigger completion at 2 chars.
    min_chars = 2,


    -- Control how wiki links are completed with these (mutually exclusive) options:
    -- https://github.com/epwalsh/obsidian.nvim/pull/406
    wiki_link_func = function(opts)
      if opts.id == nil then
        return string.format("[[%s]]", opts.label)
      elseif opts.label ~= opts.id then
        return string.format("[[%s|%s]]", opts.id, opts.label)
      else
        return string.format("[[%s]]", opts.id)
      end
    end,
  },
  daily_notes = {
    folder = "0-inbox",
    -- Optional, if you want to change the date format for the ID of daily notes.
    date_format = "%Y-%m-%d",
    -- Optional, if you want to change the date format of the default alias of daily notes.
    alias_format = "%B %-d, %Y",
    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
    template = nil
  },

  templates = {
    subdir = ".templates",
    date_format = "%Y-%m-%d-%a",
    time_format = "%H:%M",
  },

})


vim.g.vim_markdown_frontmatter = 1
vim.opt.conceallevel = 1

vim.keymap.set("n", "<leader>fn", ":ObsidianSearch<CR>")
vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>")
vim.keymap.set("n", "<leader>od", ":ObsidianToday<CR>")

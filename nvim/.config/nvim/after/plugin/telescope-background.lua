local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local scan = require 'plenary.scandir'

local fetch_files = function (path)
  return scan.scan_dir(path, { hidden = true, depth = 2 })
end

local wallpapers = function(opts)
  local path = os.getenv("HOME") .. "/Pictures/Wallpapers"

  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Wallpaper Finder",
    finder = finders.new_table {
      results = fetch_files(path),
      entry_maker = function(entry)
        local filename = entry:gsub(path .. '/', '')

        return {
          value = entry,
          display = filename,
          ordinal = filename,
          path = entry,
        }
      end,
    },
    sorter = conf.file_sorter(opts),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()

        io.popen('feh --bg-scale ' .. selection.path)
      end)
      return true
    end,
  }):find()
end

vim.keymap.set("n", "<leader>cw", function()
  wallpapers(require("telescope.themes").get_dropdown{})
end)

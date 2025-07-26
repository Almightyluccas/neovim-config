-- ~/.config/nvim/lua/luccas/find_keybind.lua

local M = {}

-- The function now accepts the mappings table as an argument
function M.view_keymaps(mappings)
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")

  local results = {}
  for mode_name, mode_maps in pairs(mappings) do
    for _, map in ipairs(mode_maps) do
      if map.desc and map.group then
        local display_str = string.format("󰒴 %-15s │ 󰍉 %-7s │ 󰌌 %-20s │ %s", map.group, mode_name, map.lhs, map.desc)
        table.insert(results, {
          display = display_str,
          group = map.group,
          lhs = map.lhs,
          desc = map.desc,
          mode = mode_name,
        })
      end
    end
  end

  pickers.new({
    prompt_title = "Search Keymaps",
    finder = finders.new_table({
      results = results,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.display,
          ordinal = entry.group .. " " .. entry.lhs .. " " .. entry.desc,
        }
      end,
    }),
    sorter = conf.generic_sorter({}),

    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
      end)
      return true
    end,
  }):find()
end

return M

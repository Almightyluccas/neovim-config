-- ~/.config/nvim/lua/luccas/remap.lua
local M = {}

vim.g.mapleader = ' '


-- All your remaps, grouped by mode with comments to separate plugins and purposes
M.mappings = {
  -- Normal mode keymaps
  normal = {
    -------------------------------------------------------------------------
    -- Keybind finder
    -------------------------------------------------------------------------
    {
      mode = "n",
      lhs = "<leader>?",
      rhs = function()
        require("luccas.find_keybind").view_keymaps(M.mappings)
      end,
      desc = "Search My Keybinds",
      group = "Config",
    },
    -------------------------------------------------------------------------
    -- Basic Navigation and Editing
    -------------------------------------------------------------------------
    { mode = "n", lhs = "<leader>pv", rhs = vim.cmd.Ex, desc = "Open Explorer (Ex)", group = "Navigation" },
    { mode = "n", lhs = "J", rhs = "mzJ`z", desc = "Join line without moving cursor", group = "Editing" },
    { mode = "n", lhs = "<C-d>", rhs = "<C-d>zz", desc = "Scroll down & center", group = "Navigation" },
    { mode = "n", lhs = "<C-u>", rhs = "<C-u>zz", desc = "Scroll up & center", group = "Navigation" },
    { mode = "n", lhs = "n", rhs = "nzzzv", desc = "Next search result & center", group = "Navigation" },
    { mode = "n", lhs = "N", rhs = "Nzzzv", desc = "Previous search result & center", group = "Navigation" },

    -------------------------------------------------------------------------
    -- LSP and Formatting
    -------------------------------------------------------------------------
    { mode = "n", lhs = "<leader>zig", rhs = "<cmd>LspRestart<cr>", desc = "LSP Restart", group = "LSP" },
    { mode = "n", lhs = "<leader>f", rhs = vim.lsp.buf.format, desc = "Format buffer", group = "LSP" },

    -------------------------------------------------------------------------
    -- Plugin: Vim With Me
    -------------------------------------------------------------------------
    { mode = "n", lhs = "<leader>vwm", rhs = function() require("vim-with-me").StartVimWithMe() end, desc = "Start Vim With Me", group = "Plugin: VimWithMe" },
    { mode = "n", lhs = "<leader>svwm", rhs = function() require("vim-with-me").StopVimWithMe() end, desc = "Stop Vim With Me", group = "Plugin: VimWithMe" },

    -------------------------------------------------------------------------
    -- Location/Quickfix List
    -------------------------------------------------------------------------
    { mode = "n", lhs = "<leader>k", rhs = "<cmd>lnext<CR>zz", desc = "Next location list", group = "Location List" },
    { mode = "n", lhs = "<leader>j", rhs = "<cmd>lprev<CR>zz", desc = "Previous location list", group = "Location List" },

    -------------------------------------------------------------------------
    -- Search and Replace
    -------------------------------------------------------------------------
    { mode = "n", lhs = "<leader>s", rhs = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Search & Replace word under cursor", group = "Editing" },

    -------------------------------------------------------------------------
    -- File Permissions
    -------------------------------------------------------------------------
    { mode = "n", lhs = "<leader>x", rhs = "<cmd>!chmod +x %<CR>", opts = { silent = true }, desc = "Make file executable", group = "File" },

    -------------------------------------------------------------------------
    -- Snippets
    -------------------------------------------------------------------------
    { mode = "n", lhs = "<leader>ee", rhs = "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", desc = "Insert error check (simple)", group = "Snippets" },
    { mode = "n", lhs = "<leader>ea", rhs = "oassert.NoError(err, \"\")<Esc>F\";a", desc = "Insert assert.NoError", group = "Snippets" },
    { mode = "n", lhs = "<leader>ef", rhs = "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj", desc = "Insert log.Fatalf error handling", group = "Snippets" },
    { mode = "n", lhs = "<leader>el", rhs = "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i", desc = "Insert logger error handling", group = "Snippets" },

    -------------------------------------------------------------------------
    -- Config Editing
    -------------------------------------------------------------------------
    { mode = "n", lhs = "<leader>vpp", rhs = "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/luccas/packer.lua<CR>", desc = "Edit packer.lua config", group = "Config" },
    { mode = "n", lhs = "<leader><leader>", rhs = function() vim.cmd("so") end, desc = "Source current file", group = "Config" },

    -----------------------------------------------------------------------------
    -- Plugin: Undotree
    -----------------------------------------------------------------------------
    { mode = "n", lhs = "<leader>u", rhs = vim.cmd.UndotreeToggle, desc = "Toggle Undotree", group = "Plugin: Undotree" },

    -------------------------------------------------------------------------
    -- Fun / Misc
    -------------------------------------------------------------------------
    { mode = "n", lhs = "<leader>mr", rhs = "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Make it rain animation", group = "Misc" },

    -------------------------------------------------------------------------
    -- Plugin: Harpoon
    -------------------------------------------------------------------------
    { mode = "n", lhs = "<leader>a", rhs = function() require("harpoon"):list():add() end, desc = "Harpoon: Add current file", group = "Plugin: Harpoon" },
    { mode = "n", lhs = "<C-e>", rhs = function() local harpoon = require("harpoon"); harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon: Toggle quick menu", group = "Plugin: Harpoon" },
    { mode = "n", lhs = "<C-h>", rhs = function() require("harpoon"):list():select(1) end, desc = "Harpoon: Go to file 1", group = "Plugin: Harpoon" },
    { mode = "n", lhs = "<C-t>", rhs = function() require("harpoon"):list():select(2) end, desc = "Harpoon: Go to file 2", group = "Plugin: Harpoon" },
    { mode = "n", lhs = "<C-n>", rhs = function() require("harpoon"):list():select(3) end, desc = "Harpoon: Go to file 3", group = "Plugin: Harpoon" },
    { mode = "n", lhs = "<C-s>", rhs = function() require("harpoon"):list():select(4) end, desc = "Harpoon: Go to file 4", group = "Plugin: Harpoon" },

    -------------------------------------------------------------------------
    -- Integrations
    -------------------------------------------------------------------------
    { mode = "n", lhs = "<C-f>", rhs = "<cmd>silent !tmux neww tmux-sessionizer<CR>", desc = "Open tmux-sessionizer", group = "Integration" },
  },

  -- Visual mode keymaps
  visual = {
    { mode = "v", lhs = "J", rhs = ":m '>+1<CR>gv=gv", desc = "Move selection down", group = "Editing" },
    { mode = "v", lhs = "K", rhs = ":m '<-2<CR>gv=gv", desc = "Move selection up", group = "Editing" },
    { mode = "x", lhs = "<leader>p", rhs = [["_dP]], desc = "Paste without overwriting buffer", group = "Editing" },
    { mode = "v", lhs = "<leader>y", rhs = [["+y]], desc = "Yank to system clipboard", group = "Clipboard" },
  },

  -- Normal and visual combined
  nv = {
    { mode = { "n", "v" }, lhs = "<leader>d", rhs = "\"_d", desc = "Delete without yank", group = "Editing" },
    { mode = "n", lhs = "<leader>y", rhs = [["+y]], desc = "Yank to system clipboard", group = "Clipboard" },
  },

  -- Insert mode keymaps
  insert = {
    { mode = "i", lhs = "<C-c>", rhs = "<Esc>", desc = "Escape insert mode", group = "Editing" },
  },

  -- Disabled mappings
  disabled = {
    { mode = "n", lhs = "Q", rhs = "<nop>", desc = "Disable Q in normal mode", group = "Disabled" },
  },
}

-- Sets all keymaps in the table
function M.setup()
  for _, mode_maps in pairs({ M.mappings.normal, M.mappings.visual, M.mappings.nv, M.mappings.insert, M.mappings.disabled }) do
    for _, map in ipairs(mode_maps) do
      local opts = { noremap = true, silent = true }
      if map.opts then
        for k, v in pairs(map.opts) do
          opts[k] = v
        end
      end
      vim.keymap.set(map.mode, map.lhs, map.rhs, opts)
    end
  end
end

return M

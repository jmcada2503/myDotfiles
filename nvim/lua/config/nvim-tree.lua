-- ******
-- Remaps
-- ******
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- ***********
-- KeyBindings
-- ***********
vim.api.nvim_set_keymap("n", "<C-e>", ":NvimTreeFindFile<cr>", {silent = true, noremap = true})

local api = require("nvim-tree.api")

local function edit_or_open()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file
    api.node.open.edit()
    -- Close the tree if file was opened
    api.tree.close()
  end
end

local function open_new_tab()
  local node = api.tree.get_node_under_cursor()
  -- open file
  api.node.open.tab(node, {
      quit_on_open=true
  })
end

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set("n", "l", edit_or_open,                opts("Edit Or Open"))
  vim.keymap.set("n", "L", open_new_tab,                opts("Open in new Tab"))
  vim.keymap.set("n", "<C-t>", open_new_tab,            opts("Open in new Tab"))
  vim.keymap.set("n", "<C-e>", api.tree.close,          opts("Close"))
  vim.keymap.set("n", "h", api.node.navigate.parent,    opts("Navigate to Parent"))
  vim.keymap.set("n", "H", api.tree.collapse_all,       opts("Collapse All"))
  vim.keymap.set("n", "O", api.tree.change_root_to_node,opts("Change Root to Node"))
  vim.keymap.set("n", "n", api.fs.create,               opts("Create Node"))
end


-- ******
-- Config
-- ******
require("nvim-tree").setup({
    on_attach=my_on_attach,
    view={
        centralize_selection=true,
        side="right",
        relativenumber=true,
        width="30%"
    }
})

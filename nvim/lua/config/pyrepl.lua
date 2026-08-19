local pyrepl = require("pyrepl")

pyrepl.setup({
  split_horizontal = false,
  split_ratio = 0.3,
  style = "default",
  style_integration = true,
  image_max_history = 10,
  image_width_ratio = 0.5,
  image_height_ratio = 0.5,
  image_provider = "placeholders",
  cell_pattern = "^# %%%%.*$",
  python_path = "python",
  preferred_kernel = "python3",
  -- automatically prompt to convert notebook files into python scripts
  jupytext_hook = true,
})

-- repl ui-related commands
vim.keymap.set("n", "<leader>no", pyrepl.open_repl)
vim.keymap.set("n", "<leader>nh", pyrepl.hide_repl)
vim.keymap.set("n", "<leader>nq", pyrepl.close_repl)
vim.keymap.set("n", "<leader>nt", pyrepl.toggle_repl)
vim.keymap.set("n", "<leader>ni", pyrepl.open_image_history)
vim.keymap.set({ "n", "t" }, "<C-j>", pyrepl.toggle_repl_focus)

-- send commands
vim.keymap.set("n", "<leader>nb", pyrepl.send_buffer)
vim.keymap.set("n", "<leader>nc", pyrepl.send_cell)
vim.keymap.set("v", "<leader>nv", pyrepl.send_visual)

-- QoL commands
vim.keymap.set("n", "<leader>np", pyrepl.step_cell_backward)
vim.keymap.set("n", "<leader>nn", pyrepl.step_cell_forward)
vim.keymap.set("n", "<leader>ne", pyrepl.export_to_notebook)
vim.keymap.set("n", "<leader>ns", ":PyreplInstall pip")

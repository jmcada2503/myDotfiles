vim.api.nvim_create_user_command("TabSize", function(opts)
  local n = tonumber(opts.args)
  if not n then
    print("Error: argument must be a number")
    return
  end

  vim.opt.tabstop = n
  vim.opt.shiftwidth = n
  vim.opt.softtabstop = n
  vim.opt.expandtab = true

  print("Tab size set to " .. n)
end, {
  nargs = 1
})


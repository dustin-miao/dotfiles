vim.api.nvim_create_user_command("Stylua", function()
  vim.api.nvim_command("lua vim.lsp.buf.format()")
end, {})

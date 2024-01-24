local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  vim.notify("[Error] plugin null-ls not found")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with({ 
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } 
    }),
    formatting.black.with({ 
      extra_args = { "--fast" } 
    }),
    formatting.stylua.with({
      extra_args = { "--config-path", vim.fn.expand("~/.config/stylua.toml") }
    }),
    diagnostics.checkstyle.with({
      extra_args = { "-c", vim.fn.expand("~/scripts/java_checkstyle.xml") }
    }),
  },
})

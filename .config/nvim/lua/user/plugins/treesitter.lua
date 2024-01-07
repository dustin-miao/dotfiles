local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("[Error] plugin nvim-treesitter.configs not found")
end

configs.setup{
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = { "yaml" },
  },
}

rainbow = {
  enable = true,
  extended_mode = true,
  max_file_lines = nil,
}

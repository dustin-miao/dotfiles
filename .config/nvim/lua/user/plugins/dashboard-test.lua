local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
  vim.notify("[Error] plugin dashboard not found")
  return
end

dashboard.setup({
  theme = "hyper",
  disable_move = false,
  config = {},
  hide = {
    statusline = true,
    tabline = false,
    winbar = false,
  },
  preview = {},
})

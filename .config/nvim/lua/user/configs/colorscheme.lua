local colorscheme = "OceanicNext"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("[Error] colorscheme " .. colorscheme .. " not found")
  return
end

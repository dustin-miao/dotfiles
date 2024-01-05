local status_ok, wilder = pcall(require, "wilder")
if not status_ok then
  vim.notify("[Error] plugin wilder not found")
  return
end

wilder.setup{
  modes = {'.', '/', '?'}
}

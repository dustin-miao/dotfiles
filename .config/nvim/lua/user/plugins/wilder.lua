local status_ok, wilder = pcall(require, "wilder")
if not status_ok then
  vim.notify("[Error] plugin wilder not found")
  return
end

wilder.setup({
  modes = { ".", "/", "?", ":" },
})

wilder.set_option(
  "renderer",
  wilder.renderer_mux({
    [":"] = wilder.popupmenu_renderer({
      highlighter = wilder.basic_highlighter(),
      left = { " ", wilder.popupmenu_devicons() },
      right = { " ", wilder.popupmenu_scrollbar() },
      pumblend = 30,

      -- wilder.popupmenu_border_theme({
      --   highlights = {
      --     border = 'Normal',
      --   },
      -- border = 'rounded',
      -- }),
    }),
    ["/"] = wilder.wildmenu_renderer({
      highlighter = wilder.basic_highlighter(),
      separator = " · ",
      left = { " ", wilder.wildmenu_spinner(), " " },
      right = { " ", wilder.wildmenu_index() },
    }),
  })
)

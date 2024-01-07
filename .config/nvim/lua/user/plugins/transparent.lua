local status_ok, transparent = pcall(require, "transparent")
if not status_ok then
  vim.notify("[Error] plugin transparent not found")
  return
end

transparent.setup{
  -- table: default groups
  groups = {
    "Normal",
    "NormalNC",
    "Comment",
    "Constant",
    "Special",
    "Identifier",
    "Statement",
    "PreProc",
    "Type",
    "Underlined",
    "Todo",
    "String",
    "Function",
    "Conditional",
    "Repeat",
    "Operator",
    "Structure",
    "LineNr",
    "NonText",
    "SignColumn",
    "CursorLineNr",
    "EndOfBuffer",
  },
  -- table: additional groups that should be cleared
  extra_groups = {
    "NormalFloat",
    "NvimTreeNormal",
    "NvimTreeNormalNC",
    "NvimTreeNormalFloat",
    "NvimTreeEndOfBuffer",
  },
  -- table: groups you don't want to clear
  exclude_groups = {},
}

transparent.clear_prefix('BufferLine')

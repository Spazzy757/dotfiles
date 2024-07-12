-- Default options
require('nightfox').setup({
  groups = {
    all = {
      TODO = { fg = "yellow" },
      Function = { fg = "#00FFFF", style = "bold" },
      Type = { fg = "#9D00FF", style = "bold,italic" },
      Keyword = { fg = "#00FF00" },
      Statement = { fg = "#00FF00" },
      Conditional = { fg = "#00FF00" },
      Operator = { fg = "#FF00FF" },
      Label = { fg = "#00FF00" },
      Identifier = { fg = "#9D00FF" },
      Normal = { fg = "#FFFFFF" },
      Special = { fg = "#FF00FF" },
      Whitespace = { link = "Comment" },
      Tag = { fg = "#FF00FF" },
      ["@keyword.function"] = { fg = "#00FF00" , style = "bold" },
      ["@keyword.return"] = { fg = "red", style = "bold" },
      ["@variable.member"] = { fg = "#CCFF00"},
      ["@property"] = { fg = "#CCFF00"},
      ["@comment.error"] = { bg = "red" },
    },
  },
})

vim.cmd("colorscheme carbonfox")

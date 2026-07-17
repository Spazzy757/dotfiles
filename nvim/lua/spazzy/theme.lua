-- Matrix-tinted carbonfox with high-contrast syntax: near-black green
-- background, but bright, saturated token colours (plus warm accents for
-- numbers/constants) so code syntax pops and stays easy to scan.

local c = {
  -- backgrounds (near-black, green tint)
  bg0 = "#070a07", bg1 = "#0b0f0b", bg2 = "#121812", bg3 = "#1a221a", bg4 = "#24302a",
  -- foregrounds (bright, softly green)
  fg0 = "#f0fff0", fg1 = "#e6ffe6", fg2 = "#b8d8b8", fg3 = "#6f8f74",
  sel0 = "#123018", sel1 = "#1f4f2f",
  comment = "#5f8f6f",

  -- high-contrast syntax palette, hues spread apart for separation
  keyword  = "#c792ff", -- violet
  func     = "#5b9bff", -- blue (the only blue now)
  type_    = "#4fe6b0", -- mint-teal (clearly greener than function blue)
  string_  = "#ffb86c", -- warm orange (was dull green)
  number   = "#f2d75e", -- yellow
  constant = "#ff8a8a", -- coral
  property = "#cfe0d8", -- soft (off the blue family, so blues don't muddle)
  variable = "#e6ffe6", -- bright fg
  operator = "#a8ffc8", -- light green
  accent   = "#00ff66", -- matrix-green UI accent
  red      = "#ff6b6b", -- errors / return
}

require('nightfox').setup({
  options = {
    transparent = false,
    styles = { comments = "italic", keywords = "bold" },
  },
  palettes = {
    carbonfox = {
      bg0 = c.bg0, bg1 = c.bg1, bg2 = c.bg2, bg3 = c.bg3, bg4 = c.bg4,
      fg0 = c.fg0, fg1 = c.fg1, fg2 = c.fg2, fg3 = c.fg3,
      sel0 = c.sel0, sel1 = c.sel1,
      comment = c.comment,
    },
  },
  groups = {
    all = {
      Normal      = { fg = c.fg1, bg = c.bg1 },
      NormalFloat = { fg = c.fg1, bg = c.bg0 },
      Comment     = { fg = c.comment, style = "italic" },

      -- syntax (traditional)
      Keyword     = { fg = c.keyword, style = "bold" },
      Statement   = { fg = c.keyword },
      Conditional = { fg = c.keyword },
      Repeat      = { fg = c.keyword },
      Label       = { fg = c.keyword },
      Operator    = { fg = c.operator },
      Function    = { fg = c.func, style = "bold" },
      Type        = { fg = c.type_ },
      String      = { fg = c.string_ },
      Character   = { fg = c.string_ },
      Number      = { fg = c.number },
      Float       = { fg = c.number },
      Boolean     = { fg = c.constant, style = "bold" },
      Constant    = { fg = c.constant },
      Identifier  = { fg = c.variable },
      Special     = { fg = c.type_ },
      Tag         = { fg = c.keyword },
      Title       = { fg = c.accent, style = "bold" },
      TODO        = { fg = c.number, style = "bold" },

      -- treesitter
      ["@keyword"]          = { fg = c.keyword, style = "bold" },
      ["@keyword.function"] = { fg = c.keyword, style = "bold" },
      ["@keyword.return"]   = { fg = c.red, style = "bold" },
      ["@function"]         = { fg = c.func, style = "bold" },
      ["@function.call"]    = { fg = c.func },
      ["@function.builtin"] = { fg = c.func },
      ["@method"]           = { fg = c.func },
      ["@constructor"]      = { fg = c.type_ },
      ["@type"]             = { fg = c.type_ },
      ["@type.builtin"]     = { fg = c.type_ },
      ["@string"]           = { fg = c.string_ },
      ["@character"]        = { fg = c.string_ },
      ["@number"]           = { fg = c.number },
      ["@float"]            = { fg = c.number },
      ["@boolean"]          = { fg = c.constant, style = "bold" },
      ["@constant"]         = { fg = c.constant },
      ["@constant.builtin"] = { fg = c.constant },
      ["@variable"]         = { fg = c.variable },
      ["@variable.member"]  = { fg = c.property },
      ["@property"]         = { fg = c.property },
      ["@parameter"]        = { fg = c.fg2 },
      ["@operator"]         = { fg = c.operator },
      ["@punctuation"]      = { fg = c.fg2 },
      ["@comment"]          = { fg = c.comment, style = "italic" },
      ["@comment.error"]    = { fg = c.bg1, bg = c.red },

      -- UI (matrix-green accents)
      CursorLineNr = { fg = c.accent, style = "bold" },
      LineNr       = { fg = "#2f5f3f" },
      MatchParen   = { fg = c.accent, bg = c.sel1, style = "bold" },
      Visual       = { bg = c.sel1 },
      Search       = { fg = c.bg1, bg = c.number },
      IncSearch    = { fg = c.bg1, bg = c.accent },
      Pmenu        = { fg = c.fg1, bg = c.bg2 },
      PmenuSel     = { fg = c.bg1, bg = c.accent },
    },
  },
})

vim.cmd("colorscheme carbonfox")

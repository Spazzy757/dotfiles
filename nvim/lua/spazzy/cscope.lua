vim.keymap.set(
  "n",
  "<C-c><C-g>",
  [[<cmd>lua require('cscope_maps').cscope_prompt('g', vim.fn.expand("<cword>"))<cr>]],
  { noremap = true, silent = true }
)

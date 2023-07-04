--Toggles Livedown on and off to view markdown
local function toggleLiveDown()
  local ft = vim.bo.filetype
  if ft == 'markdown' then
    return ':LivedownToggle<CR>'
  else
    print('Not A Markdown File')
  end
end

--Key binding
vim.keymap.set('n', '<space>m', toggleLiveDown, { expr = true, silent=true })

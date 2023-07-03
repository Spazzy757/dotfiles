-- languages that use "#" to start comments 
local hash_comments = {'perl','ruby','sh','make','python','yaml','terraform'}
-- languages that use "--" to start comments 
local dash_comments = {'lua'}
-- languages that use "//" to start comments 
local slash_comments = {'javascript', 'c', 'cpp', 'java', 'objc', 'scala', 'go', 'rust'}

-- Used to check a table for a value
local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

-- Uses Sed to add relevant comment charcaters to
-- the beginning of the line
local function comment()
	local ft = vim.bo.filetype
	if has_value(hash_comments, ft) then
		return ":s/^/\\#/<CR> | :noh<CR>"
	end
	if has_value(dash_comments, ft) then
		return ":s/^/--/<CR> | :noh<CR>"
	end
	if has_value(slash_comments, ft) then
		return ":s/^/\\/\\//<CR> | :noh<CR>"
	end
end

-- Uses Sed to remove comment charcaters to
-- the beginning of the line
local function uncomment()
	local ft = vim.bo.filetype
	if has_value(hash_comments, ft) then
		return ":s/^\\#// <CR> | :noh<CR>"
	end
	if has_value(dash_comments, ft) then
		return ":s/^--// | :noh<CR>"
	end
	if has_value(slash_comments, ft) then
		return ":s/^\\/\\///<CR> | :noh<CR>"
	end
end

-- Comment Keybinding
vim.keymap.set('v', '<space>b', comment, { expr = true, silent=true })
vim.keymap.set('v', '<space>?', uncomment, { expr = true, silent=true })


local function toggleLiveDown()
  local ft = vim.bo.filetype
  if ft == 'markdown' then
    return ':LivedownToggle<CR>'
  else
    print('Not A Markdown File')
  end
end

vim.keymap.set('n', '<space>m', toggleLiveDown, { expr = true, silent=true })

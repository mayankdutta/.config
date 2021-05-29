local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then
        scopes["o"][key] = value
    end
end

opt("o", "hidden", true)
opt("o", "ignorecase", true)
opt("o", "splitbelow", true)
opt("o", "splitright", true)
opt("o", "termguicolors", true)
opt("w", "number", true)
opt("o", "numberwidth", 2)
opt("o", "mouse", "a")
opt("w", "signcolumn", "yes")
opt("o", "cmdheight", 1)

-- mine
opt("o", "swapfile", false)
opt("o", "showmode", true)
opt("o", "autowrite", true)
opt("o", "ruler", true)
opt("b", "autoread", true)

opt("o", "title", true)
opt("o", "titleold", "Terminal")
opt("o", "title", "%F")

opt("o", "maxmempattern", 2000)

-- opt("o", "noswapfile", true) -- if above not work try this

opt("o", "updatetime", 250)                           -- update interval for gitsigns
-- opt("o", "clipboard", "unnamedplus")

-- for indenline
opt("b", "expandtab", true )
opt("b", "shiftwidth", 2 )


local indent = 2
cmd 'dracula'                                         -- Put your favorite colorscheme here
opt('b', 'expandtab', true)                           -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent)                        -- Size of an indent
opt('b', 'smartindent', true)                         -- Insert indents automatically
opt('b', 'tabstop', indent)                           -- Number of spaces tabs count for
opt('o', 'completeopt', 'menuone,noinsert,noselect')  -- Completion options (for deoplete)
opt('o', 'hidden', true)                              -- Enable modified buffers in background
opt('o', 'ignorecase', true)                          -- Ignore case
opt('o', 'joinspaces', false)                         -- No double spaces with join after a dotA
opt('o', 'scrolloff', 4 )                             -- Lines of context
opt('o', 'shiftround', true)                          -- Round indent
opt('o', 'sidescrolloff', 8 )                         -- Columns of context
opt('o', 'smartcase', true)                           -- Don't ignore case with capitals
opt('o', 'wildmode', 'list:longest')                  -- Command-line completion mode
opt('w', 'list', true)                                -- Show some invisible characters (tabs...)
opt('w', 'relativenumber', true)                      -- Relative line numbers
opt('w', 'wrap', false)                               -- Disable line wrap


-- opt("o", "hidden", true)
-- opt("o", "ignorecase", true)
-- opt("o", "splitbelow", true)
-- opt("o", "splitright", true)
-- opt("o", "termguicolors", true)
-- opt("w", "number", true)
-- opt("o", "numberwidth", 2)
-- opt("w", "cul", true)
--
-- opt("o", "mouse", "a")
--
-- opt("w", "signcolumn", "yes")
-- opt("o", "cmdheight", 1)
--
-- opt("o", "updatetime", 250) -- update interval for gitsigns
-- opt("o", "clipboard", "unnamedplus")
-- opt("o", "timeoutlen", 500)
--
-- for indenline
-- opt("b", "expandtab", true)
-- opt("b", "shiftwidth", 2)

local M = {}

function M.is_buffer_empty()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand("%:t")) == 1
end

function M.has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

return M

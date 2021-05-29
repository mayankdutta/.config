local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- dont copy any deleted text , this is disabled by default so uncomment the below mappings if you want them!
--[[ remove this line

map("n", "dd", [=[ "_dd ]=], opt)
map("v", "dd", [=[ "_dd ]=], opt)
map("v", "x", [=[ "_x ]=], opt)

 this line too ]]

-- OPEN TERMINALS --
map("n", "<C-n>", [[<Cmd>vnew term://fish <CR>]], opt) -- over right
-- map("n", "<C-l>", [[<Cmd>vnew term://bash <CR>]], opt) -- over right
-- map("n", "<C-x>", [[<Cmd> split term://bash | resize 10 <CR>]], opt) --  bottom
-- map("n", "<C-t>t", [[<Cmd> tabnew | term <CR>]], opt) -- newtab

-- COPY EVERYTHING in the file--
map("n", "<C-a>", [[ <Cmd> %y+<CR>]], opt)

map("n", "<C-h>", [[ <Cmd> <C-w>h<CR>]], opt)
map("n", "<C-k>", [[ <Cmd> <C-w>k<CR>]], opt)
map("n", "<C-j>", [[ <Cmd> <C-w>j<CR>]], opt)
map("n", "<C-l>", [[ <Cmd> <C-w>l<CR>]], opt)

map("n", "<Tab>", [[ <Cmd> gt<CR>]], opt)
map("n", "<S-Tab>", [[ <Cmd> gT<CR>]], opt)
map("n", "<S-t>", [[ <Cmd> :tabnew<CR>]], opt)

-- toggle numbers ---
map("n", "<leader>n", [[ <Cmd> set nu!<CR>]], opt)

-- toggle truezen.nvim's ataraxis and minimalist mode
map("n", "<leader>e", [[ <Cmd> :Ex<CR>]], opt)
map("n", "<leader>p", [[ <Cmd> :e <C-R>=expand("%:p:h") . "/"<CR>]], opt)
-- map("n", "<leader>z", [[ <Cmd> TZAtaraxis<CR>]], opt)
-- map("n", "<leader>m", [[ <Cmd> TZMinimalist<CR>]], opt)

map("n", "<C-s>", [[ <Cmd> w <CR>]], opt) -- save

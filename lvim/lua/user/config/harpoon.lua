local M = {}

M.config = function()
	require("harpoon"):setup()
end

M.keys = {
	{
		"<leader>A",
		function()
			require("harpoon"):list():add()
		end,
		desc = "harpoon file",
	},
	{
		"<leader>a",
		function()
			local harpoon = require("harpoon")
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end,
		desc = "harpoon quick menu",
	},
	{
		"<leader>1",
		function()
			require("harpoon"):list():select(1)
		end,
		desc = "harpoon to file 1",
	},
	{
		"<leader>2",
		function()
			require("harpoon"):list():select(2)
		end,
		desc = "harpoon to file 2",
	},
	{
		"<leader>3",
		function()
			require("harpoon"):list():select(3)
		end,
		desc = "harpoon to file 3",
	},
}

return M

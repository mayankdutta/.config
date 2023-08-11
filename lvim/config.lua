reload("user.lunarvim")
reload("user.set")
reload("user.plugins")
reload("user.bufferline")
reload("user.ignore_pattern")
reload("user.telescope")

local capabilities = vim.lsp.protocol.make_client_capabilities()

local emmet_options = {
	capabilities = capabilities,
	filetypes = {
		"css",
		"eruby",
		"html",
		"javascript",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"svelte",
		"pug",
		"typescriptreact",
		"vue",
		"typescript",
		"xml",
	},

	root_dir = function()
		return vim.loop.cwd()
	end,
}
require("lvim.lsp.manager").setup("emmet_ls", emmet_options)


require'lspconfig'.tsserver.setup{
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
}



require'lspconfig'.clangd.setup{
	cmd = { "clangd", "--background-index" },
	filetypes = { "c", "cpp", "objc", "objcpp" }
}

require'lspconfig'.cssls.setup{
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	settings = {
		css = {
			validate = true
		},
		less = {
			validate = true
		},
		scss = {
			validate = true
		}
	}
}

require'lspconfig'.html.setup{
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html"},
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true
		}
	},
	settings = {}
}


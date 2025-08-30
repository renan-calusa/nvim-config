return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "pyright" }, -- Add here new Language Servers
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- And then, add here too
			lspconfig.lua_ls.setup({
               capabilities = capabilities, 
            })
			--lspconfig.java_language_server.setup({})
			lspconfig.clangd.setup({
               capabilities = capabilities, 
            })
			lspconfig.pyright.setup({
               capabilities = capabilities, 
            })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}

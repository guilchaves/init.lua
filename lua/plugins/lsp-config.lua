return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"tailwindcss",
					"elixirls",
					"tsserver",
					"htmx",
					"templ",
					"gopls",
					"eslint",
					"emmet_language_server",
					"angularls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			local util = require("lspconfig/util")

			local _border = "single"

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = _border,
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = _border,
			})

			vim.diagnostic.config({
				float = { border = _border },
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.elixirls.setup({
				capabilities = capabilities,
				cmd = { vim.fn.expand("~/.bin/elixir-ls/language_server.sh") },
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})
			lspconfig.templ.setup({
				capabilities = capabilities,
			})
			lspconfig.htmx.setup({
				capabilities = capabilities,
				filetypes = {
					"html",
					"templ",
				},
			})
			lspconfig.angularls.setup({
				capabilities = capabilities,
				cmd = {
					"ngserver",
					"--stdio",
					"--tsProbeLocations",
					project_library_path,
					"--ngProbeLocations",
					project_library_path,
				},
				filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
			})

			lspconfig.tsserver.setup({
				capabilities = capabilities,
				filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
				cmd = { "typescript-language-server", "--stdio" },
				keys = {
					{
						"<leader>co",
						function()
							vim.lsp.buf.code_action({
								apply = true,
								context = {
									only = { "source.organizeImports.ts" },
									diagnostics = {},
								},
							})
						end,
						desc = "Organize Imports",
					},
					{
						"<leader>cR",
						function()
							vim.lsp.buf.code_action({
								apply = true,
								context = {
									only = { "source.removeUnused.ts" },
									diagnostics = {},
								},
							})
						end,
						desc = "Remove Unused Imports",
					},
				},
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = {
					"go",
					"gomod",
					"gowork",
					"gotmpl",
				},
				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        analyses = {
                            unusedparams = true,
                        }
                    }
                }
			})
			lspconfig.emmet_language_server.setup({
				filetypes = {
					"css",
					"html",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"vue",
				},
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, opts)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set({ "i", "n" }, "<C-s>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		end,
	},
}

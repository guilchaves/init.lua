local keymap = vim.keymap
local lsp = vim.lsp
local opts = { noremap = true, silent = true }

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
					"emmet_language_server",
					"volar",
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
			local ok, mason_registry = pcall(require, "mason-registry")
			local project_library_path = mason_registry.get_package("angular-language-server"):get_install_path()
			local vue_typescript_plugin = mason_registry.get_package("vue-language-server"):get_install_path()
				.. "/node_modules/@vue/language-server/"
				.. "/node_modules/@vue/typescript-plugin/"

			if not ok then
				vim.notify("mason-registry could not be loaded")
				return
			end

			local cmd = {
				"ngserver",
				"--stdio",
				"--tsProbeLocations",
				table.concat({
					project_library_path,
					vim.uv.cwd(),
				}, ","),
				"--ngProbeLocations",
				table.concat({
					project_library_path .. "/node_modules/@angular/language-server",
					vim.uv.cwd(),
				}, ","),
			}

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
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "templ", "javascript", "typescript", "typescriptreact", "javascriptreact", "vue" },
				init_options = { userLanguages = { templ = "html" } },
			})
			lspconfig.templ.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = {
					"html",
					"templ",
				},
			})
			lspconfig.htmx.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = {
					"html",
				},
			})
			lspconfig.volar.setup({
				init_options = {
					typescript = {
						tsdk = "/home/guilherme/.local/share/nvm/v18.19.0/lib/node_modules/typescript/lib",
					},
				},
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "javascript", "typescript", "vue" },
			})
			lspconfig.angularls.setup({
				cmd = cmd,
				on_new_config = function(new_config, new_root_dir)
					new_config.cmd = cmd
				end,
			})

			lspconfig.dartls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					dart = {
						analysisExcludedFolders = {
							vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
							vim.fn.expand("$HOME/.pub-cache"),
							vim.fn.expand("$HOME/tools/flutter/"),
						},
					},
				},
			})
			lspconfig.tsserver.setup({
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_typescript_plugin,
							languages = { "javascript", "typescript", "vue" },
						},
					},
				},
				capabilities = capabilities,
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"vue",
				},
				cmd = { "typescript-language-server", "--stdio" },
				settings = {
					completions = {
						completeFunctionCalls = true,
					},
				},
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
						},
					},
				},
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

			keymap.set("n", "K", lsp.buf.hover, {})
			keymap.set("n", "gd", lsp.buf.definition, {})
			keymap.set("n", "<leader>gr", lsp.buf.references, {})
			keymap.set({ "n", "v" }, "<leader>ca", lsp.buf.code_action, {})
			keymap.set({ "i", "n" }, "<C-s>", lsp.buf.signature_help, opts)
			keymap.set("n", "<leader>rn", lsp.buf.rename, opts)
		end,
	},
}

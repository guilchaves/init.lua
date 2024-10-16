return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local ls = require("luasnip")
		local s = ls.snippet
		local t = ls.text_node
		local f = ls.function_node

		local function get_greeting_with_filename()
			local filename = vim.fn.expand("%:t:r")
			return "Hello " .. filename
		end

		ls.add_snippets("vue", {
			s("model", {
				t({"<script setup></script>",
					"",
					"<template>",
                    "  <div>",
					"    <header>",
					"      this is my header",
					"    </header>",
					"    <main>",
					"      this is my main",
                    "      <section>",
                    "        this is my section",
                    "      </section>",
					"    </main>",
					"    <footer>",
					"      this is my footer",
					"    </footer>",
                    "  </div>",
					"</template>",
				}),
			}),
		})

		ls.add_snippets("vue", {
			s("vcomp", {
				t({ "<script setup></script>", "", "<template>", "  <div>" }),
				f(function()
					return get_greeting_with_filename()
				end),
				t({ "</div>", "</template>", "", "<style scoped>", "", "</style>" }),
			}),
		})
	end,
}

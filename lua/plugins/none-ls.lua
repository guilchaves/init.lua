return {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.eslint,
                null_ls.builtins.diagnostics.eslint,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.rubocop,
                null_ls.builtins.diagnostics.rubocop,
                null_ls.builtins.formatting.gofmt,
                null_ls.builtins.formatting.goimports_reviser,
            },
        })
    end,
}

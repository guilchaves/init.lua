return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            autotag = {
                enable = true,
                enable_rename = true,
                enable_close = true,
                enable_close_on_slash = true,
                filetypes = {"html", "xml", "javascriptreact", "typescript", "typescriptreact", "javascript"},
            },
            ensure_installed = { "lua", "rust", "elixir", "heex", "eex", "javascript", "typescript", "tsx" },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}

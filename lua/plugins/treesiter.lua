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
                filetypes = { "html", "xml", "javascriptreact", "typescript", "typescriptreact", "javascript", "ruby", "go", "rust" },
            },
            -- ensure_installed = { "lua", "rust", "elixir", "heex", "eex", "javascript", "typescript", "tsx" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}

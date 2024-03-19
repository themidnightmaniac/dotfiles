return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.diagnostics.erb_lint,
                null_ls.builtins.diagnostics.rubocop,
                null_ls.builtins.formatting.rubocop,
                null_ls.builtins.formatting.bean_format,
                null_ls.builtins.formatting.biome,
                null_ls.builtins.formatting.shellharden,
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.diagnostics.ltrs,
            },
        })

        vim.keymap.set("n", "<leader>mm", vim.lsp.buf.format, {})
    end,
}

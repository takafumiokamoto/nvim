return {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
        require("onedarkpro").setup({
            options = {
                bold = true, -- Use bold fonts?
                italic = true, -- Use italic fonts?
                underline = true, -- Use undercurl fonts?
                cursorline = true, -- Enable cursorline?
                transparency = false, -- Enable transparent background?
                terminal_colors = true, -- Enable 24-bit RGB colors in terminal (most terminals support this)
                highlights = {
                    Comment = { italic = true },
                    String = { italic = false },
                    Function = { bold = true },
                    Keyword = { italic = false },
                },
            },
        })
        vim.cmd("colorscheme onedark")
    end,
}
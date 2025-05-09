return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        python = { "ruff" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })

    -- Define a custom command to format all open buffers
    vim.api.nvim_create_user_command("FormatAllBuffers", function()
      local buffers = vim.api.nvim_list_bufs() -- Get a list of all buffer numbers
      for _, bufnr in ipairs(buffers) do
        if
          vim.api.nvim_buf_is_loaded(bufnr)
          and not vim.api.nvim_buf_get_option(bufnr, "readonly")
          and vim.api.nvim_buf_get_name(bufnr) ~= ""
        then
          -- Check if the buffer is loaded, not read-only, and has a filename
          conform.format({ bufnr = bufnr, async = true }) -- Format asynchronously for multiple buffers
        end
      end
      print("Attempted to format all loaded buffers.")
    end, {
      desc = "Format all currently open buffers using conform.nvim",
    })
  end,
}

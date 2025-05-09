return {
  "williamboman/mason.nvim",
  version = "^1.0.0",

  dependencies = {
    { "williamboman/mason-lspconfig.nvim", version = "^1.0.0" }, -- Specify version
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
      },
      automatic_installation = true, -- To automatically install LSPs listed in ensure_installed
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "ruff",
      },
    })
  end,

  -- You can add other lazy.nvim specific options here if needed, e.g.:
  -- lazy = false, -- To load mason at startup (default is true, loads on first use/event)
  -- event = "VeryLazy", -- Or specify an event to trigger loading
}

return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- enable mason and configure icons
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
      -- list of servers for mason to install
      ensure_installed = {
<<<<<<< HEAD
        -- "html",
        -- "cssls",
        -- "tailwindcss",
        -- "svelte",
        -- "lua_ls",
        -- "graphql",
        -- "emmet_ls",
        -- "prismals",
        "jedi_language_server",
        "clangd",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "ruff"
        -- "prettier", -- prettier formatter
        --"stylua", -- lua formatter
        --"isort", -- python formatter
        --"black", -- python formatter
        --"pylint",
        --"eslint_d",
      },
    })
=======
        "jedi_language_server",
	    "clangd",
      },
    })

    -- mason_tool_installer.setup({
    --   ensure_installed = {
    --   },
    -- })
>>>>>>> 4b83cfd (move to opencode)
  end,
}

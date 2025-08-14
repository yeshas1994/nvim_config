-- In your new plugins/lsp.lua file

return {
  -- The main plugin that connects mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    -- These are the dependencies this plugin needs. lazy.nvim will make sure
    -- they are loaded BEFORE this plugin's config function runs.
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp", -- Add cmp-nvim-lsp as a dependency
    },

    -- The config function will run after all the dependencies are loaded.
    -- This is the key to fixing the issue.
    config = function()
      -- First, set up your LSP signs and keymaps.
      -- This is the code from your original lspconfig.lua.
      local keymap = vim.keymap -- for conciseness

      -- Change the Diagnostic symbols in the sign column (gutter)
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- All of your keymaps go here, they are perfect.
          local opts = { buffer = ev.buf, silent = true }
          opts.desc = "Show LSP references"
          keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
          opts.desc = "Go to declaration"
          keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
          opts.desc = "Show LSP definitions"
          keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
          opts.desc = "Show LSP implementations"
          keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
          opts.desc = "Show LSP type definitions"
          keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
          opts.desc = "See available code actions"
          keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
          opts.desc = "Smart rename"
          keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
          opts.desc = "Show buffer diagnostics"
          keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
          opts.desc = "Show line diagnostics"
          keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
          opts.desc = "Go to previous diagnostic"
          keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
          opts.desc = "Go to next diagnostic"
          keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
          opts.desc = "Show documentation for what is under cursor"
          keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
          opts.desc = "Restart LSP"
          keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
        end,
      })

      -- Now that keymaps are ready, configure the plugins.
      -- Because of the `dependencies` table, `require("mason")` and
      -- `require("lspconfig")` are now guaranteed to be safe to call.

      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "jedi_language_server",
          "clangd",
          "lua_ls",
        },
        handlers = {
          -- The default handler for servers that don't have a custom setup
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,

          -- Custom handler for lua_ls
          ["lua_ls"] = function()
            require("lspconfig")["lua_ls"].setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = { globals = { "vim" } },
                  completion = { callSnippet = "Replace" },
                },
              },
            })
          end,
        },
      })
    end,
  },

  -- The tool installer can remain a separate, simple plugin definition
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = { "isort", "black" },
      })
    end,
  },

  -- Other LSP-related plugins that don't need complex dependency chains
  { "antosha417/nvim-lsp-file-operations", config = true },
  { "folke/neodev.nvim", opts = {} },
}

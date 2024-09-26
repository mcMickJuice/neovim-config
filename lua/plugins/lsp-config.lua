return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver", "gopls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.htmx.setup({
        capabilities = capabilities,
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      -- configured in telescope
      -- vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      --    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      --    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
      --    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
      --    vim.keymap.set('n', '<leader>wl', function()
      --      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      --    end, opts)
      --    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
      --    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      --    vim.keymap.set('n', '<leader>f', function()
      --     vim.lsp.buf.format { async = true }
      --  end, {})

      -- manually configure yaml schemas
      -- https://www.arthurkoziel.com/json-schemas-in-neovim/
      lspconfig.yamlls.setup({
        settings = {
          yaml = {
            validate = true,
            -- disable the schema store
            schemaStore = {
              enable = false,
              url = "",
            },
            -- manually select schemas
            schemas = {
              ["https://json.schemastore.org/circleciconfig.json"] = "**/.circleci/config.yml",
              ["https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json"] =
              "docker-compose*.{yml,yaml}",
            },
          },
        },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "sh",
        callback = function()
          vim.lsp.start({
            name = "bash-language-server",
            cmd = { "bash-language-server", "start" },
          })
        end,
      })
    end,
  },
}

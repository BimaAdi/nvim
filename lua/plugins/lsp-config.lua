return {
  {
    "mason-org/mason.nvim",
    opts = {},
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls", "pyright","gopls", "tsc", "rust_analyzer"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    config = function()
       vim.lsp.config('lua_ls', {
         on_init = function(client)
           if client.workspace_folders then
             local path = client.workspace_folders[1].name
             if
               path ~= vim.fn.stdpath('config')
               and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
             then
               return
             end
           end

           client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
             runtime = {
               -- Tell the language server which version of Lua you're using (most
               -- likely LuaJIT in the case of Neovim)
               version = 'LuaJIT',
               -- Tell the language server how to find Lua modules same way as Neovim
               -- (see `:h lua-module-load`)
               path = {
                 'lua/?.lua',
                 'lua/?/init.lua',
               },
             },
             -- Make the server aware of Neovim runtime files
             workspace = {
               checkThirdParty = false,
               library = {
                 vim.env.VIMRUNTIME,
                 -- For LSP Settings Type Annotations: https://github.com/neovim/nvim-lspconfig#lsp-settings-type-annotations
                 vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
               },
               -- Or pull in all of 'runtimepath'.
               -- NOTE: this is a lot slower and will cause issues when working on
               -- your own configuration.
               -- See https://github.com/neovim/nvim-lspconfig/issues/3189
               -- library = vim.api.nvim_get_runtime_file('', true),
             },
           })
         end,
         settings = {
           Lua = {},
         },
      })
      vim.lsp.config('rust_analyzer', {
          settings = {
           ['rust-analyzer'] = {
             diagnostics = {
               enable = false;
             }
           }
         }
      })
      -- integrate with blink
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      vim.lsp.config('lua_ls', { capabilities = capabilities })
      vim.lsp.config('pyright', { capabilities = capabilities })
      vim.lsp.config('gopls', { capabilities = capabilities })
      vim.lsp.config('tsc', { capabilities = capabilities })
      vim.lsp.config('rust_analyzer', { capabilities = capabilities })
      -- enable LSP
      vim.lsp.enable('lua_ls')
      -- for pyright if you want to use virtual environtment
      -- make sure to `source .venv/bin/activate first berfore open neovim`
      vim.lsp.enable('pyright')
      vim.lsp.enable('gopls')
      vim.lsp.enable('tsc')
      vim.lsp.enable('rust_analyzer')

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { noremap = true, silent = true })
    end
  },
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = 'default' },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  }
}

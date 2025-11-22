local lsp = require('lsp-zero')

lsp.preset("recommended")

-- list of language servers to install
require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    "eslint",
    "lua_ls",
    "rust_analyzer",
    "clangd",
    "cmake",
    "pyright",
    "kotlin_language_server",
    "nil_ls" -- Nix LSP
  },
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({})
    end,
  }
})

local cmp = require('cmp');
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  -- Add some duplicate bindings because both kind of make sense
  ['<M-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<Enter>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})

cmp.setup({
  mapping = cmp_mappings
})

-- NOTE - I copied these from a Primeagen video, I will probably need to do some more configuring
lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  lsp.default_keymaps();

  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

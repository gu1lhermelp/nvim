local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

-- -- Global configuration options
-- local lsp_defaults = {
--     flags = {
--         debounce_text_changes = 150,  -- Amount of milisecond neovim will wait to send next update notification
--     },
--     capabilities = cmp_nvim_lsp.default_capabilities(
--         vim.lsp.protocol.make_client_capabilities()
--     ),
--     on_attach = function(client, bufnr)
--         vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
--     end
-- }
--
--
-- lspconfig.util.default_config = vim.tbl_deep_extend(
--     'force',
--     lspconfig.util.default_config,
--     lsp_defaults
-- )
--
-- lspconfig.sumneko_lua.setup({})
--
-- lspconfig.tsserver.setup({})
--
-- lspconfig.clangd.setup({})
--
-- vim.api.nvim_create_autocmd('User', {
--   pattern = 'LspAttached',
--   desc = 'LSP actions',
--   callback = function()
--     local bufmap = function(mode, lhs, rhs)
--       local opts = {buffer = true}
--       vim.keymap.set(mode, lhs, rhs, opts)
--     end
--
--     -- Displays hover information about the symbol under the cursor
--     bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
--
--     -- Jump to the definition
--     bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
--
--     -- Jump to declaration
--     bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
--
--     -- Lists all the implementations for the symbol under the cursor
--     bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
--
--     -- Jumps to the definition of the type symbol
--     bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
--
--     -- Lists all the references 
--     bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
--
--     -- Displays a function's signature information
--     bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
--
--     -- Renames all references to the symbol under the cursor
--     bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
--
--     -- Selects a code action available at the current cursor position
--     bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
--     bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
--
--     -- Show diagnostics in a floating window
--     bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
--
--     -- Move to the previous diagnostic
--     bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
--
--     -- Move to the next diagnostic
--     bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
--   end
-- })

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', 'gk', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'gj', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = cmp_nvim_lsp.default_capabilities()
lspconfig.clangd.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities=capabilities,
}
lspconfig.tsserver.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities=capabilities,
}
lspconfig.sumneko_lua.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities=capabilities,
    -- Server-specific settings...
    -- settings = {
    --   ["rust-analyzer"] = {}
    -- }
}

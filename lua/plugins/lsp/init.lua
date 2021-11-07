local lsp_installer_servers = require 'nvim-lsp-installer.servers'

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = {noremap = true, silent = true}

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa',
    '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr',
    '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl',
    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
    opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
    opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
    opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e',
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q',
    '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local language_servers = {
  'ansiblels', 'bashls', 'cssls', 'diagnosticls', 'dockerls', 'efm', 'eslint',
  'emmet_ls', 'gopls', 'graphql', 'html', 'jsonls', 'sumneko_lua', 'pylsp',
  'pyright', 'rls', 'rust_analyzer', 'sqls', 'stylelint_lsp', 'tailwindcss',
  'terraformls', 'tflint', 'tsserver', 'vimls', 'lemminx', 'yamlls'
}

for _, ls in pairs(language_servers) do
  local server_available, requested_server =
    lsp_installer_servers.get_server(ls)
  if server_available then
    requested_server:on_ready(function()
      local opts = {}

      if requested_server.name == 'efm' then
        opts.init_options = {documentFormatting = true}
        opts.settings = {
          rootMarkers = {'.git/'},
          languages = {
            lua = {{formatCommand = 'lua-format -i', formatStdin = true}}
          }
        }
      end

      opts.on_attach = on_attach
      opts.flags = {debounce_text_changes = 150}

      requested_server:setup(opts)
    end)
    if not requested_server:is_installed() then
      requested_server:install()
    end
  end
end

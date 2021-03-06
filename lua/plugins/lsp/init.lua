local lsp_installer_servers = require 'nvim-lsp-installer.servers'
local lspconfig = require 'lspconfig'

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
  'ansiblels',
  'bashls',
  'cssls',
  'diagnosticls',
  'dockerls',
  'efm',
  'eslint',
  'emmet_ls',
  'gopls',
  'graphql',
  'html',
  'jsonls',
  'sumneko_lua',
  'pylsp',
  'pyright',
  'rls',
  'rust_analyzer',
  'sqls',
  'stylelint_lsp',
  'tailwindcss',
  'terraformls',
  'tflint',
  'tsserver',
  'vimls',
  'lemminx',
  'yamlls'
}

for _, ls in pairs(language_servers) do
  local server_available, requested_server =
    lsp_installer_servers.get_server(ls)
  if server_available then
    requested_server:on_ready(function()
      local opts = {}

      if requested_server.name == 'efm' then
        opts = {
          filetypes = {'sh', 'lua'},
          init_options = {
            hover = true,
            documentSymbol = true,
            codeAction = true,
            completion = true
          },
          settings = {
            rootMarkers = {'.git/'},
            languages = {
              lua = {
                {
                  formatCommand = 'lua-format -i',
                  formatStdin = true,
                  prefix = 'luacheck',
                  lintCommand = 'luacheck --codes --no-color --quiet -',
                  lintStdin = true,
                  lintFormats = {'%.%#:%l:%c: (%t%n) %m'}
                }
              },
              sh = {
                {
                  formatCommand = 'shfmt -ci -s -bn',
                  formatStdin = true,
                  prefix = 'shellcheck',
                  lintCommand = 'shellcheck -x --color=never --format=gcc -',
                  lintStdin = true,
                  lintFormats = {
                    '-:%l:%c: %trror: %m',
                    '-:%l:%c: %tarning: %m',
                    '-:%l:%c: %tote: %m'
                  },
                  rootMarkers = {}
                }
              }
            }
          }
        }
      elseif requested_server.name == 'sumneko_lua' then
        opts.settings = {Lua = {diagnostics = {enable = false}}}
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

      opts.capabilities = capabilities
      opts.on_attach = on_attach
      opts.flags = {debounce_text_changes = 150}

      requested_server:setup(opts)
    end)
    if not requested_server:is_installed() then
      requested_server:install()
    end
  end
end

-- Set statusbar
vim.g.lightline = {
  active = {
    left = {
      {'mode', 'paste'},
      {'gitbranch', 'readonly', 'filename', 'modified'}
    }
  },
  component_function = {gitbranch = 'fugitive#head'}
}

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = {hl = 'GitGutterAdd', text = '+'},
    change = {hl = 'GitGutterChange', text = '~'},
    delete = {hl = 'GitGutterDelete', text = '_'},
    topdelete = {hl = 'GitGutterDelete', text = '???'},
    changedelete = {hl = 'GitGutterChange', text = '~'}
  }
}

-- Telescope
require('telescope').setup {
  defaults = {mappings = {i = {['<C-u>'] = false, ['<C-d>'] = false}}}
}
-- Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader><space>',
  [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
  {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ff',
  [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]],
  {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fb',
  [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
  {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fh',
  [[<cmdlua require('telescope.builtin').help_tags()<CR>]],
  {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ft',
  [[<cmd>lua require('telescope.builtin').tags()<CR>]],
  {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fg',
  [[<cmd>lua require('telescope.builtin').grep_string()<CR>]],
  {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fl',
  [[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
  {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fo',
  [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
  {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>?',
  [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
  {noremap = true, silent = true})

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash',
    'css',
    'dockerfile',
    'go',
    'gomod',
    'graphql',
    'hcl',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'lua',
    'rust',
    'toml',
    'typescript',
    'vim',
    'yaml'
  },
  highlight = {
    enable = true -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm'
    }
  },
  indent = {enable = true},
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner'
      }
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {[']m'] = '@function.outer', [']]'] = '@class.outer'},
      goto_next_end = {[']M'] = '@function.outer', [']['] = '@class.outer'},
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer'
      },
      goto_previous_end = {['[M'] = '@function.outer', ['[]'] = '@class.outer'}
    }
  }
}

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end
  },
  sources = cmp.config.sources({
    {name = 'nvim_lsp'},
    {name = 'luasnip'} -- For luasnip users.
  }, {{name = 'buffer'}})
}

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})

require('luasnip/loaders/from_vscode').lazy_load({
  paths = '~/.nvimfiles/snippets'
})

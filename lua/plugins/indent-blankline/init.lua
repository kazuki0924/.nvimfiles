vim.g.indent_blankline_char = '|'
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_space_char_blankline = ' '
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_char_highlight_list = {
  "IndentBlanklineIndent",
}
vim.cmd [[highlight IndentBlanklineIndent guifg=#1f1f1f gui=nocombine]]

require('indent_blankline').setup()

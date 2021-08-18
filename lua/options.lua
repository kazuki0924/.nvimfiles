-- global option
local o = vim.o

-- change directory to the file in the current window
o.autochdir = false

-- take indent for new line from previous line
o.autoindent = true

-- automatically read file when changed outside of Vim
o.autoread = true

-- Write the contents of the file, if it has been modified, on each
-- :next, :rewind, :last, :first, :previous, :stop, :suspend, :tag, :!,
-- :make, CTRL-] and CTRL-^ command; and when a :buffer, CTRL-O, CTRL-I,
-- '{A-Z0-9}, or `{A-Z0-9} command takes one to another file.
o.autowrite = false

-- Like 'autowrite', but also used for commands ":edit", ":enew", ":quit",
-- ":qall", ":exit", ":xit", ":recover" and closing the Vim window.
o.autowriteall = false

-- "dark" or "light", used for highlight colors
o.background = "dark"

-- Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert
-- mode. This is a list of items, separated by commas. Each item allows
-- a way to backspace over something:

-- indent: allow backspacing over autoindent
-- eol: allow backspacing over line breaks (join lines)
-- start: allow backspacing over the start of insert; CTRL-W and CTRL-U stop once at the start of insert.
-- nostop: like start, except CTRL-W and CTRL-U do not stop at the start of insert.

o.backspace = "indent,eol,start"

-- keep backup file after overwriting a file
o.backup = false

-- do not ring the bell for these reasons
o.belloff = "all"

-- This option lets you choose which characters might cause a line
-- break if 'linebreak' is on. Only works for ASCII characters.
o.breakat = " ^I!@*-+;:,./?"

-- Every wrapped line will continue visually indented (same amount of
-- space as the beginning of that line), thus preserving horizontal blocks
-- of text.
o.breakindent = false

-- test
-- o.number = true

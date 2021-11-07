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
o.background = 'dark'

-- Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert
-- mode. This is a list of items, separated by commas. Each item allows
-- a way to backspace over something:

-- indent: allow backspacing over autoindent
-- eol: allow backspacing over line breaks (join lines)
-- start: allow backspacing over the start of insert; CTRL-W and CTRL-U stop once at the start of insert.
-- nostop: like start, except CTRL-W and CTRL-U do not stop at the start of insert.

o.backspace = 'indent,eol,start'

-- keep backup file after overwriting a file
o.backup = false

-- do not ring the bell for these reasons
o.belloff = 'all'

-- This option lets you choose which characters might cause a line
-- break if 'linebreak' is on. Only works for ASCII characters.
o.breakat = ' ^I!@*-+;:,./?'

-- Every wrapped line will continue visually indented (same amount of
-- space as the beginning of that line), thus preserving horizontal blocks
-- of text.
o.breakindent = false

-- test
o.number = true
o.scrolloff = 8
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.list = true
o.listchars = 'extends:>,precedes:<,space: ,tab:→ ,eol:↴'
o.termguicolors = true
o.relativenumber = true
o.expandtab = true

-- termguicolors = true,
-- mouse = "a",
-- errorbells = true,
-- visualbell = true,
-- hidden = true,
-- fileformats = "unix,mac,dos",
-- magic = true,
-- virtualedit = "block",
-- encoding = "utf-8",
-- viewoptions = "folds,cursor,curdir,slash,unix",
-- sessionoptions = "curdir,help,tabpages,winsize",
-- clipboard = "unnamedplus",
-- wildignorecase = true,
-- wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
-- backup = false,
-- writebackup = false,
-- swapfile = false,
-- directory = global.cache_dir .. "swag/",
-- undodir = global.cache_dir .. "undo/",
-- backupdir = global.cache_dir .. "backup/",
-- viewdir = global.cache_dir .. "view/",
-- spellfile = global.cache_dir .. "spell/en.uft-8.add",
-- history = 2000,
-- shada = "!,'300,<50,@100,s10,h",
-- backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
-- smarttab = true,
-- shiftround = true,
-- timeout = true,
-- ttimeout = true,
-- timeoutlen = 500,
-- ttimeoutlen = 0,
-- updatetime = 100,
-- redrawtime = 1500,
-- ignorecase = true,
-- smartcase = true,
-- infercase = true,
-- incsearch = true,
-- wrapscan = true,
-- complete = ".,w,b,k",
-- inccommand = "nosplit",
-- grepformat = "%f:%l:%c:%m",
-- grepprg = 'rg --hidden --vimgrep --smart-case --',
-- breakat = [[\ \	;:,!?]],
-- startofline = false,
-- whichwrap = "h,l,<,>,[,],~",
-- splitbelow = true,
-- splitright = true,
-- switchbuf = "useopen",
-- backspace = "indent,eol,start",
-- diffopt = "filler,iwhite,internal,algorithm:patience",
-- completeopt = "menuone,noselect",
-- jumpoptions = "stack",
-- showmode = false,
-- shortmess = "aoOTIcF",
-- scrolloff = 5,
-- sidescrolloff = 5,
-- foldlevelstart = 99,
-- ruler = true,
-- cursorline = true,
-- cursorcolumn = true,
-- list = true,
-- showtabline = 2,
-- winwidth = 30,
-- winminwidth = 10,
-- pumheight = 15,
-- helpheight = 12,
-- previewheight = 12,
-- showcmd = false,
-- cmdheight = 2,
-- cmdwinheight = 5,
-- equalalways = false,
-- laststatus = 2,
-- display = "lastline",
-- showbreak = "↳  ",
-- listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
-- pumblend = 10,
-- winblend = 10,
-- autoread = true,
-- autowrite = true

-- undofile = true,
-- synmaxcol = 2500,
-- formatoptions = "1jcroql",
-- textwidth = 80,
-- expandtab = true,
-- autoindent = true,
-- tabstop = 4,
-- shiftwidth = 4,
-- softtabstop = -1,
-- breakindentopt = "shift:2,min:20",
-- wrap = false,
-- linebreak = true,
-- number = true,
-- relativenumber = true,
-- foldenable = true,
-- signcolumn = "yes",
-- conceallevel = 0,
-- concealcursor = "niv"

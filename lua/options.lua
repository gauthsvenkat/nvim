local o = vim.o

-- line numbering
o.number = true
o.relativenumber = true

-- window splitting
o.splitbelow = true
o.splitleft = true

-- search
o.hlsearch = true
o.ignorecase = true
o.smartcase = true

-- wrapped line will continue with the same indent
o.breakindent = true

-- column options
o.signcolumn = "yes"
o.scrolloff = 10

-- fast updatetime
o.updatetime = 50

-- more colors!!!
o.termguicolors = true

-- undo options
o.undodir = os.getenv("HOME") .. "/.undodir"
o.undofile = true

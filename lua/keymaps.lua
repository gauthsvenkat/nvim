local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- set space to be the leader key
vim.g.mapleader = " "

-- space shouldn't be assigned anything (since it is the leader key)
keymap("", "<space>", "<nop>", opts)

-- exit from terminal mode on pressing escape
keymap("t", "<esc>", "<C-\\><C-n>", opts)

-- easier window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- keep cursor in middle when jumping pages
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- keep search terms in the middle of the screen
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- paste and keep buffer on select mode
keymap("x", "p", '"_dP', opts)

-- resize window pane with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- easier buffer navigation
keymap("n", "<C-q>", "<cmd>bprevious<cr>", opts)
keymap("n", "<C-e>", "<cmd>bnext<cr>", opts)
keymap("n", "<C-x>", "<cmd>bdelete<cr>", opts)
keymap("n", "<C-f>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- easier moving line(s) of code
keymap("n", "<A-j>", ":m .+1<cr>==", opts)
keymap("n", "<A-k>", ":m .-2<cr>==", opts)
keymap("x", "<A-j>", ":m '>+1<cr>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<cr>gv=gv", opts)

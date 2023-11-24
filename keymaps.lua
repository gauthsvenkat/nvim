local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- clear highlights on pressing escape
keymap("n", "<Esc>", ":noh<cr>", opts)
-- exit from terminal mode on pressing escape
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- easier window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- resize window pane with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- easier buffer navigation
keymap("n", "<C-q>", "<cmd>bprevious<cr>", opts)
keymap("n", "<C-e>", "<cmd>bnext<cr>", opts)

-- easier moving line(s) of code
keymap("n", "<A-j>", ":m .+1<cr>==", opts)
keymap("n", "<A-down>", ":m .+1<cr>==", opts)
keymap("i", "<A-j>", "<Esc>:m .+1<cr>==gi", opts)
keymap("i", "<A-down>", "<Esc>:m .+1<cr>==gi", opts)
keymap("x", "<A-j>", ":m '>+1<cr>gv=gv", opts)
keymap("x", "<A-down>", ":m '>+1<cr>gv=gv", opts)
keymap("n", "<A-k>", ":m .-2<cr>==", opts)
keymap("n", "<A-up>", ":m .-2<cr>==", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<cr>==gi", opts)
keymap("i", "<A-up>", "<Esc>:m .-2<cr>==gi", opts)
keymap("x", "<A-k>", ":m '<-2<cr>gv=gv", opts)
keymap("x", "<A-up>", ":m '<-2<cr>gv=gv", opts)

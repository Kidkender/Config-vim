-- lua/config/keymaps.lua
local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Telescope
local telescope_ok, telescope = pcall(require, "telescope.builtin")
if telescope_ok then
  map("n", "<leader>ff", telescope.find_files, { desc = "Find Files" })
  map("n", "<leader>fg", telescope.live_grep, { desc = "Live Grep" })
  map("n", "<leader>fb", telescope.buffers, { desc = "Find Buffers" })
  map("n", "<leader>fh", telescope.help_tags, { desc = "Help Tags" })
  map("n", "<leader>fs", telescope.git_status, { desc = "Git Status" })
  map("n", "<leader>fc", telescope.git_commits, { desc = "Git Commits" })
end

-- Save and Quit
map("n", "<leader>w", "<cmd>update<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Exit insert mode
map("i", "jk", "<esc>", { desc = "Exit insert mode" })

-- Window splitting
map("n", "<leader>ñ", "<cmd>vsplit<cr>", { desc = "Split window vertically" })
map("n", "<leader>p", "<cmd>split<cr>", { desc = "Split window horizontally" })

-- NeoTree
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Explorer" })
map("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus Explorer" })

-- Buffer navigation
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<s-tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

-- Terminal
map("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "Terminal horizontal" })
map("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Terminal vertical" })

-- Markdown Preview
map("n", "<leader>m", "<cmd>MarkdownPreview<cr>", { desc = "Markdown Preview" })
map("n", "<leader>mn", "<cmd>MarkdownPreviewStop<cr>", { desc = "Stop Markdown Preview" })

-- Window Navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })

-- Resize Windows
map("n", "<C-Left>", "<C-w><", { desc = "Decrease width" })
map("n", "<C-Right>", "<C-w>>", { desc = "Increase width" })
map("n", "<C-Up>", "<C-w>+", { desc = "Increase height" })
map("n", "<C-Down>", "<C-w>-", { desc = "Decrease height" })

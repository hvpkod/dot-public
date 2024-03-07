-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Remove search highlight
vim.api.nvim_set_keymap("n", "<Esc><Esc>", ":noh<CR>", { noremap = true })

-- Keybindings for Trouble diagnostics
-- Lua
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

vim.g.UltiSnipsJumpForwardTrigger = "<Tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"

-- Save with leader key + w
vim.api.nvim_set_keymap("n", "<leader>w", "<cmd>w<cr>", { noremap = true, silent = false })

-- Bind Home key to move cursor to the start of the line
vim.api.nvim_set_keymap("n", "<Home>", "0", { noremap = true, silent = true })

-- Bind End key to move cursor to the end of the line
vim.api.nvim_set_keymap("n", "<End>", "$", { noremap = true, silent = true })

-- Map _ to "_ in both normal and visual modes
vim.api.nvim_set_keymap("n", "_", '"_', { noremap = true })
vim.api.nvim_set_keymap("v", "_", '"_', { noremap = true })

-- Telescope
-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

-- Define a helper function for key mappings
local function nmap(lhs, rhs, desc)
	vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- Set up LSP key mappings
nmap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", "[R]e[n]ame")
nmap("<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", "[C]ode [A]ction")
nmap("gd", "<cmd>lua vim.lsp.buf.definition()<cr>", "[G]oto [D]efinition")
nmap("gr", '<cmd>lua require("telescope.builtin").lsp_references()<cr>', "[G]oto [R]eferences")
nmap("gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", "[G]oto [I]mplementation")
nmap("<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type [D]efinition")
nmap("<leader>ds", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', "[D]ocument [S]ymbols")
nmap("<leader>ws", '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<cr>', "[W]orkspace [S]ymbols")
nmap("K", "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Documentation")
nmap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Documentation")
nmap("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", "[G]oto [D]eclaration")
nmap("<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "[W]orkspace [A]dd Folder")
nmap("<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "[W]orkspace [R]emove Folder")
nmap(
	"<leader>wl",
	"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
	"[W]orkspace [L]ist Folders"
)

-- Map Oil to <leader>e
vim.api.nvim_set_keymap(
	"n",
	"<leader>e",
	'<cmd>lua require("oil").toggle_float()<cr>',
	{ noremap = true, silent = true }
)

-- -- Press 'S' for quick find/replace for the word under the cursor
-- vim.api.nvim_set_keymap('n', 'S', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
-- 	{ noremap = true, silent = true })

-- Open Spectre for global find/replace
vim.api.nvim_set_keymap("n", "<leader>S", '<cmd>lua require("spectre").toggle()<cr>', { noremap = true, silent = true })

-- Harpoon keybinds --
-- Open harpoon ui
vim.api.nvim_set_keymap(
	"n",
	"<leader>ho",
	"<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
	{ noremap = true, silent = true }
)

-- Add current file to harpoon
vim.api.nvim_set_keymap(
	"n",
	"<leader>ha",
	"<cmd>lua require('harpoon.mark').add_file()<CR>",
	{ noremap = true, silent = true }
)

-- Remove current file from harpoon
vim.api.nvim_set_keymap(
	"n",
	"<leader>hr",
	"<cmd>lua require('harpoon.mark').rm_file()<CR>",
	{ noremap = true, silent = true }
)

-- Remove all files from harpoon
vim.api.nvim_set_keymap(
	"n",
	"<leader>hc",
	"<cmd>lua require('harpoon.mark').clear_all()<CR>",
	{ noremap = true, silent = true }
)

-- Quickly jump to harpooned files
vim.api.nvim_set_keymap(
	"n",
	"<leader>1",
	"<cmd>lua require('harpoon.ui').nav_file(1)<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>2",
	"<cmd>lua require('harpoon.ui').nav_file(2)<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>3",
	"<cmd>lua require('harpoon.ui').nav_file(3)<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>4",
	"<cmd>lua require('harpoon.ui').nav_file(4)<CR>",
	{ noremap = true, silent = true }
)

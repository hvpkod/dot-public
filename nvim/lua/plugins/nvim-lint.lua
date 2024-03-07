return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "ruff", "pydocstyle" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		-- Config what to show virtual_text, underline or symbol.
		local ns_ruff = require("lint").get_namespace("ruff")
		vim.diagnostic.config({ virtual_text = false, underline = false }, ns_ruff)

		local ns_pydoc = require("lint").get_namespace("pydocstyle")
		vim.diagnostic.config({ virtual_text = false, underline = false }, ns_pydoc)

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>d", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}

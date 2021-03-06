----------------------------------------
-- LSP KEYBINDINGS --
----------------------------------------
vim.api.nvim_create_autocmd("User", {
	pattern = "LspAttached",
	desc = "LSP actions",
	callback = function()
		local bufmap = function(mode, lhs, rhs)
			local opts = { buffer = true }
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		-- Displays hover information about the symbol under the cursor
		bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")

		-- Jump to the definition
		bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")

		-- Jump to declaration
		bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")

		-- Lists all the implementations for the symbol under the cursor
		bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")

		-- Jumps to the definition of the type symbol
		bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")

		-- Lists all the references
		bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")

		-- Displays a function's signature information
		bufmap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

		-- Renames all references to the symbol under the cursor
		bufmap("n", "gR", "<cmd>lua vim.lsp.buf.rename()<cr>")

		-- Selects a code action available at the current cursor position
		bufmap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>")
		bufmap("x", "ga", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")

		-- Show diagnostics in a floating window
		bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

		-- Move to the previous diagnostic
		bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")

		-- Move to the next diagnostic
		bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
	end,
})

----------------------------------------
-- EMMET --
----------------------------------------
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "css", "*scss", "javascriptreact" },
	command = "EmmetInstall",
	group = vim.api.nvim_create_augroup("EmmetInstall", {}),
})

----------------------------------------
-- HIGHLIGHT ON YANK --
----------------------------------------
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = { "*" },
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 300,
		})
	end,
	group = vim.api.nvim_create_augroup("HighlightOnYank", {}),
})

----------------------------------------
-- INSERT MODE INDICATOR --
----------------------------------------
vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = { "*" },
	callback = function()
		vim.cmd([[
      let s:configuration = edge#get_configuration()
      let s:palette = edge#get_palette(s:configuration.style, s:configuration.dim_foreground, s:configuration.colors_override)
      call edge#highlight('CursorLineNr', s:palette.bg0, s:palette.blue, "bold")
    ]])
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = { "*" },
	callback = function()
		vim.cmd([[
      let s:configuration = edge#get_configuration()
      let s:palette = edge#get_palette(s:configuration.style, s:configuration.dim_foreground, s:configuration.colors_override)
      call edge#highlight('CursorLineNr', s:palette.purple, s:palette.none, "bold")
    ]])
	end,
})

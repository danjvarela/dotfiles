local tsconfig_exists, tsconfig = pcall(require, "nvim-treesitter.configs")
if not tsconfig_exists then
	return
end

tsconfig.setup({
	ensure_installed = "all",
	rainbow = { enable = true },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
		-- disable = { "html" } -- Known bug not fixed yet: hovering cursor on a specific line removes highlight
	},
	indent = {
		enable = true,
		disable = { "ruby", "html" },
	},
	autopairs = { enable = true },
	context_commentstring = { enable = true },
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		swap = {
			enable = true,
			swap_next = { ["]p"] = "@parameter.inner" },
			swap_previous = { ["[p"] = "@parameter.inner" },
		},
	},
	textsubjects = {
		enable = true,
		prev_selection = ",",
		keymaps = {
			["."] = "textsubjects-smart",
			[";"] = "textsubjects-container-outer",
			["i;"] = "textsubjects-container-inner",
		},
	},
})

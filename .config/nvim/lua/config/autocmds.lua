-- Disable autoformat
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "*" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- Open folds by default
-- vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost", "BufWinEnter"}, {
--   pattern = { "*" },
--   command = "normal zR",
--   group = vim.api.nvim_create_augroup("OpenTreesitterFolds", {})
-- })

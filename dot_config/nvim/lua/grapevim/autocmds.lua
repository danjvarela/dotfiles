local M = {}

function M.load()
  -- Call PackerSync whenever the plugins table is saved
  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "plugins.lua" },
    callback = function()
      local file = vim.fn.expand("<afile>")
      vim.cmd("source " .. file)
      package.loaded["grapevim.plugins"] = nil
      require("packer").startup(function(use)
        for _, v in pairs(require("grapevim.plugins")) do
          use(v)
        end
        require("packer").sync()
      end)
    end,
    group = vim.api.nvim_create_augroup("PluginSync", {})
  })

  -- Install emmet on html and eruby files
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "html", "eruby" },
    command = "EmmetInstall",
    group = vim.api.nvim_create_augroup("InstallEmmet", {})
  })

  -- Set the colorscheme configuration before setting the colorscheme
  -- Set the wal colorscheme before setting the colorscheme
  vim.api.nvim_create_autocmd({ "ColorschemePre" }, {
    pattern = { "*" },
    callback = function()
      local colorscheme = vim.fn.expand("<amatch>")

      -- Set colorscheme configs
      if colorscheme == "everforest" then
        vim.g.everforest_background = "hard"
        vim.g.everforest_transparent_background = 2
        vim.g.everforest_ui_contrast = "high"
      end

      if colorscheme == "edge" then
        vim.g.edge_transparent_background = 2
      end
    end
  })

  -- Format buffer before writing it to a file
  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    callback = function()
      vim.lsp.buf.formatting_sync({})
    end,
    group = vim.api.nvim_create_augroup("FormatBeforeSave", {})
  })

  vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    pattern = { "*" },
    callback = function()
      vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
    end,
    group = vim.api.nvim_create_augroup("HighlightOnYank", {})
  })
end

return M

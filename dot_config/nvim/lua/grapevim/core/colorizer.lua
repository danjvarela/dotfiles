local M = {}

function M.setup()
  local colorizer_exists, colorizer = pcall(require, "colorizer")
  if not colorizer_exists then
    return
  end

  colorizer.setup({
    "*",
    css = { css = true },
    scss = { css = true }
  }, { names = false })
end

return M

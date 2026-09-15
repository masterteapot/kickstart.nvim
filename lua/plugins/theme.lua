-- ~/.config/nvim/lua/plugins/theme.lua
-- Dynamically loads system theme but strips LazyVim dependencies

local theme_file = vim.fn.expand("~/.local/state/omarchy/current/theme/neovim.lua")
local ok, theme_data = pcall(dofile, theme_file)

if not ok or not theme_data then
  return {}
end

-- Filter out the LazyVim dependency to avoid framework crashes
-- since we are using a kickstart-based config.
local filtered_theme = {}
for _, spec in ipairs(theme_data) do
  if spec[1] ~= "LazyVim/LazyVim" then
    table.insert(filtered_theme, spec)
  end
end

return filtered_theme

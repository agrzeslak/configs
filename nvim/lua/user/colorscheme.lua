local colorscheme = "gruvbox"

vim.g.gruvbox_italic = 1
vim.g.gruvbox_bold = 0
vim.g.gruvbox_italicize_statements = 1
vim.g.gruvbox_italicize_conditionals = 1
vim.g.gruvbox_italicize_repeats = 1
vim.g.gruvbox_italicize_exceptions = 1
vim.g.gruvbox_italicize_keywords = 1
vim.g.gruvbox_sign_column = "bg0"
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_invert_selection = 0
vim.g.gruvbox_color_column = "dark0"
vim.g.gruvbox_cursorline = "dark0"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

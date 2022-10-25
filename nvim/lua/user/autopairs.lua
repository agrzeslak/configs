local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
    vim.notify("Could not load autopairs!")
    return
end

npairs.setup {
    check_ts = true,
    disable_filetype = { "TelescopePrompt", "spectre_panel" }, -- :echo &ft to get filetype
}

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    vim.notify("Could not load cmp for autopairs!")
    return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

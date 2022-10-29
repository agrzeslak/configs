local status_ok, leap = pcall(require, "leap")
if not status_ok then
    vim.notify("Could not load leap!")
    return
end

leap.add_default_mappings()

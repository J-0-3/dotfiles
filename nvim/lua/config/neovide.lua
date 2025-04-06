vim.o.guifont = "Jetbrains Mono:h15"
vim.g.neovide_scale_factor = 1.0
vim.g.neovide_cursor_trail_size = 0.1
vim.g.neovide_cursor_animate_command_line = false
vim.keymap.set("n", "<C-=>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.25
  change_scale_factor(1.25)
end)
vim.keymap.set("n", "<C-->", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * (1/1.25)
end)
vim.keymap.set("n", "F11", function()
    if vim.g.neovide_fullscreen then
        vim.g.neovide_fullscreen = false
    else
        vim.g.neovide_fullscreen = true
    end
end)

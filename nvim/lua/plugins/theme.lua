return {
    -- 'sainnhe/gruvbox-material', priority = 1000, lazy = false,
    -- config = function()
    --     vim.g.gruvbox_material_enable_italic = true
    --     vim.g.gruvbox_material_background = 'hard'
    --     vim.cmd.colorscheme('gruvbox-material')
    -- end
    -- 'navarasu/onedark.nvim', priority = 1000, lazy = false,
    --     config = function()
    --         local onedark = require('onedark')
    --         onedark.setup({
    --             style = 'dark'
    --         })
    --         onedark.load()
    --     end
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,
    priority = 1000,
    config = function()
        require('github-theme').setup({})
        vim.cmd.colorscheme('github_dark')
    end
}

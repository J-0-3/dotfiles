return {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find files" },
        { "<leader>d", function() require('telescope.builtin').diagnostics({line_width = 100}) end, desc = "Search workspace diagnostics" },
        { "<leader>D", function() require('telescope.builtin').diagnostics({line_width = 100, bufnr=0}) end, desc = "Search buffer diagnostics" },
        { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
        { "<leader>S", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Search buffer symbols"},
        { "<leader>s", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Search workspace symbols"},
        { "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code actions"},
        { "gr", "<cmd>Telescope lsp_references<cr>", desc = "Go to references"},
        { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definition(s)"},
        { "gD", "<cmd>Telescope lsp_type_definition<cr>", desc = "Go to type definition(s)"},
        { "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Go to implementation(s)"}
    },
    config = function()
        local telescope = require('telescope')
        telescope.setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {
                    }
                }
            }
        })
        telescope.load_extension("ui-select")
    end
}

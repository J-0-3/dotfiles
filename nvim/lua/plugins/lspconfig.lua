return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require('lspconfig')
        lspconfig.rust_analyzer.setup {
            settings = {
                ['rust-analyzer'] = {
                      checkOnSave = {
                           command = "clippy",
                           extraArgs = { "--all", "--", "-Adead_code" }
                       },
                       check = {
                           command = "clippy",
                           extraArgs = { "--all", "--", "-Adead_code" }
                       }
                }
            }
        }
        lspconfig.clangd.setup {

        }
        lspconfig.ruff.setup {
            init_options = {
                settings = {
                    logLevel = 'info'
                }
            }
        }
        lspconfig.basedpyright.setup {
            settings = {
                basedpyright = {
                    disableOrganizeImports = true,
                    analysis = {
                        autoImportCompletions = true,
                        autoSearchPaths = true
                    }
                }
            }
        }
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client == nil then
                    return
                end
                if client.name == 'ruff' then
                    client.server_capabilities.hoverProvider = false
                end
                if client:supports_method('textDocument/formatting') and client.name ~= 'pyright' then
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({bufnr = args.buf, id = client.id})
                            if client.name == "ruff" then
                                vim.lsp.buf.code_action({
                                    context = { only = {"source.organizeImports" } },
                                    apply = true
                                })
                                vim.wait(50)
                            end
                        end,
                    })
                end
                vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                    vim.lsp.diagnostic.on_publish_diagnostics,
                    {
                        virtual_text = false,
                        signs = true,
                        update_in_insert = false,
                        underline = true
                    }
                )
                vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                    vim.lsp.handlers.hover, {
                        border = "single"
                    }
                )
                vim.diagnostic.config({float = {
                    border = "single"
                }})
            end,
            -- desc = 'LSP: Disable hover capability from Ruff',
        })
        vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float(nil, {scope = "cursor", focus = false}) end, { desc = "Show diagnostic"})
        vim.keymap.set("i", "<c-k>", function() vim.lsp.buf.signature_help() end, { desc = "Show signature help"})
        --[[ vim.opt.updatetime = 100
        vim.api.nvim_create_autocmd({ 'CursorHold' }, {
            group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
            callback = function()
                local current_cursor = vim.api.nvim_win_get_cursor(0)
                local last_popup_cursor = vim.w.lsp_diagnostics_last_cursor or {nil, nil}
                if not (current_cursor[1] == last_popup_cursor[1] and current_cursor[2] == last_popup_cursor[2]) then
                    vim.w.lsp_diagnostics_last_cursor = current_cursor
                    vim.diagnostic.open_float(0, {scope = "cursor", focus = false, focusable = false })
                end
            end
        }) ]]
    end
}

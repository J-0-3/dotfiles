vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = false
vim.opt.wrap = false
vim.opt.colorcolumn = "80,120"
vim.opt.pumheight = 10
vim.opt.completeopt = { 'menu' }
if vim.env.TERM == 'linux' then
    vim.opt.termguicolors = false
else
    vim.opt.termguicolors = true
end
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.modeline = false
vim.opt.modelineexpr = false
vim.opt.secure = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevelstart=99

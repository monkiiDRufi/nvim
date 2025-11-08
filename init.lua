require("config.core").dependencies.install()
require("config.autocmd")
require("lazy").setup({
    { import = "config.plugins" }
})

vim.cmd([[colorscheme gruvbox]])

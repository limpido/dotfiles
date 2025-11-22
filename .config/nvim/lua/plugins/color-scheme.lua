return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('catppuccin-macchiato')
        end
    },
    -- {
    --     'AlexvZyl/nordic.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.cmd.colorscheme('nordic')
    --     end
    -- },
    -- {
    --     'sainnhe/everforest',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.g.everforest_enable_italic = true
    --         vim.cmd.colorscheme('everforest')
    --     end
    -- }, 
    -- {
    --     "EdenEast/nightfox.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         vim.cmd("colorscheme duskfox")
    --     end
    -- },
}

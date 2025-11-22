return {
    'nvim-tree/nvim-tree.lua',
    lazy = false,  -- load during startup
    version = "*",
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
        -- disable netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwplugin = 1
        require('nvim-tree').setup {}
        -- key mapping
        vim.keymap.set({'n', 'i'}, '<C-b>', ':NvimTreeToggle<cr>')
    end
}

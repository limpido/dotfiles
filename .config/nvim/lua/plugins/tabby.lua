return {
    'nanozuki/tabby.nvim',
    ---@type TabbyConfig
    config = function()
        vim.keymap.set({'n', 'v'}, "<leader>cc", ':tabclose<CR>')
        vim.keymap.set({'n', 'v'}, "<leader>pp", ':tabprevious<CR>')
        vim.keymap.set({'n', 'v'}, "<leader>nn", ':tabnext<CR>')
    end
  }
return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim'
        },
    },
    {
        "hrsh7th/nvim-cmp",
        version = false,
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind.nvim",
        },
        config = function()
          local cmp = require("cmp")

          cmp.setup({
            -- Mapping configuration
            mapping = cmp.mapping.preset.insert({
              ["<C-b>"] = cmp.mapping.scroll_docs(-4),
              ["<C-f>"] = cmp.mapping.scroll_docs(4),
              ["<C-Space>"] = cmp.mapping.complete(), -- Manually trigger completion
              ["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace }), -- Enter to confirm
              ["<Tab>"] = cmp.mapping.select_next_item(), -- Tab to go down
              ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Shift+Tab to go up
            }),
            -- Sources for completion
            sources = cmp.config.sources({
              { name = "nvim_lsp" }, -- Prioritize LSP
              { name = "buffer" },
              { name = "path" },
            }),
          })
        end,
    },
}

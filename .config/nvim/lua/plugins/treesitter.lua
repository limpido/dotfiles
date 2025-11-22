return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {"c", "cpp", "python", "go", "rust", "javascript", "typescript", "lua",
		"toml", "yaml", "vim", "json", "regex", "markdown", "markdown_inline", "latex", "make",
		"git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
		"fish", "bash"},

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },

            indent = { enable = true }
        })
    end
}

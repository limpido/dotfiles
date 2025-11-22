-- plugins
require('config.lazy')


-- util functions
local function keymap(mode, lhs, rhs, options)
    if type(lhs) == 'table' then
        for _, key in pairs(lhs) do
            keymap(mode, key, rhs, options)
        end
        return
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

local function noremap(mode, lhs, rhs, options)
    local opts = options or {}
    opts['remap'] = false
    keymap(mode, lhs, rhs, opts)
end

local function noremap_all(lhs, rhs, options)
    noremap({'n', 'i', 'v'}, lhs, rhs, options)
end


-- general settings
vim.o.mouse = 'a'
vim.o.number = true
vim.o.autoindent = true
vim.o.cindent = true
vim.o.shiftwidth = 4
vim.o.splitright = true
vim.o.splitbelow = true

-- auto detect file changes
vim.o.autoread = true

-- enable 24-bit colour
vim.opt.termguicolors = true

-- always display tabline
vim.o.showtabline = 2


-- common Emacs-like editor hotkeys
-- copy
noremap('n', {'<C-c>', '<C-S-c>'}, '"+yy')
noremap('v', {'<C-c>', '<C-S-c>'}, '"+y')
-- cut
noremap('n', '<C-x>', 'dd')
noremap('v', '<C-x>', '"+d')
-- paste
noremap('n', '<C-v>', '"+p')
noremap('n', '<C-S-v>', '"+p')
-- save
noremap_all('<C-s>', '<cmd>wa<cr>')
-- quit
noremap_all('<C-q>', '<cmd>qa<cr>')
-- search
noremap('n', '<C-f>', 'f')
noremap('v', '<C-f>', [[y/\V<C-R>=escape(@",'/\')<cr><cr>]])
-- undo / redo
noremap_all('<C-z>', '<cmd>undo<cr>')
noremap_all('<C-A-z>', '<cmd>redo<cr>')
-- shift indentation
noremap('v', '<Tab>', '>gv')
noremap('n', '<Tab>', '>>')
noremap('v', '<S-Tab>', '<gv')
noremap('n', '<S-Tab>', '<<')
noremap('i', '<S-Tab>', '<C-d>')
-- swap lines
noremap_all('<C-Up>', '<cmd>m -2<cr>')
noremap_all('<C-Down>', '<cmd>m +1<cr>')
-- select all
noremap('n', '<C-a>', 'gg^vG$')
noremap({'i', 'x', 'v'}, '<C-a>', '<esc>gg^vG$')
-- delete line
-- noremap('n', '<bs>', '"_dd')
-- noremap('v', '<bs>', '"_d')
-- go to line begin / end
-- noremap({'n', 'v'}, '<C-a>', '^')
-- noremap('i', '<C-a>', '<esc>^i')
-- noremap({'n', 'v'}, '<C-e>', '$')
-- noremap('i', '<C-e>', '<esc>$a')
-- delete word
-- noremap('n', {'<C-w>', '<C-h>', '<C-bs>'}, 'vB"_d')
-- noremap('i', {'<C-h>', '<C-bs>'}, '<C-w>')
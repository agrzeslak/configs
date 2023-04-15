vim.opt.shell = "/bin/bash" -- Fish doesn't play well with others
vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"   -- Yank/paste to/from system clipboard
vim.opt.encoding = "utf-8"
vim.g.nojoinspaces = true
vim.g.noshowmode = true
vim.opt.showmode = false
vim.opt.wrap = false
vim.opt.scrolloff = 2
vim.opt.signcolumn = "yes"
vim.opt.timeoutlen = 300
vim.opt.splitbelow = true   -- Open new horizontal split below
vim.opt.splitright = true
vim.opt.undodir= vim.fn.getenv("HOME") .. "/.vimundodir"
vim.opt.undofile = true
vim.opt.wildmode = "list:longest"   -- List options and complete to longest match
vim.opt.wildignore = ".hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor"
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
-- tc: wrap text and comments using textwidth
-- r: continue comments when pressing ENTER in I mode
-- q: enable formatting of comments with gq
-- n: detect lists for formatting
-- b: auto-wrap in insert mode, and do not wrap old long lines
vim.opt.formatoptions = "tcrqnb"
vim.opt.ignorecase = true
vim.opt.smartcase = true    -- Case sensitive search if upper case characters are provided
vim.opt.gdefault = true     -- /g suffix is implied when search and replacing, override with /g
vim.opt.cursorline = true

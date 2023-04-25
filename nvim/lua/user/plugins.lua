-- Install Packer if not already installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Restart Neovim whenever plugins.lua changes
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("Packer not available!")
    return
end

-- Make Packer use a pop-up window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Plugins
-- TODO: list requirements (LSP comes to mind)
return packer.startup(function(use)
    -- Packer manages itself
    use "wbthomason/packer.nvim"

    -- Libraries
    use "nvim-lua/plenary.nvim"

    -- VIM enhancements
    use "ciaranm/securemodelines"
    use "editorconfig/editorconfig-vim"
    use "airblade/vim-rooter"
    use "ggandor/leap.nvim"
    use "windwp/nvim-autopairs"
    use "numToStr/Comment.nvim"
    use {
        "JoosepAlviste/nvim-ts-context-commentstring",
        requires = { "nvim-treesitter/nvim-treesitter" }
    }
    use "lewis6991/gitsigns.nvim"
    use "preservim/tagbar"

    -- GUI enhancements
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use "machakann/vim-highlightedyank"
    use "andymass/vim-matchup"
    use "RRethy/vim-illuminate"
    -- use "gruvbox-community/gruvbox"
    use { "agrzeslak/gruvbox", branch = "new" }
    -- use "/home/andrzej/dev/others/gruvbox"

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        requires = { "nvim-lua/plenary.nvim" }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "nvim-treesitter/playground"

    -- Semantic language support
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "mfussenegger/nvim-dap"
    use "jose-elias-alvarez/null-ls.nvim"
    use "neovim/nvim-lspconfig"
    use "nvim-lua/lsp_extensions.nvim"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/nvim-cmp"
    use "ray-x/lsp_signature.nvim"

    -- Only because nvim-cmp _requires_ snippets
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"

    -- Syntactic language support
    use "cespare/vim-toml"
    use "godlygeek/tabular"
    use "preservim/vim-markdown"

    -- ASCII diagrams
    use "jbyuki/venn.nvim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)

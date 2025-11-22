-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- TODO: Make the syntax for the use calls consistent
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope (fuzzy file finder)
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Harpoon (file navigation)
    use { "theprimeagen/harpoon" }

    -- Undo Tree (A very good history management tool)
    use { "mbbill/undotree" }

    -- Catpuccin (colorscheme)
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Treesitter (for syntax highlighting)
    use { 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}}
    use { 'nvim-treesitter/playground' }

    -- Git Integration
    use("tpope/vim-fugitive");

    -- LSP Zero for LSP management
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers
            --- from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            {'neovim/nvim-lspconfig'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    -- For toggling comments with a command
    use("numToStr/Comment.nvim");

end)


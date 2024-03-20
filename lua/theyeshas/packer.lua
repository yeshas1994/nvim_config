vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        requires = { {'nvim-lua/plenary.nvim'} }
    }


    -- treesitter
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use("nvim-treesitter/nvim-treesitter-context");
    use 'nvim-treesitter/playground'

    -- harpoon
    use 'ThePrimeagen/harpoon'

    -- undo-tree
    use('mbbill/undotree')

    -- vim-fugitive
    use('tpope/vim-fugitive')

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use("eandrju/cellular-automaton.nvim")
    -- plugins for snippets
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'nvim-tree/nvim-tree.lua'
    use 'airblade/vim-gitgutter'
    use 'vim-scripts/DoxygenToolkit.vim'
    use 'christoomey/vim-tmux-navigator'
    use 'alec-gibson/nvim-tetris'

    use 'David-Kunz/gen.nvim'
    -- LSP
    -- use {
        -- 'VonHeikemen/lsp-zero.nvim',
        -- branch = 'v1.x',
        -- requires = {
            --   		  {'neovim/nvim-lspconfig'},
            --       	  {'williamboman/mason.nvim'},
            --       	  {'williamboman/mason-lspconfig.nvim'},

            --       	  -- Autocompletion
            --       	  {'hrsh7th/nvim-cmp'},
            --       	  {'hrsh7th/cmp-buffer'},
            --       	  {'hrsh7th/cmp-path'},
            --       	  {'saadparwaiz1/cmp_luasnip'},
            --       	  {'hrsh7th/cmp-nvim-lsp'},
            --       	  {'hrsh7th/cmp-nvim-lua'},

            --       	  -- Snippets
            --       	  {'L3MON4D3/LuaSnip'},
            --       	  {'rafamadriz/friendly-snippets'},
            -- 	}
            -- }

            -- color scheme
            use {
                "rebelot/kanagawa.nvim",
                as = 'kangawa',
                config = function()
                    vim.cmd('colorscheme kanagawa')
                end
            }
        end)

return {
    {
        'akinsho/bufferline.nvim',
        config = true
        -- config = function()
        --    require("bufferline").setup()
        -- end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = true
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true
    },
    {
        "goolord/alpha-nvim",
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    },
    {
        "RRethy/vim-illuminate",
        config = function()
            require('illuminate').configure()
        end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            require("neo-tree").setup()
            vim.keymap.set({ "n", "v" }, "<leader>e", [[<cmd>Neotree toggle<CR>]])
        end

    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        "echasnovski/mini.ai",
        config = true,
    },
    {
        "echasnovski/mini.comment",
        config = true,
    },
    {
        "echasnovski/mini.animate",
        config = true,
    }
}

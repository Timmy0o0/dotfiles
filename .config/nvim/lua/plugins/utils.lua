return {
    -- {
    --     "folke/persistence.nvim",
    --     event = "BufReadPre", -- this will only start session saving when an actual file was opened
    --     config = function()
    --         require("persistence").setup()
    --         -- restore the session for the current directory
    --         vim.api.nvim_set_keymap("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], {})
    --         -- restore the last session
    --         vim.api.nvim_set_keymap("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {})
    --         -- stop Persistence => session won't be saved on exit
    --         vim.api.nvim_set_keymap("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], {})
    --     end
    -- },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
            -- key  f zz
        },
    },
    {
        "kamykn/spelunker.vim",
        event = "VeryLazy",
        config = function()
            vim.g.spelunker_check_type = 2

            vim.api.nvim_set_keymap('n', '<leader>sa', '<cmd>SpelunkerAddAll<cr>', { noremap = true })
        end
    },
    {
        "ellisonleao/glow.nvim",
        event = "VeryLazy",
        config = false
    },
    {
        "iamcco/markdown-preview.nvim",
        event = "VeryLazy",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
                -- Manual mode doesn't automatically change your root directory, so you have
                -- the option to manually do so using `:ProjectRoot` command.
                manual_mode = false,

                -- Methods of detecting the root directory. **"lsp"** uses the native neovim
                -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
                -- order matters: if one is not detected, the other is used as fallback. You
                -- can also delete or rearangne the detection methods.
                detection_methods = { "lsp", "pattern" },

                -- All the patterns used to detect root dir, when **"pattern"** is in
                -- detection_methods
                patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".nvim.lua", ".neoconf.json" },

                -- Table of lsp clients to ignore by name
                -- eg: { "efm", ... }
                ignore_lsp = {},

                -- Don't calculate root dir on specific directories
                -- Ex: { "~/.cargo/*", ... }
                exclude_dirs = {},

                -- Show hidden files in telescope
                show_hidden = false,

                -- When set to false, you will get a message when project.nvim changes your
                -- directory.
                silent_chdir = true,

                -- What scope to change the directory, valid options are
                -- * global (default)
                -- * tab
                -- * win
                scope_chdir = 'global',

                -- Path where project.nvim will store the project history for use in
                -- telescope
                datapath = vim.fn.stdpath("data"),

                vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>Telescope projects<cr>", { desc = "[T][P] Find projects" })

            }
        end
    },
    {
        "sustech-data/wildfire.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("wildfire").setup()
        end,
    },
    {
        -- dependencies treesitter
        "windwp/nvim-ts-autotag",
        event = "VeryLazy",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    {
        'rmagatti/alternate-toggler',
        event = { "BufReadPost" }, -- lazy load after reading a buffer
        config = function()
            require("alternate-toggler").setup {
                alternates = {
                    ["=="] = "!="
                }
            }

            vim.keymap.set("n", "<leader>i", "<cmd>lua require('alternate-toggler').toggleAlternate()<cr>",
                { desc = "Toggle Bool" })
        end,
    }
}

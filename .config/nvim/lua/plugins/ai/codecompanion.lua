return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
  },
  event = "VeryLazy",
  keys = {
    { "<leader>a", "", desc = "ai" },
    { "<leader>ac", "<cmd>CodeCompanionChat<cr>", desc = "Open CodeCompanion Chat", mode = { "n", "v" } },
    { "ga", "<cmd>CodeCompanionChat Add<cr>", desc = "Add CodeCompanion Chat", mode = { "v" } },
    { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "Open CodeCompanion Actions", mode = { "n", "v" } },
    { "<leader>ap", "<cmd>CodeCompanion<cr>", desc = "Open CodeCompanion" },
    { "<leader>ax", "<cmd>CodeCompanionCmd<cr>", desc = "Open CodeCompanion Command" },
  },
  opts = {
    adapters = {
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          name = "deepseek-r1:1.5b", -- Give this adapter a different name to differentiate it from the default ollama adapter
          schema = {
            model = {
              default = "deepseek-r1:1.5b",
            },
            num_ctx = {
              default = 16384,
            },
            num_predict = {
              default = -1,
            },
          },
        })
      end,
      deepseek = function()
        return require("codecompanion.adapters").extend("deepseek", {
          env = {
            api_key = "DEEPSEEK_API_KEY", -- See note above about using cmd for secure API key storage
          },
          schema = {
            model = {
              default = "deepseek-chat",
              -- default = "deepseek-reasoner",
            },
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "deepseek",
        -- adapter = "ollama",
        slash_commands = {
          ["buffer"] = {
            callback = "strategies.chat.slash_commands.buffer",
            description = "Insert open buffers",
            opts = {
              contains_code = true,
              provider = "fzf_lua", -- default|telescope|mini_pick|fzf_lua
            },
          },
          ["fetch"] = {
            callback = "strategies.chat.slash_commands.fetch",
            description = "Insert URL contents",
            opts = {
              adapter = "jina",
            },
          },
          ["file"] = {
            callback = "strategies.chat.slash_commands.file",
            description = "Insert a file",
            opts = {
              contains_code = true,
              max_lines = 1000,
              provider = "fzf_lua", -- default|telescope|mini_pick|fzf_lua
            },
          },
          ["help"] = {
            callback = "strategies.chat.slash_commands.help",
            description = "Insert content from help tags",
            opts = {
              contains_code = false,
              max_lines = 128, -- Maximum amount of lines to of the help file to send (NOTE: Each vimdoc line is typically 10 tokens)
              provider = "fzf_lua", -- telescope|mini_pick|fzf_lua
            },
          },
          ["now"] = {
            callback = "strategies.chat.slash_commands.now",
            description = "Insert the current date and time",
            opts = {
              contains_code = false,
            },
          },
          ["symbols"] = {
            callback = "strategies.chat.slash_commands.symbols",
            description = "Insert symbols for a selected file",
            opts = {
              contains_code = true,
              provider = "fzf_lua", -- default|telescope|mini_pick|fzf_lua
            },
          },
          ["terminal"] = {
            callback = "strategies.chat.slash_commands.terminal",
            description = "Insert terminal output",
            opts = {
              contains_code = false,
            },
          },
        },
        keymaps = {
          options = {
            modes = {
              n = "?",
            },
            callback = "keymaps.options",
            description = "Options",
            hide = true,
          },
          completion = {
            modes = {
              i = "<Tab>",
            },
            index = 1,
            callback = "keymaps.completion",
            description = "Completion Menu",
          },
          send = {
            modes = {
              n = { "<CR>", "<C-s>" },
              i = "<C-s>",
            },
            index = 2,
            callback = "keymaps.send",
            description = "Send",
          },
          regenerate = {
            modes = {
              n = "gr",
            },
            index = 3,
            callback = "keymaps.regenerate",
            description = "Regenerate the last response",
          },
          close = {
            modes = {
              n = "q",
              i = "<C-q>",
            },
            index = 4,
            callback = "keymaps.close",
            description = "Close Chat",
          },
          stop = {
            modes = {
              n = "<C-c>",
            },
            index = 5,
            callback = "keymaps.stop",
            description = "Stop Request",
          },
          clear = {
            modes = {
              n = "gx",
            },
            index = 6,
            callback = "keymaps.clear",
            description = "Clear Chat",
          },
          codeblock = {
            modes = {
              n = "gC",
            },
            index = 7,
            callback = "keymaps.codeblock",
            description = "Insert Codeblock",
          },
          yank_code = {
            modes = {
              n = "gy",
            },
            index = 8,
            callback = "keymaps.yank_code",
            description = "Yank Code",
          },
          pin = {
            modes = {
              n = "gp",
            },
            index = 9,
            callback = "keymaps.pin_reference",
            description = "Pin Reference",
          },
          next_chat = {
            modes = {
              n = "}",
            },
            index = 10,
            callback = "keymaps.next_chat",
            description = "Next Chat",
          },
          previous_chat = {
            modes = {
              n = "{",
            },
            index = 11,
            callback = "keymaps.previous_chat",
            description = "Previous Chat",
          },
          next_header = {
            modes = {
              n = "]]",
            },
            index = 12,
            callback = "keymaps.next_header",
            description = "Next Header",
          },
          previous_header = {
            modes = {
              n = "[[",
            },
            index = 13,
            callback = "keymaps.previous_header",
            description = "Previous Header",
          },
          change_adapter = {
            modes = {
              n = "ga",
            },
            index = 14,
            callback = "keymaps.change_adapter",
            description = "Change adapter",
          },
          fold_code = {
            modes = {
              n = "gf",
            },
            index = 14,
            callback = "keymaps.fold_code",
            description = "Fold code",
          },
          debug = {
            modes = {
              n = "gd",
            },
            index = 15,
            callback = "keymaps.debug",
            description = "View debug info",
          },
          system_prompt = {
            modes = {
              n = "gs",
            },
            index = 16,
            callback = "keymaps.toggle_system_prompt",
            description = "Toggle the system prompt",
          },
        },
      },
      inline = {
        adapter = "deepseek",
        -- adapter = "ollama",
      },
      cmd = {
        adapter = "deepseek",
        -- adapter = "ollama",
      },
      agent = {
        adapter = "deepseek",
        -- adapter = "ollama",
      },
    },
    display = {
      diff = {
        enabled = true,
        close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
        -- layout = "vertical", -- vertical|horizontal split for default provider
        -- opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
        -- provider = "default",
        provider = "mini_diff",
      },
    },
    opts = {
      log_level = "ERROR", -- TRACE|DEBUG|ERROR|INFO
      language = "Chinese",
      send_code = true,
      system_prompt = function(opts)
        local language = opts.language or "English"
        return string.format(
          [[You are an AI programming assistant named "CodeCompanion".
You are currently plugged in to the Neovim text editor on a user's machine.

Your core tasks include:
- Answering general programming questions.
- Explaining how the code in a Neovim buffer works.
- Reviewing the selected code in a Neovim buffer.
- Generating unit tests for the selected code.
- Proposing fixes for problems in the selected code.
- Scaffolding code for a new workspace.
- Finding relevant code to the user's query.
- Proposing fixes for test failures.
- Answering questions about Neovim.
- Running tools.

You must:
- Follow the user's requirements carefully and to the letter.
- Keep your answers short and impersonal, especially if the user responds with context outside of your tasks.
- Minimize other prose.
- Use Markdown formatting in your answers.
- Include the programming language name at the start of the Markdown code blocks.
- Avoid including line numbers in code blocks.
- Avoid wrapping the whole response in triple backticks.
- Only return code that's relevant to the task at hand. You may not need to return all of the code that the user has shared.
- Use actual line breaks instead of '\n' in your response to begin new lines.
- Use '\n' only when you want a literal backslash followed by a character 'n'.
- All non-code responses must be in %s.
- All code responses must be in English.

When given a task:
1. Think step-by-step and describe your plan for what to build in pseudocode, written out in great detail, unless asked not to do so.
2. Output the code in a single code block, being careful to only return relevant code.
3. You should always generate short suggestions for the next user turns that are relevant to the conversation.
4. You can only give one reply for each conversation turn.]],
          language
        )
      end,
    },
  },
}

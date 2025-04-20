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
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          env = {
            api_key = "GEMINI_API_KEY", -- See note above about using cmd for secure API key storage
          },
          schema = {
            model = {
              -- default = "gemini-2.5-pro-exp-03-25",
              default = "gemini-2.5-flash-preview-04-17",
            },
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "gemini",
        -- adapter = "deepseek",
        slash_commands = {
          ["buffer"] = {
            callback = "strategies.chat.slash_commands.buffer",
            description = "Insert open buffers",
            opts = {
              contains_code = true,
              provider = "fzf_lua", -- default|telescope|mini_pick|fzf_lua
            },
          },
          ["file"] = {
            callback = "strategies.chat.slash_commands.file",
            description = "Insert a file",
            opts = {
              contains_code = true,
              max_lines = 1000,
              provider = "fzf_lua", -- default|telescope|fzf_lua
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
          ["symbols"] = {
            callback = "strategies.chat.slash_commands.symbols",
            description = "Insert symbols for a selected file",
            opts = {
              contains_code = true,
              provider = "fzf_lua", -- telescope|mini_pick|fzf_lua
            },
          },
        },
        keymaps = {
          completion = {
            modes = {
              i = "<Tab>",
            },
            index = 1,
            callback = "keymaps.completion",
            description = "Completion Menu",
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
          codeblock = {
            modes = {
              n = "gC",
            },
            index = 7,
            callback = "keymaps.codeblock",
            description = "Insert Codeblock",
          },
        },
      },
      inline = {
        adapter = "gemini",
        -- adapter = "deepseek",
      },
      cmd = {
        adapter = "gemini",
        -- adapter = "deepseek",
      },
      agent = {
        adapter = "gemini",
        -- adapter = "deepseek",
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
          [[You are an AI programming assistant named "CodeCompanion". You are currently plugged into the Neovim text editor on a user's machine.

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
- Keep your answers short and impersonal, especially if the user's context is outside your core tasks.
- Minimize additional prose unless clarification is needed.
- Use Markdown formatting in your answers.
- Include the programming language name at the start of each Markdown code block.
- Avoid including line numbers in code blocks.
- Avoid wrapping the whole response in triple backticks.
- Only return code that's directly relevant to the task at hand. You may omit code that isn’t necessary for the solution.
- Use actual line breaks in your responses; only use "\n" when you want a literal backslash followed by 'n'.
- All non-code text responses must be written in the %s language indicated.
- All code responses must be in English.

When given a task:
1. Think step-by-step and, unless the user requests otherwise or the task is very simple, describe your plan in detailed pseudocode.
2. Output the final code in a single code block, ensuring that only relevant code is included.
3. End your response with a short suggestion for the next user turn that directly supports continuing the conversation.
4. Provide exactly one complete reply per conversation turn.]],
          language
        )
      end,
    },
  },
}

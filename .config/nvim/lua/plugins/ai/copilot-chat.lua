return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = {
    -- model = "gpt-4o",
    model = "claude-3.5-sonnet",
    auto_insert_mode = false, -- Automatically enter insert mode when opening window and on new prompt
    -- insert_at_end = false, -- Move cursor to end of buffer when inserting text
    prompts = {
      Explain = {
        prompt = "> /COPILOT_EXPLAIN\n\nWrite an explanation for the selected code as paragraphs of text in Chinese.",
      },
      CommitUn = {
        prompt = "> #git:unstaged\n\nWrite commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
      },
    },
  },
}

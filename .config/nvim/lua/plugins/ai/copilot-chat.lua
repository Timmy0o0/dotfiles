return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = {
    model = "gpt-4o",
    -- model = "claude-3.5-sonnet",
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

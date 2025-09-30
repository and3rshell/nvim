return {
  "milanglacier/minuet-ai.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("minuet").setup({
      provider = "claude",
      request_timeout = 3,
      context_window = 16000,
      throttle = 1200, -- ogranicza spam do API
      debounce = 400,
      virtualtext = {
        auto_trigger_ft = { "sh", "php", "c", "go", "lua" },
        keymap = {
          accept = "<A-a>",
          accept_line = "<A-z>",
          accept_n_lines = nil,
          -- Cycle to next completion item, or manually invoke completion
          next = "<A-'>",
          -- Cycle to prev completion item, or manually invoke completion
          prev = "<A-;>",
          dismiss = "<A-\\>",
        },
        show_on_completion_menu = false,
      },
      provider_options = {
        claude = {
          max_tokens = 64,
          model = "claude-3-5-haiku-latest",
          stream = true,
          api_key = "ANTHROPIC_API_KEY",
          end_point = "https://api.anthropic.com/v1/messages",
        },
      },
    })
  end,
}

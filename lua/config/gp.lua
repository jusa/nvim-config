require("common")

require("gp").setup({
    openai_api_key = { "cat", openai_api_key_file() },
    providers = {
        openai = {
            disable = false,
            endpoint = "https://api.openai.com/v1/chat/completions",
        },
        azure = {},
        copilot = {},
        ollama = {},
        lmstudio = {},
        googleai = {},
        pplx = {},
        anthropic = {},
    },
    cmd_prefix = "Gp",
    curl_params = {},
    state_dir = vim.fn.stdpath("data"):gsub("/$", "") .. "/gp/persisted",
    chat_dir = vim.fn.stdpath("data"):gsub("/$", "") .. "/gp/chats",
    -- default agent names set during startup, if nil last used agent is used
    default_command_agent = nil,
    default_chat_agent = nil,
    chat_user_prefix = "💬:",
    chat_assistant_prefix = { "🤖:", "[{{agent}}]" },
    whisper = { disable = true },
    image = { disable = true },
})

vim.keymap.set('n', 'gpt', ':GpChatToggle popup<CR>', { noremap = true, silent = true })

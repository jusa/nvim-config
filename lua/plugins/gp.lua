require("common")

if openai_api_key_exists() then
    return {
        "robitx/gp.nvim",
    }
else
    return {}
end

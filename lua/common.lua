function openai_api_key_file()
    return vim.fn.expand("~/.openai_api_key")
end

function openai_api_key_exists()
   local f = io.open(openai_api_key_file(), "r")
   return f ~= nil and io.close(f)
end

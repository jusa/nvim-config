return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    init = function()
        vim.api.nvim_create_autocmd('BufEnter', {
            -- make a group to be able to delete it later
            group = vim.api.nvim_create_augroup('NeoTreeInit', {clear = true}),
            callback = function()
                local f = vim.fn.expand('%:p')
                if vim.fn.isdirectory(f) ~= 0 then
                    vim.cmd('Neotree current dir=' .. f)
                    -- neo-tree is loaded now, delete the init autocmd
                    vim.api.nvim_clear_autocmds{group = 'NeoTreeInit'}
                end
            end
        })
    end,
    --init = function()
    --    vim.api.nvim_create_autocmd('BufNewFile', {
    --        group    = vim.api.nvim_create_augroup('RemoteFile', {clear = true}),
    --        callback = function()
    --            local f = vim.fn.expand('%:p')
    --            for _, v in ipairs{'sftp', 'scp', 'ssh', 'dav', 'fetch', 'ftp', 'http', 'rcp', 'rsync'} do
    --                local p = v .. '://'
    --                if string.sub(f, 1, #p) == p then
    --                    vim.cmd[[
    --                        unlet g:loaded_netrw
    --                        unlet g:loaded_netrwPlugin
    --                        runtime! plugin/netrwPlugin.vim
    --                        silent Explore %
    --                    ]]
    --                    vim.api.nvim_clear_autocmds{group = 'RemoteFile'}
    --                    break
    --                end
    --            end
    --        end
    --    })
    --end,
    opts = {
        filesystem = {
            hijack_netrw_behavior = "open_current",
        },
        position = "left",
    }
}

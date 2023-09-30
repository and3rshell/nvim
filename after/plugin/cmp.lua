vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local lspkind = require('lspkind')
local cmp = require('cmp')

cmp.setup {
    mapping = {
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        ['<c-space>'] = cmp.mapping.complete(),
        ['<C-y>'] = cmp.mapping.confirm({ select = false }),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-c>'] = cmp.mapping(function() cmp.close() end)
    },
    sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'bootstrap' },
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    -- formatting = {
    --     fields = { 'abbr', 'menu', 'kind' },
    --     format = function(entry, item)
    --         local short_name = {
    --             nvim_lsp = 'lsp',
    --             nvim_lua = 'lua'
    --         }

    --         -- if entry.source.name == "html-css" then
    --         --     item.menu = entry.completion_item.menu
    --         -- end

    --         local menu_name = short_name[entry.source.name] or entry.source.name

    --         item.menu = string.format('[%s]', menu_name)
    --         return item
    --     end,
    -- },
    formatting = {
        fields = { 'abbr', 'menu', 'kind' },
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[lsp]",
                nvim_lua = "[lua]",
                path = "[path]",
                luasnip = "[snip]",
                bootstrap = "[bootstrap]",
            }
        }
    },
    experimental = {
        -- ghost_text = {
        --     hl_group = 'SignColumn'
        -- },
    },
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    window = {
        completion = {
            winhighlight = "Normal:NormalFloat,FloatBorder:Pmenu,Search:None",
            -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        },
        documentation = vim.tbl_deep_extend(
            'force',
            cmp.config.window.bordered(),
            {
                max_height = 25,
                max_width = 70,
            }
        )
    },
}

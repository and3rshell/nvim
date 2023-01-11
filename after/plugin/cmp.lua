local cmp = require('cmp')
local luasnip = require('luasnip')

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}

local cmp_config = {
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp', keyword_length = 3},
        {name = 'buffer', keyword_length = 2},
        {name = 'luasnip'},
    },
    window = {
        documentation = vim.tbl_deep_extend(
            'force',
            cmp.config.window.bordered(),
            {
                max_height = 15,
                max_width = 60,
            }
        )
    },
    formatting = {
        fields = {'abbr', 'menu', 'kind'},
        format = function(entry, item)
            local short_name = {
                nvim_lsp = 'LSP',
                nvim_lua = 'nvim'
            }

            local menu_name = short_name[entry.source.name] or entry.source.name

            item.menu = string.format('[%s]', menu_name)
            return item
        end,
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<C-y>'] = cmp.mapping.confirm({select = false}),

        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

        ['<C-f>'] = cmp.mapping.scroll_docs(5),
        ['<C-b>'] = cmp.mapping.scroll_docs(-5),

        ['<C-c>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.close()
                fallback()
            else
                cmp.complete()
            end
        end),

        -- go to next placeholder in the snippet
        ['<C-j>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, {'i', 's'}),

        -- go to previous placeholder in the snippet
        ['<C-k>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'})
    }
}

cmp.setup(cmp_config)

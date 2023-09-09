local function lsp_keymaps(bufnr)
    local map = function(m, lhs, rhs)
        local opts = { remap = false, silent = true, buffer = bufnr }
        vim.keymap.set(m, lhs, rhs, opts)
    end

    -- LSP actions
    map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    map('n', 'gT', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    map('n', 'gR', '<cmd>lua vim.lsp.buf.references()<cr>')
    map('n', '<F1>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    map('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<cr>')
    map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    map('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Diagnostics
    map('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
    -- map('n', 'gl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>')
    map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
end

local function lsp_settings()
    local sign = function(opts)
        vim.fn.sign_define(opts.name, {
            texthl = opts.name,
            text = opts.text,
            numhl = ''
        })
    end

    sign({ name = 'DiagnosticSignError', text = 'e' })
    sign({ name = 'DiagnosticSignWarn', text = 'w' })
    sign({ name = 'DiagnosticSignHint', text = 'h' })
    sign({ name = 'DiagnosticSignInfo', text = 'i' })

    vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = 'default',
            border = 'double',
            source = 'always',
            header = 'Diagnostics:',
            prefix = '• ',
        },
    })

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover,
        {
            border = 'rounded',
        }
    )

    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        {
            border = 'rounded',
        }
    )

    local command = vim.api.nvim_create_user_command

    command('LspWorkspaceAdd', function()
        vim.lsp.buf.add_workspace_folder()
    end, { desc = 'Add folder to workspace' })

    command('LspWorkspaceList', function()
        vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { desc = 'List workspace folders' })

    command('LspWorkspaceRemove', function()
        vim.lsp.buf.remove_workspace_folder()
    end, { desc = 'Remove folder from workspace' })
end

lsp_settings()

local function lsp_attach(client, bufnr)
    local buf_command = vim.api.nvim_buf_create_user_command

    lsp_keymaps(bufnr)

    buf_command(bufnr, 'LspFormat', function()
        vim.lsp.buf.format()
    end, { desc = 'Format buffer with language server' })
end

require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local lspconfig = require('lspconfig');
local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
    ensure_installed = {
        "bashls",
        -- "shellcheck",
        "clangd", -- c, c++
        "cmake",
        "cssls",
        "cssmodules_ls",
        "dockerls",
        "eslint", -- 
        "emmet_ls",
        "gopls",
        "graphql",
        "html",
        "jsonls",
        "tsserver", -- javascript, typescript
        "lua_ls",
        "marksman", -- markdown
        "intelephense",
        "pyright",
        "rust_analyzer",
        "sqlls",
        "tailwindcss",
        "vimls",
        "vuels", -- vue
        "lemminx", -- xml
    },
    automatic_installation = true,
})

-- Define the server capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local handlers = {
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = capabilities,
        })
    end,
}

mason_lspconfig.setup({ handlers = handlers })

lspconfig.emmet_ls.setup({
    on_attach = lsp_attach,
    capabilities = capabilities,
    -- filetypes = { "astro", "css", "eruby", "html", "htmldjango", "javascriptreact", "less", "pug", "sass", "scss", "svelte", "typescriptreact", "vue", "php" }
    filetypes = { "astro", "css", "eruby", "html", "htmldjango", "javascriptreact", "less", "pug", "sass", "scss", "svelte", "typescriptreact", "vue" }
})

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup({
    capabilities = capabilities,
    filetypes = { "html", "php" },
    init_options = {
        -- configurationSection = { "html", "css", "javascript", "php" },
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true,
            -- php = true
        },
        provideFormatter = true
    }
})

lspconfig.intelephense.setup({
    -- doesnt work
    -- path = "$HOME/.local/share/intelephense"
})

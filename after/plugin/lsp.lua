local function lsp_keymaps(bufnr)
    local map = function(m, lhs, rhs)
        local opts = { remap = false, silent = true, buffer = bufnr }
        vim.keymap.set(m, lhs, rhs, opts)
    end

    -- LSP actions
    map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    map('n', 'gR', '<cmd>lua vim.lsp.buf.references()<cr>')
    map('n', '<F1>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    map('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<cr>')
    map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    map('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Diagnostics
    map('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
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

    sign({ name = 'DiagnosticSignError', text = 'E' })
    sign({ name = 'DiagnosticSignWarn', text = 'W' })
    sign({ name = 'DiagnosticSignHint', text = 'H' })
    sign({ name = 'DiagnosticSignInfo', text = 'I' })

    vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = 'minimal',
            border = 'rounded',
            source = 'always',
            header = '',
            prefix = '',
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

local function lsp_attach(client, bufnr)
    local buf_command = vim.api.nvim_buf_create_user_command

    lsp_keymaps(bufnr)

    buf_command(bufnr, 'LspFormat', function()
        vim.lsp.buf.format()
    end, { desc = 'Format buffer with language server' })
end

lsp_settings()

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "efm",
        "bashls",
        -- "shellcheck",
        -- "phpactor",
        "intelephense",
        "tailwindcss",
        "cssls",
        "cssmodules_ls",
        "eslint",
        "html",
        "jsonls",
        "lemminx",
        "lua_ls",
        "pyright",
        "vimls"
    },
    automatic_installation = true,
})

require('mason-lspconfig').setup_handlers({
    function(server_name)
        require('lspconfig')[server_name].setup({
            on_attach = lsp_attach,
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })
    end
})

-- Define the server capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

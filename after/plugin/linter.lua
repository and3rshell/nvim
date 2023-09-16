local lint = require('lint')
local phpcs = require('lint.linters.phpcs')

phpcs.args = {
    '-q',
    -- '--standard=PSR12',
    '--standard=PSR12',
    '--exclude=Generic.Commenting.Todo,Squiz.PHP.CommentedOutCode',
    '--report=json',
    '-', -- need `-` at the end for stdin support
}

phpcs.cmd = "phpcs"
-- phpcs.cmd = os.getenv('HOME') .. '/.local/share/nvim/mason/bin/php-cs-fixer'

lint.linters_by_ft = {
    sh = { 'shellcheck' },
    php = { 'phpcs' },
    -- js = { 'eslint' },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "TextChanged" }, {
    callback = function()
        require('lint').try_lint()
    end,
})

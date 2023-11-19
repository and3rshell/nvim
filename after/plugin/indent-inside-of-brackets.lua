-- function indent_inside_of_brackets()
--     local start_line = vim.fn.getpos("'<")[2]
--     local end_line = vim.fn.getpos("'>")[2]

--     local inside_brackets = false

--     for line = start_line, end_line, 1 do
--         local line_text = vim.fn.getline(line)

--         if line_text:match("^%[%s*.*$") then
--             inside_brackets = true
--         end

--         if inside_brackets then
--             local trimmed = line_text:match("^%s*(.-)%s*$") -- Trim leading/trailing whitespace

--             if not trimmed:match("^%].*$") and not line_text:match("^%[%s*$") then
--                 vim.fn.setline(line, "    " .. line_text)
--             else
--                 inside_brackets = false
--             end
--         end
--     end
-- end

-- vim.api.nvim_set_keymap('x', '<leader>i', ':lua indent_inside_of_brackets()<CR>', { noremap = true, silent = true })

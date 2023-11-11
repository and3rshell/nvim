local notify = require("notify")

notify.setup({
    timeout = 6000,
    stages = "static",
    render = "compact",
    background_color = "#000000",
    top_down = false
})

local log = require("plenary.log").new({
    plugin = "notify",
    level = "debug",
    use_console = false
})

vim.notify = function(msg, level, opts)
    log.info(msg, level, opts)

    require("notify")(msg, level, opts)
end

-- vim.notify("This is an error message", "error")

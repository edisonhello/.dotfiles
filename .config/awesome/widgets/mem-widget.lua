
local wibox = require("wibox")
local watch = require("awful.widget.watch")

local widget = {}

local function worker(args)

    local args = args or {}

	local timeout = args.timeout or 10

	local memwidget = wibox.widget.textbox()

	watch([[bash -c 'free -m | grep "Mem"']], timeout, function(widget, res)
		local tot, use = res:match("%g+%s+(%d+)%s+(%d+)")
		memwidget:set_text(string.format("Mem: %.2f / %.2f G", use / 1024, tot / 1024))
	end, memwidget)

    return memwidget
end

return setmetatable(widget, { __call = function(_, ...)
    return worker(...)
end })

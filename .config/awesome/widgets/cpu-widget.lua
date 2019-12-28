
local wibox = require("wibox")
local watch = require("awful.widget.watch")

local widget = {}

local function worker(args)

    local args = args or {}

	local timeout = args.timeout or 10

	local cpuwidget = wibox.widget.textbox()

    local total_prev = 0
    local idle_prev = 0
	watch([[bash -c "cat /proc/stat | grep '^cpu '"]], timeout, function(widget, res)
		local user, nice, system, idle, iowait, irq, softirq, steal, guest, guest_nice =
			res:match('(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s(%d+)%s')

		local total = user + nice + system + idle + iowait + irq + softirq + steal
		local diff_idle = idle - idle_prev
		local diff_total = total - total_prev
		local diff_usage = (1000 * (diff_total - diff_idle) / diff_total + 5) / 10

		cpuwidget:set_text("CPU: " .. math.floor(diff_usage) .. "%")

		total_prev = total
		idle_prev = idle
	end, cpuwidget)

    return cpuwidget
end

return setmetatable(widget, { __call = function(_, ...)
    return worker(...)
end })

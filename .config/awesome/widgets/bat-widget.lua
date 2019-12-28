
local wibox = require("wibox")
local watch = require("awful.widget.watch")

local widget = {}

local function worker(args)

    local args = args or {}

	local timeout = args.timeout or 30

	local batwidget = wibox.widget.textbox()

	watch([[bash -c 'acpi -bt']], timeout, function(widget, res)
		local status, perc, time, therm = 
			res:match("%g+%s%g+%s(%a+), (%d+)%%([^\n]*)\n%g+%s%g+%s%g+%s(%d+)")
		if (status == "Unknown") then
			batwidget:set_text("BAT: " .. perc .. "%")
		else 
			if (status == "Charging") then status = " CHR" else status = "" end
			local hh, mm = time:match("(%d+):(%d+):%d+")
			if hh == nil or mm == nil then
				batwidget:set_text("BAT: " .. perc .. "%" .. status)
			else 
				batwidget:set_text("BAT: " .. perc .. "%" .. status .. " " .. hh .. ":" .. mm)
			end
		end
	end, batwidget)

    return batwidget
end

return setmetatable(widget, { __call = function(_, ...)
    return worker(...)
end })

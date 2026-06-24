local settings = require("settings")
local colors = require("colors")

sbar.add("item", {
    position = "right",
    width = settings.widgets.spacing
})

local cal = sbar.add("item", "widgets.calendar", {
    position = "right",
    icon = {
        drawing = false
    },
    label = {
        color = colors.white,
        padding_right = 0,
        padding_left = 0,
        align = "right",
        font = {
            family = settings.font.numbers,
            style = settings.font.style_map[settings.menu_bar.style],
            size = settings.widgets.size
        }
    },
    update_freq = 1,
    background = {
        drawing = false
    }
})

sbar.add("item", {
    position = "right",
    width = settings.widgets.spacing
})

cal:subscribe({ "forced", "routine", "system_woke" }, function(_)
    cal:set({
        label = os.date("%a %b %d  %I:%M:%S %p")
    })
end)

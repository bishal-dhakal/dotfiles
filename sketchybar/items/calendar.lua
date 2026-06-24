local settings = require("settings")
local colors = require("colors")

sbar.add("item", {
    position = "right",
    width = settings.group_paddings
})

local cal = sbar.add("item", {
    icon = {
        drawing = false
    },
    label = {
        color = colors.white,
        padding_right = 8,
        padding_left = 10,
        align = "right",
        font = {
            family = settings.font.text,
            style = settings.font.style_map[settings.menu_bar.style],
            size = settings.menu_bar.size
        }
    },
    position = "right",
    update_freq = 1,
    background = {
        drawing = false
    }
})

sbar.add("item", {
    position = "right",
    width = settings.group_paddings
})

cal:subscribe({ "forced", "routine", "system_woke" }, function(_)
    cal:set({
        label = os.date("%a %b %d  %I:%M:%S %p")
    })
end)

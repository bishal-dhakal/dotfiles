local colors = require("colors")
local icons = require("icons")

return {
    paddings = 3,
    group_paddings = 8,
    modes = {
        main = {
            icon = icons.rebel,
            color = colors.rainbow[1]
        },
        service = {
            icon = icons.nuke,
            color = 0xffff9e64
        }
    },
    bar = {
        height = 36,
        padding = {
            x = 10,
            y = 0
        },
        background = colors.bar.bg
    },
    items = {
        height = 24,
        gap = 4,
        padding = {
            right = 8,
            left = 8,
            top = 0,
            bottom = 0
        },
        default_color = function(_)
            return colors.grey
        end,
        highlight_color = function(_)
            return colors.white
        end,
        colors = {
            background = colors.transparent
        },
        corner_radius = 4
    },

    menu_bar = {
        size = 15.0,
        style = "Regular",
    },

    icons = "JetBrainsMono Nerd Font Mono:Regular:13.0",
    app_icons = "sketchybar-app-font:Regular:13.0",

    font = {
        text = "JetBrainsMono Nerd Font Mono",
        numbers = "JetBrainsMono Nerd Font Mono",
        style_map = {
            ["Regular"] = "Regular",
            ["Semibold"] = "Medium",
            ["Bold"] = "SemiBold",
            ["Heavy"] = "Bold",
            ["Black"] = "ExtraBold"
        }
    }
}

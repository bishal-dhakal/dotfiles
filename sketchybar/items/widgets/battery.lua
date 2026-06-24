local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local widget_font = {
    family = settings.font.numbers,
    style = settings.font.style_map[settings.menu_bar.style],
    size = settings.widgets.size
}

local battery = sbar.add("item", "widgets.battery", {
    position = "right",
    icon = {
        font = widget_font,
        padding_right = 3
    },
    label = {
        font = widget_font,
        color = colors.white,
        padding_left = 0
    },
    padding_right = 0,
    padding_left = 0,
    update_freq = 180,
    popup = {
        align = "center"
    }
})

local remaining_time = sbar.add("item", {
    position = "popup." .. battery.name,
    icon = {
        string = "Time remaining:",
        width = 100,
        align = "left"
    },
    label = {
        string = "??:??h",
        width = 100,
        align = "right"
    }
})

battery:subscribe({"routine", "power_source_change", "system_woke"}, function()
    sbar.exec("pmset -g batt", function(batt_info)
        local label = "?"

        local found, _, charge = batt_info:find("(%d+)%%")
        if found then
            charge = tonumber(charge)
            label = charge .. "%"
        end

        local lead = ""
        if found and charge < 10 then
            lead = "0"
        end

        battery:set({
            icon = {
                string = icons.battery.thunder,
                color = colors.white
            },
            label = {
                string = lead .. label,
                color = colors.white
            }
        })
    end)
end)

battery:subscribe("mouse.clicked", function(env)
    local drawing = battery:query().popup.drawing
    battery:set({
        popup = {
            drawing = "toggle"
        }
    })

    if drawing == "off" then
        sbar.exec("pmset -g batt", function(batt_info)
            local found, _, remaining = batt_info:find(" (%d+:%d+) remaining")
            local label = found and remaining .. "h" or "No estimate"
            remaining_time:set({
                label = label
            })
        end)
    end
end)

sbar.add("item", "widgets.battery.padding", {
    position = "right",
    width = settings.widgets.spacing
})

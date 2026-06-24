local colors = require("colors")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

local spaces = {}

local workspaces = get_workspaces()
local current_workspace = tostring(get_current_workspace() or "")

local function split(str, sep)
    local result = {}
    local regex = ("([^%s]+)"):format(sep)
    for each in str:gmatch(regex) do
        table.insert(result, each)
    end
    return result
end

local function workspace_apps_line(apps)
    local icon_line = ""
    local no_app = true
    for _, app in ipairs(apps) do
        no_app = false
        local app_name = app["app-name"]
        local lookup = app_icons[app_name]
        local icon = lookup == nil and app_icons["default"] or lookup
        icon_line = icon_line .. " " .. icon
    end
    if no_app then
        icon_line = " —"
    end
    return icon_line
end

local function load_workspace_apps(index, space)
    sbar.exec(
        "aerospace list-windows --workspace " .. index .. " --format '%{app-name}' --json ",
        function(apps)
            sbar.animate("tanh", 10, function()
                space:set({
                    label = workspace_apps_line(apps)
                })
            end)
        end
    )
end

local function apply_space_state(space, selected)
    space:set({
        icon = {
            highlight = false,
            color = selected and colors.white or colors.grey,
            font = {
                family = settings.font.numbers,
                style = selected and settings.font.style_map["Semibold"] or settings.font.style_map["Regular"],
                size = selected and 13.0 or 12.0
            }
        },
        label = {
            highlight = false,
            color = selected and colors.white or colors.with_alpha(colors.grey, 0.85)
        },
        background = {
            border_color = selected and colors.pink or colors.with_alpha(colors.grey, 0.35),
            border_width = 1,
            color = selected and colors.with_alpha(colors.pink, 0.12) or colors.transparent
        }
    })
end

local function refresh_all_spaces(focused_workspace)
    local focused = tostring(focused_workspace or get_current_workspace() or "")
    for index, workspace in ipairs(workspaces) do
        local selected = focused == tostring(workspace)
        apply_space_state(spaces[index], selected)
        load_workspace_apps(index, spaces[index])
    end
end

for index, workspace in ipairs(workspaces) do
    local selected = tostring(workspace) == current_workspace
    local display = get_sketchybar_display_for_workspace(workspace)
    local space = sbar.add("item", "item." .. index, {
        display = display,
        icon = {
            font = {
                family = settings.font.numbers,
                style = selected and settings.font.style_map["Semibold"] or settings.font.style_map["Regular"],
                size = selected and 13.0 or 12.0
            },
            string = tostring(index),
            padding_left = settings.items.padding.left,
            padding_right = settings.items.padding.left / 2,
            color = selected and colors.white or colors.grey
        },
        label = {
            padding_right = settings.items.padding.right,
            color = selected and colors.white or colors.with_alpha(colors.grey, 0.85),
            font = settings.app_icons,
            y_offset = 0
        },
        padding_right = 0,
        padding_left = 0,
        background = {
            color = selected and colors.with_alpha(colors.pink, 0.12) or colors.transparent,
            border_width = 1,
            height = settings.items.height,
            border_color = selected and colors.pink or colors.with_alpha(colors.grey, 0.35)
        },
        popup = {
            background = {
                border_width = 5,
                border_color = colors.black
            }
        }
    })

    spaces[index] = space
    load_workspace_apps(index, space)

    sbar.add("item", "item." .. index .. "padding", {
        display = display,
        script = "",
        width = settings.items.gap
    })

    local space_popup = sbar.add("item", {
        position = "popup." .. space.name,
        padding_left = 5,
        padding_right = 0,
        background = {
            drawing = true,
            image = {
                corner_radius = 9,
                scale = 0.2
            }
        }
    })

    space:subscribe("aerospace_workspace_change", function(env)
        space:set({ display = get_sketchybar_display_for_workspace(workspace) })
        refresh_all_spaces(env.FOCUSED_WORKSPACE)
    end)

    space:subscribe("mouse.clicked", function(env)
        local sid = split(env.NAME, ".")[2]
        if env.BUTTON == "other" then
            space_popup:set({
                background = {
                    image = "item." .. sid
                }
            })
            space:set({
                popup = {
                    drawing = "toggle"
                }
            })
        else
            sbar.exec("aerospace workspace " .. sid)
        end
    end)

    space:subscribe("mouse.exited", function(_)
        space:set({
            popup = {
                drawing = false
            }
        })
    end)
end

local space_window_observer = sbar.add("item", {
    drawing = false,
    updates = true
})

local function refresh_workspace_displays()
    for index, workspace in ipairs(workspaces) do
        local display = get_sketchybar_display_for_workspace(workspace)
        spaces[index]:set({ display = display })
        sbar.set("item." .. index .. "padding", { display = display })
    end
end

space_window_observer:subscribe("display_change", function(_)
    refresh_workspace_displays()
    refresh_all_spaces()
end)

space_window_observer:subscribe("space_windows_change", function(_)
    refresh_all_spaces()
end)

space_window_observer:subscribe("aerospace_focus_change", function(env)
    refresh_all_spaces(env.FOCUSED_WORKSPACE)
end)

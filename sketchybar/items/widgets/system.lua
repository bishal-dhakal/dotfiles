local colors = require("colors")
local settings = require("settings")

local widget_font = {
    family = settings.font.numbers,
    style = settings.font.style_map[settings.menu_bar.style],
    size = settings.widgets.size
}

sbar.exec("killall cpu_load >/dev/null; $CONFIG_DIR/helpers/event_providers/cpu_load/bin/cpu_load cpu_update 2.0")

local memory_cmd = [[vm_stat | perl -ne '
/page size of (\d+)/ and $ps=$1;
/Pages active:\s+(\d+)/ and $a=$1;
/Pages speculative:\s+(\d+)/ and $s=$1;
/Pages wired down:\s+(\d+)/ and $w=$1;
/Pages occupied by compressor:\s+(\d+)/ and $c=$1;
END {
  $used=($w+$a+$s+$c)*$ps;
  $total=`sysctl -n hw.memsize`+0;
  $pct=int($used*100/($total ? $total : 1));
  printf "%.1f|%d", $used/1073741824, $pct;
}']]

local cpu = sbar.add("item", "widgets.cpu", {
    position = "right",
    icon = {
        drawing = false
    },
    label = {
        string = "?%",
        font = widget_font,
        color = colors.blue,
        padding_left = 0
    },
    padding_right = 0,
    padding_left = 0
})

cpu:subscribe("cpu_update", function(env)
    local load = tonumber(env.total_load) or 0
    local color = colors.blue
    if load > 30 then
        if load < 60 then
            color = colors.yellow
        elseif load < 80 then
            color = colors.orange
        else
            color = colors.red
        end
    end

    cpu:set({
        label = {
            string = string.format("%d%%", load),
            color = color
        }
    })
end)

cpu:subscribe("mouse.clicked", function(_)
    sbar.exec("open -a 'Activity Monitor'")
end)

sbar.add("item", "widgets.cpu.padding", {
    position = "right",
    width = settings.widgets.spacing
})

local memory = sbar.add("item", "widgets.memory", {
    position = "right",
    update_freq = 2,
    icon = {
        drawing = false
    },
    label = {
        string = "?G",
        font = widget_font,
        color = colors.magenta,
        padding_left = 0
    },
    padding_right = 0,
    padding_left = 0
})

local function update_memory()
    sbar.exec(memory_cmd, function(result)
        local used_gb, pct = result:match("([%d%.]+)|(%d+)")
        used_gb = tonumber(used_gb) or 0
        pct = tonumber(pct) or 0

        local color = colors.magenta
        if pct > 70 then
            color = colors.orange
        end
        if pct > 85 then
            color = colors.red
        end

        memory:set({
            label = {
                string = string.format("%.1fG", used_gb),
                color = color
            }
        })
    end)
end

memory:subscribe({"routine", "system_woke"}, update_memory)

memory:subscribe("mouse.clicked", function(_)
    sbar.exec("open -a 'Activity Monitor'")
end)

sbar.add("item", "widgets.memory.padding", {
    position = "right",
    width = settings.widgets.spacing
})

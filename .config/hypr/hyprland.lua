
-- ==========================================
-- MONITORS
-- ==========================================
hl.config({
})

-- ==========================================
-- VARIABLES
-- ==========================================
local terminal = "konsole"
local terminal_alt = "footclient"
local fileManager = "dolphin"
local menu = "fuzzel"
local menu_alt = "wofi --show run"
local mainMod = "SUPER"

-- ==========================================
-- AUTOSTART
-- ==========================================
hl.on("hyprland.start", function()
    hl.exec_cmd("kwalletd6 &")
    hl.exec_cmd("hyprpaper &")
    hl.exec_cmd("fcitx5 -d &")
    hl.exec_cmd("wl-paste --type text --watch cliphist -max-items 50 store &")
    hl.exec_cmd("hypridle &")
    hl.exec_cmd("foot --server &")
    hl.exec_cmd("dunst &")
    hl.exec_cmd("ashell &")
    hl.exec_cmd("~/.local/bin/mycloudflared &")
    hl.exec_cmd("[workspace 1 silent] uwsm app -- " .. terminal)
    hl.exec_cmd("systemctl --user start plasma-polkit-agent &")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &")
    hl.exec_cmd("[workspace 2 silent] uwsm app -- flatpak run org.mozilla.firefox")
    hl.exec_cmd("[workspace 3 silent] sleep 2 && uwsm app -- flatpak run org.mozilla.firefox -p lala")
    hl.exec_cmd("[workspace 4 silent] uwsm app -- flatpak run io.github.slgobinath.SafeEyes")
end)

-- ==========================================
-- ENVIRONMENT VARIABLES
-- ==========================================
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")
hl.env("QT_IM_MODULE", "fcitx")
hl.env("QT_IM_MODULES", "wayland;fcitx;ibus")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("HYPRSHOT_DIR", "$HOME/Pictures/Screenshots")

-- ==========================================
-- LOOK AND FEEL
-- ==========================================
hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 5,
        border_size = 1,
        ["col.active_border"] = { colors = {"rgba(fbf1c7ee)", "rgba(458588ee)"}, angle = 45 },
        ["col.inactive_border"] = "rgba(665c54aa)",
        resize_on_border = true,
        allow_tearing = true,
        layout = "dwindle"
    },
    group = {
        groupbar = {
            ["col.active"] = "rgba(282828ee)",
            ["col.inactive"] = "rgba(3c3836ee)",
            height = 12,
            gaps_out = 1,
            rounding = 5,
            font_size = 10,
            font_weight_active = "bold",
            blur = true,
            keep_upper_gap = false,
            gradients = true
        }
    },
    decoration = {
        rounding = 5,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696
        }
    },
    animations = {
        enabled = false,
    },
    dwindle = {
        preserve_split = true
    },
    master = {
        new_status = "master"
    },
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = true,
        mouse_move_enables_dpms = false,
        key_press_enables_dpms = true
    }
})

-- ==========================================
-- INPUT & DEVICES
-- ==========================================
hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 2,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false
        }
    },
})

-- ==========================================
-- KEYBINDINGS
-- ==========================================

-- Example binds
hl.bind("ALT + T", hl.dsp.exec_cmd("uwsm app -- " .. terminal_alt))
--hl.bind(mainMod .. "_SHIFT", "E", "exit,")
--hl.bind(mainMod, "R", "exec, " .. menu)
--hl.bind("ALT", "R", "exec, " .. menu_alt)
--hl.bind(mainMod, "P", "pseudo,")
hl.bind("ALT + TAB", hl.dsp.window.cycle_next())
hl.bind("ALT + TAB", hl.dsp.group.next())
--hl.bind("ALT", "Tab", "bringactivetotop,")
--hl.bind("ALT", "Tab", "changegroupactive, f")
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | fuzzel -d | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("~/.local/bin/hyprlock.sh"))
--hl.bind("WIN", "F1", "exec, ~/.config/hypr/gamemode.sh")
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("stochos"))
--
---- Move focus with mainMod + arrow keys
--hl.bind(mainMod, "left", "movefocus, l")
--hl.bind(mainMod, "left", "changegroupactive, b")
--hl.bind(mainMod, "right", "movefocus, r")
--hl.bind(mainMod, "right", "changegroupactive, f")
--hl.bind(mainMod, "up", "movefocus, u")
--hl.bind(mainMod, "down", "movefocus, d")

hl.bind("CTRL + ALT + Q", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind("ALT + F4", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
-- hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + E", hl.dsp.group.toggle({ }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + left",  hl.dsp.group.prev())
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + right", hl.dsp.group.next())
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


-- Active resizing
--hl.bind("CTRL_" .. mainMod, "right", "resizeactive, 20 0")
--hl.bind("CTRL_" .. mainMod, "left", "resizeactive, -20 0")
--hl.bind(mainMod .. "_CTRL", "up", "resizeactive, 0 -20")  -- Adjusted layout ordering safely
--hl.bind("CTRL_" .. mainMod, "down", "resizeactive, 0 20")
--
---- Screenshots
--hl.bind(mainMod, "PRINT", "exec, hyprshot -m window")
--hl.bind("", "PRINT", "exec, hyprshot -m output")
--hl.bind(mainMod .. "_SHIFT", "PRINT", "exec, hyprshot -m region")

-- ==========================================
-- WINDOWS AND WORKSPACES RULES
-- ==========================================
hl.window_rule({
    match = {
        class = ".*telegram.*|.*foot.*|.*bevy.*",
    },
    float = true,
})
--hl.rule("windowrule", "no_initial_focus on,match:class ^(jetbrains-.*)$,match:float 1")

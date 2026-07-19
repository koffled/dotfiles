-- macos-binds.lua
-- macOS-style fullscreen / maximize / minimize / resize keybinds

local mainMod = "SUPER"

-- True fullscreen (like macOS green-button fullscreen: hides bar, own "space")
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 0 }))

-- Maximize (keeps your bar visible, just fills the tile)
hl.bind(mainMod .. " + Up", hl.dsp.window.fullscreen({ mode = 1 }))

-- Move between workspaces like swiping between macOS fullscreen spaces
hl.bind(mainMod .. " + Right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + Left",  hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + Left",  hl.dsp.window.move({ workspace = "e-1" }))

-- "Minimize" (send to a hidden scratchpad workspace, bring back with the same key)
hl.bind(mainMod .. " + Down", hl.dsp.window.move({ workspace = "special:minimized" }))
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.workspace.toggle_special("minimized"))

-- Resize submap: mainMod + R to enter, arrows to resize, Esc to exit
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    hl.bind("right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
    hl.bind("left",  hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
    hl.bind("up",    hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
    hl.bind("down",  hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
    hl.bind("escape", hl.dsp.submap("reset"))
end)

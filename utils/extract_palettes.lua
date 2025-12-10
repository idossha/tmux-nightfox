#!/usr/bin/env lua

-- Script to extract Nightfox palette values for tmux theme
-- Run this with: lua extract_palettes.lua

local function extract_palette(theme_name)
    -- This would be the code to run in Neovim to extract palettes
    -- Since we can't run Neovim here, we'll create a template
    print("-- " .. theme_name .. " palette extraction template")
    print("local palette = require('nightfox.palette').load('" .. theme_name .. "')")
    print("print(vim.inspect(palette))")
    print("")
end

local function generate_tmux_palette(palette_data, theme_name)
    -- This function would convert nightfox palette to tmux format
    -- For now, just show the structure
    print("# " .. theme_name .. " tmux palette structure")
    print("col_bg='#??????'      # background")
    print("col_fg='#??????'      # foreground")
    print("col_red='#??????'     # red.base")
    print("col_red2='#??????'    # red.bright")
    print("col_green='#??????'   # green.base")
    print("col_green2='#??????'  # green.bright")
    print("col_blue='#??????'    # blue.base")
    print("col_blue2='#??????'   # blue.bright")
    print("# etc...")
    print("")
end

local themes = {
    "nightfox",
    "carbonfox",
    "dawnfox",
    "dayfox",
    "duskfox",
    "nordfox",
    "terafox"
}

print("# Nightfox Palette Extraction Script")
print("# Run this in Neovim with nightfox installed:")
print("")
for _, theme in ipairs(themes) do
    extract_palette(theme)
end

print("")
print("# Expected tmux palette structure:")
print("")
for _, theme in ipairs(themes) do
    generate_tmux_palette(nil, theme)
end

print("")
print("# After running the above in Neovim, copy the output and use it to update")
print("# the tmux palette files in src/palette_*.sh")
print("")
print("# The original nightfox palette structure has:")
print("# - base/bright/dim variants for semantic colors (red, green, blue, etc.)")
print("# - background/foreground shades (bg0-bg4, fg0-fg4)")
print("# - gray colors")
print("# - special colors like sel0, sel1 for selections")
local wezterm = require('wezterm')

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Catppuccin Macchiato'
  else
    return 'Catppuccin Frappe'
  end
end

-- This table will hold the configuration.
local config = {
  initial_cols = 240,
  initial_rows = 80,
  enable_tab_bar = false,
  adjust_window_size_when_changing_font_size = true,
  native_macos_fullscreen_mode = true,
}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- find fonts **ONLY** from your font_dirs wezterm config
-- These configs look first for fonts in the directory named
-- `fonts` that is found alongside your `wezterm.lua` file.
-- As this option is an array, you may list multiple locations if
-- you wish.
-- config.font_locator = 'ConfigDirsOnly'
-- config.font_dirs = { 'fonts' }

-- Default Font with Fallback
config.font = wezterm.font_with_fallback({
    { family = 'FiraCode Nerd Font', weight = 'Medium' },
    'JetBrains Mono',
})

config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9

-- Set emulator color scheme to $SYSTEM
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

return config
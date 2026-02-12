local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.automatically_reload_config = true
config.color_scheme = "${WEZTERM_COLOR_SCHEME}"

return config

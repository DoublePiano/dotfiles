local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

wezterm.on('gui-startup', function()
local tab, pane, window = mux.spawn_window({})
window:gui_window():maximize()
end)

config = {
  set_environment_variables = {
    COLORTERM="truecolor",
  },
}

config.color_scheme = "Hivacruz"
-- config.color_scheme = "Gruvbox Light"
-- config.color_scheme = "Violet Light"
-- config.color_scheme = 'Atelier Estuary Light (base16)'
-- config.color_scheme = 'Atelierlakeside (light) (terminal.sexy)'
-- config.color_scheme = 'Atelierseaside (light) (terminal.sexy)'
config.window_background_opacity = 0.97
config.text_background_opacity = 1
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_decorations = "RESIZE"
config.enable_kitty_keyboard = true
config.enable_scroll_bar = true

config.window_padding = {
  left = '0.5cell',
  right = '1cell',
  top = 0,
  bottom = 0,
}

-- config.window_close_confirmation = "NeverPrompt",
-- config.skip_close_confirmation_for_processes_named = { 'bash', 'sh', 'zsh', 'fish', 'tmux' },
config.keys = {
  {
    key = 'h', mods = 'ALT', action = act.ActivatePaneDirection 'Left'

  },
  {
    key = 'l', mods = 'ALT', action = act.ActivatePaneDirection 'Right'
  },
  {
    key = 'k', mods = 'ALT', action = act.ActivatePaneDirection 'Up'

  },
  {
    key = 'j', mods = 'ALT', action = act.ActivatePaneDirection 'Down'
  },
  {
    key = 'l', mods = 'SHIFT|ALT', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' }
  },
  {
    key = 'j', mods = 'SHIFT|ALT', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } 
  },
  {
    key = 'w', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentTab { confirm = false }
  },
  {
    key = 'Tab', mods = 'CTRL', action = wezterm.action.ActivateLastTab
  },
  {
    key = 'w', mods = 'CMD', action = wezterm.action.CloseCurrentPane { confirm = false }
  },
  {
    key = 's', mods = 'ALT', action = wezterm.action.PaneSelect {mode = 'SwapWithActive'}
  },

}
return config

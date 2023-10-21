local wezterm = require("wezterm")
local config = {}

-- config.font = wezterm.font('FiraCode Nerd Font')
config.font = wezterm.font_with_fallback({ "FiraCode Nerd Font", "Cascadia Code" })
config.font_size = 12.0

config.front_end = "WebGpu"
config.webgpu_preferred_adapter = {
	backend = "Dx12",
	device = 7298,
	device_type = "DiscreteGpu",
	name = "NVIDIA GeForce GTX 1050 Ti",
	vendor = 4318,
}
config.webgpu_force_fallback_adapter = false
config.enable_wayland = true
config.webgpu_power_preference = "HighPerformance"

config.color_scheme = "Solarized (dark) (terminal.sexy)"

-- tab bar
config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.tab_max_width = 25
config.show_tab_index_in_tab_bar = true
config.switch_to_last_active_tab_when_closing_tab = true

-- cursor
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 500

-- window
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_style = "Windows"
config.integrated_title_button_color = "auto"
config.integrated_title_button_alignment = "Right"
config.initial_cols = 120
config.initial_rows = 24
config.window_padding = { left = 5, right = 10, top = 12, bottom = 7 }
config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400
-- Wezterm configuration
-- powered by aquawius
-- this is version 4
-- version 1: initial config
-- version 2: wsl support
-- version 3: update theme to purple style
-- version 4: fix bug "git log" with "terminal is not fully functional"
--            tracert: term set to "" is not a compatible term for git
-- version 5: update theme to dracula official

-- color_scheme = "Fahrenheit",
-- color_scheme = "Gruvbox Dark",
-- color_scheme = "Blue Matrix",
-- color_scheme = "Pandora",
-- color_scheme = "Grape",
-- color_scheme = "Firewatch",
-- color_scheme = "Duotone Dark",
-- color_scheme = "Sakura",
-- color_scheme = "lovelace",

config.enable_scroll_bar = true
config.exit_behavior = "Close"

config.inactive_pane_hsb = { hue = 1.0, saturation = 1.0, brightness = 1.0 }

-- font = wezterm.font(''),

config.default_prog = { "powershell" }
-- default_cwd = "/some/path",
config.launch_menu = {}

-- leader = { key = "b", mods = "CTRL" },
config.set_environment_variables = {}

-- set default theme to dracula official conf

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	-- config.term = "" -- Set to empty so FZF works on windows
	-- config.term = "xterm"  -- fix bug in command "git log" with "terminal is not fully functional" or delete this term = "xxxx" (using default term value)

	table.insert(config.launch_menu, { label = "Command Prompt", args = { "cmd.exe" } })
	table.insert(config.launch_menu, { label = "PowerShell 5", args = { "powershell.exe", "-NoLogo" } })

	table.insert(config.launch_menu, { label = "Default WSL Command Prompt", args = { "wsl" } })
	-- table.insert(config.config.launch_menu, {
	--     label = "VS PowerShell 2022",
	--     args = {"powershell", "-NoLogo", "-NoExit", "-Command", "devps 17.0"}
	-- })
	-- table.insert(config.config.launch_menu, {
	--     label = "VS PowerShell 2019",
	--     args = {"powershell", "-NoLogo", "-NoExit", "-Command", "devps 16.0"}
	-- })
	-- table.insert(config.config.launch_menu, {
	--     label = "VS Command Prompt 2022",
	--     args = {"powershell", "-NoLogo", "-NoExit", "-Command", "devcmd 17.0"}
	-- })
	-- table.insert(config.config.launch_menu, {
	--     label = "VS Command Prompt 2019",
	--     args = {"powershell", "-NoLogo", "-NoExit", "-Command", "devcmd 16.0"}
	-- })

	-- Enumerate any WSL distributions that are installed and add those to the menu
	local success, wsl_list, wsl_err = wezterm.run_child_process({ "wsl", "-l" })
	-- `wsl.exe -l` has a bug where it always outputs utf16:
	-- https://github.com/microsoft/WSL/issues/4607
	-- So we get to convert it
	wsl_list = wezterm.utf16_to_utf8(wsl_list)

	for idx, line in ipairs(wezterm.split_by_newlines(wsl_list)) do
		-- Skip the first line of output; it's just a header
		if idx > 1 then
			-- Remove the "(Default)" marker from the default line to arrive at the distribution name on its own

			-- For English Users, the default line:
			-- local distro = line:gsub(" %(Default%)", "")
			-- For Chinese User,
			local distro = line:gsub(" %(默认%)", "")

			-- Add an entry that will spawn into the distro with the default shell
			table.insert(config.launch_menu, {
				label = distro .. " (WSL default shell)",
				args = { "wsl", "--distribution", distro },
			})

			-- Here's how to jump directly into some other program; in this example
			-- its a shell that probably isn't the default, but it could also be
			-- any other program that you want to run in that environment
			-- table.insert(config.config.launch_menu, {
			--     label = distro .. " (WSL zsh login shell)",
			--     args = { "wsl", "--distribution", distro, "--exec", "/bin/zsh", "-l" },
			-- })
		end
	end
	-- Not a windows environment
end

-- Equivalent to POSIX basename(3)
-- Given "/foo/bar" returns "bar"
-- Given "c:\\foo\\bar" returns "bar"
function Basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local pane = tab.active_pane
	local title = Basename(pane.foreground_process_name)
	return { { Text = " " .. title .. " " } }
end)

return config

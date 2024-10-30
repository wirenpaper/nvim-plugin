package.path = package.path .. ";/home/saifr/.config/nvim/plugin/hooks/?.lua"
package.path = package.path .. ";/home/saifr/.config/nvim/plugin/hook_files/?.lua"
local hooks = require'hooks'
local hook_files = require'hook_files'

local fname = hook_files.file_content(hooks.path .. "/.hook_files/" .. hook_files.MARKER)

hooks.register_autocommands()
hooks.signs(0,0)
hooks.kill_flag_set(false)
require'lualine'.setup {
	options = {
		icons_enabled = false,
        theme = 'codedark',
        --component_separators = { left = '', right = ''},
		component_separators = { left = '>', right = '<'},
		section_separators = { left = '<', right = '>'},
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = { function () return hooks.fname_cleaned() end },
        lualine_x = { function() return " " end, 'filetype', function() return fname end },
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = { function () return hooks.fname_cleaned() end },
        lualine_x = { function() return " " end, 'filetype', function() return fname end },
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}

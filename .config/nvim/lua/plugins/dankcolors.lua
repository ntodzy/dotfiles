return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#111318',
				base01 = '#111318',
				base02 = '#989da5',
				base03 = '#989da5',
				base04 = '#eff5ff',
				base05 = '#f8fbff',
				base06 = '#f8fbff',
				base07 = '#f8fbff',
				base08 = '#ff9fbb',
				base09 = '#ff9fbb',
				base0A = '#b2d1ff',
				base0B = '#a5ffb2',
				base0C = '#d6e7ff',
				base0D = '#b2d1ff',
				base0E = '#bfd9ff',
				base0F = '#bfd9ff',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#989da5',
				fg = '#f8fbff',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#b2d1ff',
				fg = '#111318',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#989da5' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#d6e7ff', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#bfd9ff',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#b2d1ff',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#b2d1ff',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#d6e7ff',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#a5ffb2',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#eff5ff' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#eff5ff' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#989da5',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}

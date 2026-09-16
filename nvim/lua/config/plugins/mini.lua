return {{
	'nvim-mini/mini.nvim',
	version = '*',
  enabled = true,
	config = function()
 		local statusline = require('mini.statusline')
		statusline.setup { use_icons = true }
	end
}}

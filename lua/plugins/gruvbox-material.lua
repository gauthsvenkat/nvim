return {
	"sainnhe/gruvbox-material",
	priority = 1000,
	init = function()
		vim.o.gruvbox_material_background = "hard"
		vim.cmd.colorscheme("gruvbox-material")
	end,
}

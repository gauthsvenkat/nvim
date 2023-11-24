return {
	"morhetz/gruvbox",
	lazy = false,
	priority = 1000,
	config = function()
		vim.o.gruvbox_material_background = "hard"
		vim.cmd.colorscheme("gruvbox")
	end,
}

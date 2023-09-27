return {
	"windwp/nvim-autopairs",
	config = function()
		local nvim_autopairs = require("nvim-autopairs")
		local nvim_autopairs_completion = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")

		nvim_autopairs.setup({})

		-- If you want insert `(` after select function or method item
		cmp.event:on("confirm_done", nvim_autopairs_completion.on_confirm_done())
	end,
}

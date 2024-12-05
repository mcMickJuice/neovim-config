return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.eslint_d.with({
					condition = function(utils)
						return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" })
					end,
				}),
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.golangci_lint,
				-- requires pgformatter to be installed locally - https://formulae.brew.sh/formula/pgformatter
				null_ls.builtins.formatting.pg_format,
			},
		})
	end,
}

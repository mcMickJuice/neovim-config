return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

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
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
							-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
							vim.lsp.buf.formatting_sync()
						end,
					})
				end
			end,
		})
	end,
}

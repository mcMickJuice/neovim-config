return {
	dependencies = { "nvimtools/none-ls-extras.nvim" },
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local lsp_formatting = function(bufnr)
			vim.lsp.buf.format({
				filter = function(client)
					return client.name == "null-ls"
				end,
				bufnr = bufnr,
			})
		end
		null_ls.setup({
			sources = {
				-- lua
				null_ls.builtins.formatting.stylua,

				-- javascript, ts, json
				-- I was experiencing major issues with eslint where undo/redo would cause 10s of node processes to spawn
				-- eslint_d does not have this issue
				require("none-ls.diagnostics.eslint_d").with({
					condition = function(utils)
						return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" })
					end,
				}),
				require("none-ls.code_actions.eslint_d").with({
					condition = function(utils)
						return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" })
					end,
				}),
				null_ls.builtins.formatting.prettier,

				-- go
				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.formatting.gofmt,

				-- sql
				-- requires pgformatter to be installed locally - https://formulae.brew.sh/formula/pgformatter
				null_ls.builtins.formatting.pg_format,
			},
			on_attach = function(client, bufnr)
				-- from https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							lsp_formatting(bufnr)
						end,
					})
				end
			end,
		})
	end,
}

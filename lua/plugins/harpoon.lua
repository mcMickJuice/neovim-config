return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup()

		-- FROM harpoon docs - https://github.com/ThePrimeagen/harpoon/tree/harpoon2?tab=readme-ov-file#basic-setup
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		vim.keymap.set("n", "<C-e>", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })

		-- IN case I want to hotkey to files in list instead of using the viewer
		-- vim.keymap.set("n", "<C-h>", function()
		-- 	harpoon:list():select(1)
		-- end)
		-- vim.keymap.set("n", "<C-t>", function()
		-- 	harpoon:list():select(2)
		-- end)
		-- vim.keymap.set("n", "<C-n>", function()
		-- 	harpoon:list():select(3)
		-- end)
		-- vim.keymap.set("n", "<C-s>", function()
		-- 	harpoon:list():select(4)
		-- end)

		-- -- Toggle previous & next buffers stored within Harpoon list
		-- vim.keymap.set("n", "<C-S-P>", function()
		-- 	harpoon:list():prev()
		-- end)
		-- vim.keymap.set("n", "<C-S-N>", function()
		-- 	harpoon:list():next()
		-- end)

		harpoon:extend({
			UI_CREATE = function(cx)
				-- open selected file in split
				vim.keymap.set("n", "<C-v>", function()
					harpoon.ui:select_menu_item({ vsplit = true })
				end, { buffer = cx.bufnr })
			end,
		})
	end,
}

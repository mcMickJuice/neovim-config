return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup()

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local finder = function()
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end
				return require("telescope.finders").new_table({
					results = file_paths,
				})
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = finder(),
					-- smaller layout then normal telescope, without preview as I know  what's in the file
					previewer = false,
					layout_config = {
						height = 0.6,
						width = 0.6,
					},
					sorter = conf.generic_sorter({}),
					-- how to delete entry from harpoon list
					-- https://github.com/ThePrimeagen/harpoon/issues/499#issuecomment-2076462687
					attach_mappings = function(prompt_bufnr, map)
						-- delete individual harpoon entry
						map("i", "<C-d>", function()
							local state = require("telescope.actions.state")
							local selected_entry = state.get_selected_entry()
							local current_picker = state.get_current_picker(prompt_bufnr)
							table.remove(harpoon_files.items, selected_entry.index)
							current_picker:refresh(finder())
						end)
						-- clear all harpoon entries
						map("i", "<C-c>", function()
							local state = require("telescope.actions.state")
							local current_picker = state.get_current_picker(prompt_bufnr)
							harpoon_files.items = {}
							current_picker:refresh(finder())
						end)
						return true
					end,
				})
				:find()
		end

		-- FROM harpoon docs - https://github.com/ThePrimeagen/harpoon/tree/harpoon2?tab=readme-ov-file#basic-setup
		vim.keymap.set("n", "<C-e>", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })
		--
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)

		-- IN case I want to hotkey to files in list instead of using the viewer
		-- vim.keymap.set("n", "<C-y>", function()
		-- 	harpoon:list():select(1)
		-- end)
		-- vim.keymap.set("n", "<C-u>", function()
		-- 	harpoon:list():select(2)
		-- end)
		-- vim.keymap.set("n", "<C-i>", function()
		-- 	harpoon:list():select(3)
		-- end)
		-- vim.keymap.set("n", "<C-o>", function()
		-- 	harpoon:list():select(4)
		-- end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-a>", function()
			-- TODO allow for infinite navigation, i.e. if at first item, and I click back,
			-- navigate to last item
			harpoon:list():prev({ ui_nav_wrap = true })
		end)
		vim.keymap.set("n", "<C-s>", function()
			harpoon:list():next({ ui_nav_wrap = true })
		end)

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

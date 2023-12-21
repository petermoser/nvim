-- copilot settings, those are by default set to false
-- require("copilot").setup({
-- 	suggestion = {
-- 		auto_trigger = true,
-- 		debounce = 300,
-- 		keymap = {
-- 			-- <Option-y>
-- 			accept = "¥",
-- 			-- <Option-f>
-- 			next = "ƒ",
-- 			-- <Option-b>
-- 			prev = "∫",
-- 			-- <Option-d>
-- 			dismiss = "∂",
-- 		},
-- 	},
-- 	filetypes = {
-- 		yaml = true,
-- 		markdown = true,
-- 		gitcommit = true,
-- 		gitrebase = true,
-- 	},
-- })
--
vim.g.copilot_filetypes = {
	gitcommit = true,
	gitrebase = true,
	markdown = true,
	yaml = true,
}

-- remember to start the LLM with for example:
-- ollama run mistral:instruct

-- vim.keymap.set("v", "<leader>g", ":Gen<CR>")
-- vim.keymap.set("n", "<leader>g", ":Gen<CR>")
--
require("gen").model = "mistral:instruct"

require("gen").prompts["Explain Code"] = {
	prompt = "Explain in concise words what this code does:\n$text",
	replace = false,
}

require("gen").prompts["Commit Message"] = {
	prompt = "Write a one sentence commit message from the git diff:\n$text",
	replace = false,
}

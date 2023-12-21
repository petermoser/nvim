function gitSaveCommitPush()
	vim.cmd("Gwrite")
	vim.cmd('G commit -m "Minor changes"')
	vim.cmd("G push")
end

vim.keymap.set("n", "gs", ":lua gitSaveCommitPush()<CR>", { noremap = true, silent = true })

vim.keymap.set('v', '<leader>g', ':Gen<CR>')
vim.keymap.set('n', '<leader>g', ':Gen<CR>')

require('gen').model = 'mistral:instruct'

require('gen').prompts['Commit Message'] = {
  prompt = "Create a commit message from the text:\n$text",
  replace = false
}

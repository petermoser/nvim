vim.keymap.set('v', '<leader>]', ':Gen<CR>')
vim.keymap.set('n', '<leader>]', ':Gen<CR>')

require('gen').model = 'mistral:instruct'

require('gen').prompts['Commit Message'] = {
  prompt = "Create a commit message from the text:\n$text",
  replace = false
}

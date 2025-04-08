return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup {
      filters = {
        dotfiles = true,
      },
    }

    vim.keymap.set('n', '<leader>tt', ':NvimTreeFocus', { desc = 'Open Nvim Tree' })
  end,
}

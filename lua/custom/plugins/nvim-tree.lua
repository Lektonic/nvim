return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      filters = {
        dotfiles = true,
      },
    }

    vim.keymap.set('n', '<leader>tt', ':NvimTreeFocus<cr>', { desc = 'Open Nvim Tree' })
  end,
}

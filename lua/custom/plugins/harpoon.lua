return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<leader>jj', function()
      harpoon:list():add()
    end, { desc = 'Add File to Harpoon List' })
    --vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    vim.keymap.set('n', '<leader>jl', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Show Harpoon list' })

    vim.keymap.set('n', '<leader>ja', function()
      harpoon:list():select(1)
    end, { desc = 'Goto 1st file' })
    vim.keymap.set('n', '<leader>js', function()
      harpoon:list():select(2)
    end, { desc = 'Goto 2nd file' })
    vim.keymap.set('n', '<leader>jd', function()
      harpoon:list():select(3)
    end, { desc = 'Goto 3rd file' })
    vim.keymap.set('n', '<leader>jf', function()
      harpoon:list():select(4)
    end, { desc = 'Goto 4th file' })

    vim.keymap.set('n', '<leader>jn', function()
      harpoon:list():next()
    end, { desc = 'Next Buffer' })
    vim.keymap.set('n', '<leader>jp', function()
      harpoon:list():prev()
    end, { desc = 'Prev Buffer' })
  end,
}

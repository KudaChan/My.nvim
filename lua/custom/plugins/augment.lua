return {
  {
    'augmentcode/augment.vim',
    lazy = false,
    priority = 1000,
    config = function()
      -- Add a command to set workspace directory
      vim.api.nvim_create_user_command('AugmentSetWorkspace', function()
        local dir = vim.fn.input('Enter workspace directory: ', vim.fn.getcwd(), 'dir')
        vim.g.augment_workspace_folders = { dir }
        print('\nWorkspace set to: ' .. dir)
      end, {})

      -- Add keymaps for chat commands
      vim.keymap.set('n', '<leader>ac', '<cmd>Augment chat<cr>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>aucn', '<cmd>Augment chat-new<cr>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>auct', '<cmd>Augment chat-toggle<cr>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>auw', '<cmd>AugmentSetWorkspace<cr>', { noremap = true, silent = true })
      vim.keymap.set('n', '<C-y>', '<cmd>call augment#Accept()<cr>', { noremap = true, silent = true })
    end,
  },
}

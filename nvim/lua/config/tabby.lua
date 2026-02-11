vim.o.showtabline = 2
vim.api.nvim_set_keymap("n", "<leader>j", ":Tabby jump_to_tab<CR>", { noremap = true })

local theme = {
  fill = { bg='#e08cff', style='italic' },
  head = { fg='white', bg='#8900bf' },
  current_tab = { fg='white', bg='#8900bf' },
  tab = { fg='white', bg='#451657' },
  win = { fg='white', bg='#8900bf' },
  tail = { fg='white', bg='#8900bf' },
}

require('tabby').setup({
  line = function(line)
    return {
      {
        { '  ', hl = theme.head },
        line.sep('', theme.head, theme.fill),
      },
      line.tabs().foreach(function(tab)
        local hl = tab.is_current() and theme.current_tab or theme.tab
        return {
          line.sep('', hl, theme.fill),
          tab.jump_key(),
          tab.is_current() and '' or '󰆣',
          tab.number(),
          tab.name(),
          tab.close_btn(''),
          line.sep('', hl, theme.fill),
          hl = hl,
          margin = ' ',
        }
      end),
      line.spacer(),
      line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
        return {
          line.sep('', theme.win, theme.fill),
          win.is_current() and '' or '',
          win.buf_name(),
          line.sep('', theme.win, theme.fill),
          hl = theme.win,
          margin = ' ',
        }
      end),
      {
        line.sep('', theme.tail, theme.fill),
        { '  ', hl = theme.tail },
      },
      hl = theme.fill,
    }
  end,
})

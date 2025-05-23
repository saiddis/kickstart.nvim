return {
  'karb94/neoscroll.nvim',

  opts = {},

  config = function()
    neoscroll = require 'neoscroll'
    neoscroll.setup {
      mappings = { -- Keys to be mapped to their corresponding default scrolling animation
        '<C-u>',
        '<C-d>',
        '<C-b>',
        '<C-f>',
        -- '<C-y>',
        '<C-e>',
        'zt',
        'zz',
        'zb',
      },
      hide_cursor = true, -- Hide cursor while scrolling
      stop_eof = false, -- Stop at <EOF> when scrolling downwards
      respect_scrolloff = true, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = false, -- The cursor will keep on scrolling even if the window cannot scroll further
      -- duration_multiplier = 1.0, -- Global duration multiplier
      easing = 'linear', -- Default easing function
      pre_hook = nil, -- Function to run before the scrolling animation starts
      post_hook = nil, -- Function to run after the scrolling animation ends
      performance_mode = false, -- Disable "Performance Mode" on all buffers.
      ignored_events = { -- Events ignored while scrolling
        'WinScrolled',
        'CursorMoved',
      },
    }
    local keymap = {
      ['<C-u>'] = function()
        neoscroll.ctrl_u { duration = 200 }
      end,
      ['<C-d>'] = function()
        neoscroll.ctrl_d { duration = 200 }
      end,
      ['<C-b>'] = function()
        neoscroll.ctrl_b { duration = 450 }
      end,
      ['<C-f>'] = function()
        neoscroll.ctrl_f { duration = 450 }
      end,
      -- ['<C-y>'] = function()
      --   neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
      -- end,
      ['<C-e>'] = function()
        neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
      end,
      ['zt'] = function()
        neoscroll.zt { half_win_duration = 250 }
      end,
      ['zz'] = function()
        neoscroll.zz { half_win_duration = 250 }
      end,
      ['zb'] = function()
        neoscroll.zb { half_win_duration = 250 }
      end,
    }
    local modes = { 'n', 'v', 'x' }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end
  end,
}

-- For more art see: https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/text/neovim.lua
---@diagnostic disable-next-line: unused-local
local bloody = table.concat({
  [[                                                     ]],
  [[  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ]],
  [[  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ]],
  [[ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ]],
  [[ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ]],
  [[ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ]],
  [[ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ]],
  [[ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ]],
  [[    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ]],
  [[          ░    ░  ░    ░ ░        ░   ░         ░    ]],
  [[                                 ░                   ]],
  [[                                                     ]],
}, '\n')
---@diagnostic disable-next-line: unused-local
local elite = table.concat({
  [[                                   ]],
  [[  ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·.  ]],
  [[ •█▌▐█▀▄.▀·▪     ▪█·█▌██ ·██ ▐███▪ ]],
  [[ ▐█▐▐▌▐▀▀▪▄ ▄█▀▄ ▐█▐█•▐█·▐█ ▌▐▌▐█· ]],
  [[ ██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌ ]],
  [[ ▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀▀▀▀  █▪▀▀▀ ]],
  [[                                   ]],
}, '\n')
---@diagnostic disable: undefined-global
return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        preset = {
          header = elite,
        },
        sections = {
          { section = 'header' },
          -- { section = 'terminal', cmd = 'cat ~/.config/nvim/logo.cat', height = 32, padding = 1 },
          function()
            return {
              icon = ' ',
              title = 'Git Status',
              cmd = 'git --no-pager diff --stat -B -M -C',
              height = 10,
              section = 'terminal',
              enabled = Snacks.git.get_root() ~= nil,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }
          end,
          { section = 'startup' },
        },
      },
      indent = {
        enabled = true,
        indent = { char = '┊' },
        animate = { enabled = false },
      },
      notifier = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
    keys = {
      { '<leader>gb', function() Snacks.picker.git_branches() end, desc = 'Git Branches' },
      { '<leader>gS', function() Snacks.picker.git_status() end, desc = 'Git Status' },
      { ']]', function() Snacks.words.jump(vim.v.count1) end, desc = 'Next Reference', mode = { 'n', 't' } },
      { '[[', function() Snacks.words.jump(-vim.v.count1) end, desc = 'Prev Reference', mode = { 'n', 't' } },
    },
    config = function(_, opts) require('snacks').setup(opts) end,
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          -- Setup globals for debugging (lazy-loaded)
          -- _G.dd = function(...) Snacks.debug.inspect(...) end
          -- _G.bt = function() Snacks.debug.backtrace() end
          -- vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create toggle mappings
          Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map('<leader>tb')
          Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map('<leader>tc')
          Snacks.toggle.diagnostics():map('<leader>td')
          Snacks.toggle.dim():map('<leader>tD')
          Snacks.toggle.indent():map('<leader>tg')
          Snacks.toggle.inlay_hints():map('<leader>th')
          Snacks.toggle.line_number():map('<leader>tl')
          Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>tL')
          Snacks.toggle.option('spell', { name = 'Spelling' }):map('<leader>ts')
          Snacks.toggle.treesitter():map('<leader>tT')
          Snacks.toggle.option('wrap', { name = 'Wrap' }):map('<leader>tw')
          Snacks.toggle.zen():map('<leader>tz')
          Snacks.toggle.zoom():map('<leader>tZ')
        end,
      })
    end,
  },
}

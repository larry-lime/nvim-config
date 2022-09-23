require 'toggleterm'.setup {

  shade_terminals = false,
  start_in_insert = true,
  -- persist_mode = false,
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return 70
    end
  end,
  winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  }
}

local Terminal = require('toggleterm.terminal').Terminal

local ipython_h = Terminal:new({
  hidden = true,
  cmd = "ipython --no-banner",
  direction = "horizontal",
})

local ipython_v = Terminal:new({
  hidden = true,
  cmd = "ipython --no-banner",
  direction = "vertical",
})

local term_v = Terminal:new({
  hidden = true,
  direction = "vertical",
})

local term_1 = Terminal:new({
  hidden = true,
  direction = "horizontal",
})

local term_2 = Terminal:new({
  hidden = true,
  direction = "horizontal",
})

local term_3 = Terminal:new({
  hidden = true,
  direction = "horizontal",
})

function Term_toggle_1()
  term_1:toggle()
end

function Term_toggle_2()
  term_2:toggle()
end

function Term_toggle_3()
  term_3:toggle()
end

function Term_toggle_v()
  term_v:toggle()
end

function Ipython_toggle_h()
  ipython_h:toggle()
end

function Ipython_toggle_v()
  ipython_v:toggle()
end

local ls = require("luasnip")
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local date = function() return { os.date('%Y-%m-%d') } end

ls.add_snippets(nil, {
  tex = {
    snip({
      trig = "m",
      namr = "Inline Math",
      dscr = "Insert inline math",
    }, {
      text({ "$" }), insert(1, ""), text({ "$" }), insert(2),
      insert(0)
    }),
    snip({
      trig = "vec",
      namr = "Vector",
      dscr = "Insert Vector",
    }, {
      text({ "\\vec{" }), insert(1, ""), text({ "}" }), insert(2),
      insert(0)
    }),
    snip({
      trig = "v1",
      namr = "Vector 1",
      dscr = "Insert Vector 1",
    }, {
      text({ "\\vec{v_1}" }),
      insert(0)
    }),
    snip({
      trig = "v2",
      namr = "Vector 2",
      dscr = "Insert Vector 2",
    }, {
      text({ "\\vec{v_2}" }),
      insert(0)
    }),
    snip({
      trig = "v3",
      namr = "Vector 3",
      dscr = "Insert Vector 3",
    }, {
      text({ "\\vec{v_3}" }),
      insert(0)
    }),
    snip({
      trig = "R",
      namr = "Real Numbers",
      dscr = "Insert Real Numbers",
    }, {
      text({ "\\mathbb{R}" }),
      insert(0)
    }),
  },
})

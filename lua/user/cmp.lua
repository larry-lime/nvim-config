--    ________  _______
--   / ____/  |/  / __ \
--  / /   / /|_/ / /_/ /
-- / /___/ /  / / ____/
-- \____/_/  /_/_/

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- The following example advertise capabilities to `clangd`.
require 'lspconfig'.clangd.setup {
  capabilities = capabilities,
}

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
-- vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
-- vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })
-- vim.api.nvim_set_hl(0, "CmpItemKindCrate", { fg = "#F64D00" })

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ['<C-s>'] = cmp.mapping.complete({
      config = {
        sources = { { name = 'luasnip' } }
      }
    }),
    -- ['<C-c>'] = cmp.mapping.complete({
    --   config = {
    --     sources = { { name = 'copilot' } }
    --   }
    -- }),
    -- ['<C-n>'] = cmp.mapping.complete({
    --   config = {
    --     sources = { { name = 'cmp_tabnine' } }
    --   }
    -- }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, { "i", "s", }
    ),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s", }
    ),
    ["<A-n>"] = cmp.mapping(function()
      if luasnip.jumpable(1) then luasnip.jump(1) end
    end
    ),
    ["<A-p>"] = cmp.mapping(function()
      if luasnip.jumpable(-1) then luasnip.jump(-1) end
    end
    )
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = kind_icons[vim_item.kind]

      if entry.source.name == "copilot" then
        vim_item.kind = ""
        vim_item.kind_hl_group = "CmpItemKindCopilot"
      end

      -- if entry.source.name == "cmp_tabnine" then
      --   vim_item.kind = "פּ"
      --   vim_item.kind_hl_group = "CmpItemKindTabnine"
      -- end

      vim_item.menu = ({
        nvim_lua = "[NVIM LUA]",
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
        -- copilot = "[COPILOT]",
        -- neorg = "[NEORG]",
        -- cmp_tabnine = "[TN]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lua", group_index = 2 },
    { name = "nvim_lsp", group_index = 2 },
    { name = "luasnip", group_index = 2 },
    { name = "buffer", group_index = 2 },
    { name = "path", group_index = 2 },
    -- { name = "copilot", group_index = 2 },
    -- { name = "neorg", group_index = 2 },
    -- { name = "cmp_tabnine", group_index = 2 },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  view = {},
  experimental = {
    --ghost_text = true,
  },
}

local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = false,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,

  -- Crazy highlights!!
  -- #vid3
  -- ext_opts = nil,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { " <-- ", "NonTest" } },
      },
    },
  },
})

local snippet = ls.s
local snippet_from_nodes = ls.sn
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local ts_locals = require("nvim-treesitter.locals")
local ts_utils = require("nvim-treesitter.ts_utils")
local get_node_text = vim.treesitter.get_node_text

local transforms = {
  int = function(_, _)
    return t("0")
  end,

  bool = function(_, _)
    return t("false")
  end,

  string = function(_, _)
    return t([[""]])
  end,

  error = function(_, _)
    return t("err")
  end,

  -- Types with a "*" mean they are pointers, so return nil
  [function(text)
    return string.find(text, "*", 1, true) ~= nil
  end] = function(_, _)
    return t("nil")
  end,
}

local transform = function(text, info)
  local condition_matches = function(condition, ...)
    if type(condition) == "string" then
      return condition == text
    else
      return condition(...)
    end
  end

  for condition, result in pairs(transforms) do
    if condition_matches(condition, text, info) then
      return result(text, info)
    end
  end

  return t(text)
end

local handlers = {
  parameter_list = function(node, info)
    local result = {}

    local count = node:named_child_count()
    for idx = 0, count - 1 do
      local matching_node = node:named_child(idx)
      local type_node = matching_node:field("type")[1]
      table.insert(result, transform(get_node_text(type_node, 0), info))
      if idx ~= count - 1 then
        table.insert(result, t({ ", " }))
      end
    end

    return result
  end,

  type_identifier = function(node, info)
    local text = get_node_text(node, 0)
    return { transform(text, info) }
  end,
}

local function_node_types = {
  function_declaration = true,
  method_declaration = true,
  func_literal = true,
}

local function go_result_type(info)
  local cursor_node = ts_utils.get_node_at_cursor()
  local scope = ts_locals.get_scope_tree(cursor_node, 0)

  local function_node
  for _, v in ipairs(scope) do
    if function_node_types[v:type()] then
      function_node = v
      break
    end
  end

  if not function_node then
    print("Not inside of a function")
    return t("")
  end

  local query = vim.treesitter.query.parse(
    "go",
    [[
      [
        (method_declaration result: (_) @id)
        (function_declaration result: (_) @id)
        (func_literal result: (_) @id)
      ]
    ]]
  )
  for _, node in query:iter_captures(function_node, 0) do
    if handlers[node:type()] then
      return handlers[node:type()](node, info)
    end
  end
end

local go_ret_vals = function(args)
  return snippet_from_nodes(
    nil,
    go_result_type({
      index = 0,
      err_name = args[1][1],
      func_name = args[2][1],
    })
  )
end

ls.add_snippets(nil, {

  go = {
    snippet(
      "efi",
      fmta(
        [[
        <val>, <err> := <f>(<args>)
        if <err_same> != nil {
         	return <result>
        }
        <finish>
     ]],
        {
          val = i(1),
          err = i(2, "err"),
          f = i(3),
          args = i(4),
          err_same = rep(2),
          result = d(5, go_ret_vals, { 2, 3 }),
          finish = i(0),
        }
      )
    ),

    snippet(
      "fe",
      fmta(
        [[
        if err != nil {
         	return <res> 
        }
     ]],
        {
          res = i(1),
        }
      )
    ),
  },
})

-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-g>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-f>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set("i", "<c-t>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set("i", "<c-u>", require("luasnip.extras.select_choice"))
return {}

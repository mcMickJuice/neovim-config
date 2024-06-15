local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local eslint_ignore_rules = {
  s("eslint-ignore", { t("// eslint-ignore-next-line "), i(1, "rule"), t(" -- "), i(2, "explanation") }),
}
ls.add_snippets("javascript", eslint_ignore_rules)
ls.add_snippets("typescript", eslint_ignore_rules)
ls.add_snippets("javascriptreact", eslint_ignore_rules)
ls.add_snippets("typescriptreact", eslint_ignore_rules)

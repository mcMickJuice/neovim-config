local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local js_snippets = {
  s("eslint-ignore", { t("// eslint-disable-next-line "), i(1, "rule"), t(" -- "), i(2, "explanation") }),
  s("eslint-ignore-console", { t("// eslint-disable-next-line no-console -- "), i(1, "debugging") }),
}
local ts_snippets = {
  s(
    "eslint-ignore-any",
    { t("// eslint-disable-next-line @typescript-eslint/no-explicit-any -- "), i(1, "explanation") }
  ),
  s("ts-expect-error", { t("// @ts-expect-error -- "), i(1, "explanation") }),
}
-- add global js_snippets
ls.add_snippets("javascript", js_snippets)
ls.add_snippets("typescript", js_snippets)
ls.add_snippets("javascriptreact", js_snippets)
ls.add_snippets("typescriptreact", js_snippets)

-- add ts specific snippets
ls.add_snippets("typescript", ts_snippets)
ls.add_snippets("typescriptreact", ts_snippets)

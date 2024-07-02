local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local js_snippets = {
	s("eslint-ignore", { t("// eslint-disable-next-line "), i(1, "rule"), t(" -- "), i(2, "explanation") }),
	s("eslint-ignore-console", { t("// eslint-disable-next-line no-console -- "), i(1, "debugging") }),
	s("inf", { t("("), i(1, ""), t(") => {"), i(2, ""), t("}") }),
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

-- extend html snippets to handlebars
ls.filetype_extend("handlebars", { "html" })

local hbs_snippets = {
	s(
		"each",
		fmt(
			[[
  {{#each <>}}
  <>
  {{/each}}
  ]],
			{
				i(1, "var"),
				i(2, ""),
			},
			{ delimiters = "<>" }
		)
	),
	s(
		"if",
		fmt(
			[[
  {{#if <>}}
  <>
  {{/if}}
  ]],
			{
				i(1, "var"),
				i(2, ""),
			},
			{ delimiters = "<>" }
		)
	),
	s(
		"ifelse",
		fmt(
			[[
  {{#if <>}}
  <>
  {{else}}
  <>
  {{/if}}
  ]],
			{
				i(1, "var"),
				i(2, ""),
				i(3, ""),
			},
			{ delimiters = "<>" }
		)
	),
	s(
		"partial",
		fmt("{{> [] []=[]}}", {
			i(1, "name"),
			i(2, "params"),
			i(3, "value"),
		}, { delimiters = "[]" })
	),
}

ls.add_snippets("handlebars", hbs_snippets)

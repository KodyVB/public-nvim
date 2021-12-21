local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

M = {}
M.return_var = function()
return {
			s("bd", {
				t({"---", 
				"title: "}), i(1, "title"), t({"",
				"author: me",
				"output: pdf_document",
				"documentclass: "}), i(2, "article"), t({"",
				"header-includes:",
				"    \\usepackage[margin=1in]{geometry}",
				"    \\usepackage{caption}",
				"    \\usepackage{float}",
				"    \\floatplacement{figure}{H}",
				"---", "", ""}),
				i(0)
			}),
			s("uncheck", {
				t("- [ ] "), i(0)
			}),
			s("check", {
				t("- [x] "), i(0)
			}),
			s("columns", {
				t({"::: {.columns}",
				":::: {.column width=0.5}", "", ""}), i(1, "left"), t({"", "",
				"::::",
				":::: {.column width=0.5}", "", ""}), i(2, "right"), t({"", "",
				"::::",
				":::", "", ""}),
				i(0)
			}),
			s("subfigure", {
				t("<div id=\"fig:subfig"), i(1, "Label"), t({"\">",
				"!["}), i(2, "caption"), t("]("), i(3, "path"), t("){#fig:"), i(4, "label/size"), t({"}",
				"!["}), i(5, "caption"), t("]("), i(6, "path"), t("){#fig:"), i(7, "label/size"), t({"}", "", ""}),
				i(8, "caption"), t({"",
				"</div>", "", ""}),
				i(0)
			}),
			s("figure", {
				t("!["), i(1, "caption"), t("]("), i(2, "path"), t("){#fig:"), i(3, "label/size"), t({"}", ""}), i(0)
			}),
			s("table", {
				t({"\\begin{table}[H]", 
				"    \\centering",
				"    \\captionsetup{justification=centering}",
				"    \\begin{tabular}{"}), i(1, "columnFormat"), t({"}",
				"        "}), i(4, "content"), t({"",
				"    \\end{tabular}",
				"    \\caption{"}), i(2, "caption"), t({"}",
				"    \\label{tbl:"}), i(3, "label"), t({"}",
				"\\end{table}", "", ""}),
				i(0)
			}),
			s("label", {
				t("{#"), i(1, "label"), t("}"), i(0)
			}),
			s("bibliography", {
				t("bibliography: /home/me/Documents/git/"), i(0)
			}),
			s("reference", {
				t("[@"), i(1, "reference"), t("]"), i(0)
			}),
			s("usepackage", {
				t("\\usepackage{"), i(1), t("}"), i(0)
			}),
			s("image", {
				t("!["), i(1, "caption"), t("]("), i(2, "path"), t({")", ""}), i(0)
			}),
			s("link", {
				t("["), i(1, "caption"), t("]("), i(2, "path"), t(")"), i(0)
			}),
			s("equation", {
				t({"$$",
				""}), i(1), t({"",
				"$$", "", ""}),
				i(0)
			}),
			s("equation labeled", {
				t({"$$",
				""}), i(1), t({"",
				"$$ {#eq:"}), i(2, "label"), t({"}", "", ""}),
				i(0)
			}),
			s("split", {
				t({"\\begin{split}",
				"    "}), i(0), t({"",
				"\\end{split}"})
			}),
			s("cases", {
				t({"\\begin{cases}",
				"    "}), i(0), t({"",
				"\\end{cases}"})
			}),
			s("integral", {
				t("\\int_{"), i(1, "lower"), t("}^{"), i(2, "upper"), t("}{"), i(3, "body"), t("}"), i(0)
			}),
			s("sum", {
				t("\\sum_{"), i(1, "lower"), t("}^{"), i(2, "upper"), t("}{"), i(3, "body"), t("}"), i(0)
			}),
			s("absolute", {
				t("\\left\\lvert {"), i(1, "absolute value"), t("} \\right\\rvert "), i(0)
			}),
			s("sin", {
				t("\\sin{\\left( "), i(1), t(" \\right)}"), i(0)
			}),
			s("cos", {
				t("\\cos{\\left( "), i(1), t(" \\right)}"), i(0)
			}),
			s("tan", {
				t("\\tan{\\left( "), i(1), t(" \\right)}"), i(0)
			}),
			s("ln", {
				t("\\ln{\\left( "), i(1), t(" \\right)}"), i(0)
			}),
			s("log", {
				t("\\log{\\left( "), i(1), t(" \\right)}"), i(0)
			}),
			s("matrix", {
				t("\\begin{"), i(1, "pbvBV"), t({"matrix}",
				"    "}), i(0), t({"",
				"\\end{"}), f(copy, 1), t("matrix}")
			}),
			s("begin", {
				t("\\begin{"), i(1), t({"}",
				"    "}), i(2), t({"",
				"\\end{"}), f(copy, 1), t({"}", "", ""}),
				i(0)
			}),
		}
end
return M

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
		-- rec_ls is self-referencing. That makes this snippet 'infinite' eg. have as many
		-- \item as necessary by utilizing a choiceNode.
		s("itemize", {
			t({ "\\begin{itemize}",
			"    \\item " }), i(1),
			d(2, rec_ls, {}),
			t({ "", "\\end{itemize}" }),
		}),
		s("bd", {
			t("\\documentclass{"), i(1, "article"), t({"}", "", ""}),
			t({
				"\\usepackage[margin=1in]{geometry}",
				"\\usepackage{graphicx}",
				"\\graphicspath{"}), i(2), t({"}",
				"\\usepackage{float}",
				"\\usepackage{amsmath}",
				"\\usepackage{caption}",
				"\\usepackage{grffile}",
				"\\usepackage{cleveref}",
				"\\usepackage{subcaption}",
				"\\Crefmultiformat{figure}{#2#1#3}{ and~#2#1#3}{, #2#1#3}{ and~#2#1#3}","",
				"\\author{me}",
				"\\title{"}), i(3, "title"), t({"}", "",
				"\\begin{document}",
				"\\maketitle", "", ""}),
				i(0),
				t({"", "", "\\end{document}"})
			}),
			s("col", {
				t({"\\begin{columns}",
					"    \\column{0.5\\textwidth}", "    "}),
					i(1),
					t({"", "    \\column{0.5\\textwidth}", "    "}),
					i(2),
					t({"", "\\end{columns}", "", ""}),
					i(0)
			}),
			s("frame", {
				t({"\\begin{frame}[fragile]",
				"    \\frametitle{"}), i(1), t({"}", "    "}),
				i(2),
				t({"", "\\end{frame}", "", ""}),
				i(0)
			}),
			s("sfig", {
				t("\\begin{subfigure}{"), i(1), t({"\\textwidth}",
				"    \\centering",
				"    \\captionsetup{justification=centering}",
				"    \\includegraphics[width=\\linewidth]{"}), i(2), t({"}",
				"    \\caption{"}), i(3), t({"}",
				"    \\label{fig:sub"}), i(4, "Label"), t({"}",
				"\\end{subfigure}", ""}),
				i(0)
			}),
			s("fig", {
				t({"\\begin{figure}[H]",
				"    \\centering",
				"    \\captionsetup{justification=centering}",
				"    \\includegraphics["}), i(1, "size"), t("]{"), i(2, "path"), t({"}",
				"    \\caption{"}), i(3), t({"}",
				"    \\label{fig:"}), i(4, "Label"), t({"}",
				"\\end{figure}", ""}),
				i(0)
			}),
			s("tab", {
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
			s("biblatex", {
				t({"\\usepackage[backend=biber]{biblatex}",
				"\\addbibresource{"}), i(1, "bib_file"), t({"}", ""}),
				i(0)
			}),
			s("printbib", {
				t("\\printbibliography"), i(0)
			}),
			s("image", {
				t("\\includegraphics["), i(1, "size"), t("]{"), i(2, "path"), t({"}",
				"", ""}),
				i(0)
			}),
			s("equation", {
				t({"\\begin{equation}",
				"    "}), i(1), t({"",
				"\\end{equation}", "", ""}),
				i(0)
			}),
			s("equation labeled", {
				t("\\begin{equation}\\label{eq:"), i(1, "label"), t({"}",
				"    "}), i(2), t({"",
				"\\end{equation}", "", ""}),
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
			s("list x", {
				t({"\\begin{xlist}",
				"    \\ex "}), i(1),
				t({"", "\\end{xlist}", "", ""}),
				i(0)
			}),
			s("list enumerated", {
				t({"\\begin{enumerate}",
				"    \\item "}), i(1),
				d(2, rec_ls, {}),
				t({"", "\\end{enumerate}", "", ""}),
				i(0)
			}),
			s("list itemized", {
				t({"\\begin{itemize}",
				"    \\item "}), i(1),
				d(2, rec_ls, {}),
				t({"", "\\end{itemize}", "", ""}),
				i(0)
			}),
		}
end
return M

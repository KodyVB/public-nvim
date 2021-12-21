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
		s("main", {
			t({"int main(int argc, char *argv[])", "{", "    "}),
			i(0),
			t({"", "    return 0;", "}"}),
		}),
		s("in", {
			t("#include "),
			i(0)
		}),
		s("for", {
			t("for ("), i(1), t({")", "{", "    "}),
			i(0),
			t({"", "}"})
		}),
		s("fori", {
			t("for (int "), i(1), t(" = "), i(2), t("; "), f(copy, 1),
			c(3, {
				t(" <"), t(" >"), t(" <="), t(" >="), t(" !="),
			}),
			t(" "), i(4), t("; "), f(copy, 1),
			c(5, {
				t("++"), t("--"),
			}),
			t({")", "{", "    "}), i(0), t({"", "}"})
		}),
		s("while", {
			t("while ("), i(1), t({")", "{", "    "}),
			i(0),
			t({"", "}"})
		}),
		s("do", {
			t({"do", "{", "    "}),
			i(0),
			t({"", "} while ("}), i(1), t(")")
		}),
		s("fun", {
			i(1, "void"), t(" "), i(2, "name"), t(" ("), i(3, "parameters"),
			t({")", "{", "    "}), i(0), t({"", "}"})
		}),
		s("class", {
			t("class "), i(1, "ClassName"),
			t({"", "{", "    public:", "        "}),
			i(2),
			t({"", "    private:", "        "}),
			i(0),
			t({"", "};"})
		}),
		s("struct", {
			t("struct "), i(1, "StructName"),
			t({"", "{", "    "}),
			i(0),
			t({"", "};"})
		}),
	}
end
return M

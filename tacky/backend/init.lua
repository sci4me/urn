if not table.pack then table.pack = function(...) return { n = select("#", ...), ... } end end
if not table.unpack then table.unpack = unpack end
local load = load if _VERSION:find("5.1") then load = function(x, n, _, env) local f, e = loadstring(x, n) if not f then error(e, 2) end if env then setfenv(f, env) end return f end end
local _select, _unpack, _pack, _error = select, table.unpack, table.pack, error
local _libs = {}
local _temp = (function()
	return {
		['slice'] = function(xs, start, finish)
			if not finish then finish = xs.n end
			if not finish then finish = #xs end
			return { tag = "list", n = finish - start + 1, table.unpack(xs, start, finish) }
		end,
	}
end)()
for k, v in pairs(_temp) do _libs["lua/basic-0/".. k] = v end
local _3d_1, _2f3d_1, _3c_1, _3c3d_1, _3e_1, _2b_1, _2d_1, _25_1, error1, getIdx1, setIdx_21_1, require1, tonumber1, tostring1, type_23_1, _23_1, byte1, char1, find1, format1, gsub1, len1, rep1, sub1, upper1, concat1, unpack1, emptyStruct1, car1, _21_1, list_3f_1, string_3f_1, number_3f_1, symbol_3f_1, key_3f_1, type1, car2, last1, nth1, pushCdr_21_1, popLast_21_1, charAt1, _2e2e_1, quoted1, struct1, succ1, pred1, fail_21_1, formatPosition1, formatRange1, formatNode1, getSource1, create1, append_21_1, line_21_1, indent_21_1, unindent_21_1, beginBlock_21_1, nextBlock_21_1, endBlock_21_1, pushNode_21_1, popNode_21_1, _2d3e_string1, createLookup1, keywords1, createState1, builtins1, builtinVars1, escape1, escapeVar1, statement_3f_1, literal_3f_1, truthy_3f_1, compileQuote1, compileExpression1, compileBlock1, prelude1, backend1, wrapGenerate1, wrapNormal1
_3d_1 = function(v1, v2) return (v1 == v2) end
_2f3d_1 = function(v1, v2) return (v1 ~= v2) end
_3c_1 = function(v1, v2) return (v1 < v2) end
_3c3d_1 = function(v1, v2) return (v1 <= v2) end
_3e_1 = function(v1, v2) return (v1 > v2) end
_2b_1 = function(v1, v2) return (v1 + v2) end
_2d_1 = function(v1, v2) return (v1 - v2) end
_25_1 = function(v1, v2) return (v1 % v2) end
error1 = error
getIdx1 = function(v1, v2) return v1[v2] end
setIdx_21_1 = function(v1, v2, v3) v1[v2] = v3 end
require1 = require
tonumber1 = tonumber
tostring1 = tostring
type_23_1 = type
_23_1 = (function(x1)
	return x1["n"]
end)
byte1 = string.byte
char1 = string.char
find1 = string.find
format1 = string.format
gsub1 = string.gsub
len1 = string.len
rep1 = string.rep
sub1 = string.sub
upper1 = string.upper
concat1 = table.concat
unpack1 = table.unpack
emptyStruct1 = function() return ({}) end
car1 = (function(xs1)
	return xs1[1]
end)
_21_1 = (function(expr1)
	if expr1 then
		return false
	else
		return true
	end
end)
list_3f_1 = (function(x2)
	return (type1(x2) == "list")
end)
string_3f_1 = (function(x3)
	return (type1(x3) == "string")
end)
number_3f_1 = (function(x4)
	return (type1(x4) == "number")
end)
symbol_3f_1 = (function(x5)
	return (type1(x5) == "symbol")
end)
key_3f_1 = (function(x6)
	return (type1(x6) == "key")
end)
type1 = (function(val1)
	local ty1 = type_23_1(val1)
	if (ty1 == "table") then
		local tag1 = val1["tag"]
		if tag1 then
			return tag1
		else
			return "table"
		end
	else
		return ty1
	end
end)
car2 = (function(x7)
	local r_361 = type1(x7)
	if (r_361 ~= "list") then
		error1(format1("bad argment %s (expected %s, got %s)", "x", "list", r_361), 2)
	else
	end
	return car1(x7)
end)
last1 = (function(xs2)
	local r_451 = type1(xs2)
	if (r_451 ~= "list") then
		error1(format1("bad argment %s (expected %s, got %s)", "xs", "list", r_451), 2)
	else
	end
	return xs2[_23_1(xs2)]
end)
nth1 = (function(xs3, idx1)
	return xs3[idx1]
end)
pushCdr_21_1 = (function(xs4, val2)
	local r_461 = type1(xs4)
	if (r_461 ~= "list") then
		error1(format1("bad argment %s (expected %s, got %s)", "xs", "list", r_461), 2)
	else
	end
	local len2 = (_23_1(xs4) + 1)
	xs4["n"] = len2
	xs4[len2] = val2
	return xs4
end)
popLast_21_1 = (function(xs5)
	local r_471 = type1(xs5)
	if (r_471 ~= "list") then
		error1(format1("bad argment %s (expected %s, got %s)", "xs", "list", r_471), 2)
	else
	end
	xs5[_23_1(xs5)] = nil
	xs5["n"] = (_23_1(xs5) - 1)
	return xs5
end)
charAt1 = (function(xs6, x8)
	return sub1(xs6, x8, x8)
end)
_2e2e_1 = (function(...)
	local args1 = _pack(...) args1.tag = "list"
	return concat1(args1)
end)
local escapes1 = ({})
local r_631 = nil
r_631 = (function(r_641)
	if (r_641 <= 31) then
		escapes1[char1(r_641)] = _2e2e_1("\\", tostring1(r_641))
		return r_631((r_641 + 1))
	else
	end
end)
r_631(0)
escapes1["\n"] = "n"
quoted1 = (function(str1)
	local result1 = gsub1(format1("%q", str1), ".", escapes1)
	return result1
end)
struct1 = (function(...)
	local keys1 = _pack(...) keys1.tag = "list"
	if ((_23_1(keys1) % 1) == 1) then
		error1("Expected an even number of arguments to struct", 2)
	else
	end
	local contents1 = (function(key1)
		return key1["contents"]
	end)
	local out1 = ({})
	local r_781 = _23_1(keys1)
	local r_761 = nil
	r_761 = (function(r_771)
		if (r_771 <= r_781) then
			local key2 = keys1[r_771]
			local val3 = keys1[(1 + r_771)]
			out1[(function()
				if key_3f_1(key2) then
					return contents1(key2)
				else
					return key2
				end
			end)()
			] = val3
			return r_761((r_771 + 2))
		else
		end
	end)
	r_761(1)
	return out1
end)
succ1 = (function(x9)
	return (x9 + 1)
end)
pred1 = (function(x10)
	return (x10 - 1)
end)
fail_21_1 = (function(x11)
	return error1(x11, 0)
end)
formatPosition1 = (function(pos1)
	return _2e2e_1(pos1["line"], ":", pos1["column"])
end)
formatRange1 = (function(range1)
	if range1["finish"] then
		return format1("%s:[%s .. %s]", range1["name"], formatPosition1(range1["start"]), formatPosition1(range1["finish"]))
	else
		return format1("%s:[%s]", range1["name"], formatPosition1(range1["start"]))
	end
end)
formatNode1 = (function(node1)
	local temp1
	local r_1611 = node1["range"]
	if r_1611 then
		temp1 = node1["contents"]
	else
		temp1 = r_1611
	end
	if temp1 then
		return format1("%s (%q)", formatRange1(node1["range"]), node1["contents"])
	elseif node1["range"] then
		return formatRange1(node1["range"])
	elseif node1["owner"] then
		local owner1 = node1["owner"]
		if owner1["var"] then
			return format1("macro expansion of %s (%s)", owner1["var"]["name"], formatNode1(owner1["node"]))
		else
			return format1("unquote expansion (%s)", formatNode1(owner1["node"]))
		end
	else
		local temp2
		local r_1641 = node1["start"]
		if r_1641 then
			temp2 = node1["finish"]
		else
			temp2 = r_1641
		end
		if temp2 then
			return formatRange1(node1)
		else
			return "?"
		end
	end
end)
getSource1 = (function(node2)
	local result2 = nil
	local r_1621 = nil
	r_1621 = (function()
		local temp3
		local r_1631 = node2
		if r_1631 then
			temp3 = _21_1(result2)
		else
			temp3 = r_1631
		end
		if temp3 then
			result2 = node2["range"]
			node2 = node2["parent"]
			return r_1621()
		else
		end
	end)
	r_1621()
	return result2
end)
struct1("formatPosition", formatPosition1, "formatRange", formatRange1, "formatNode", formatNode1, "getSource", getSource1)
create1 = (function()
	return struct1("out", {tag = "list", n = 0}, "indent", 0, "tabs-pending", false, "line", 1, "lines", ({}), "node-stack", {tag = "list", n = 0}, "active-pos", nil)
end)
append_21_1 = (function(writer1, text1)
	local r_1591 = type1(text1)
	if (r_1591 ~= "string") then
		error1(format1("bad argment %s (expected %s, got %s)", "text", "string", r_1591), 2)
	else
	end
	local pos2 = writer1["active-pos"]
	if pos2 then
		local line1 = writer1["lines"][writer1["line"]]
		if line1 then
		else
			line1 = ({})
			writer1["lines"][writer1["line"]] = line1
		end
		line1[pos2] = true
	else
	end
	if writer1["tabs-pending"] then
		writer1["tabs-pending"] = false
		pushCdr_21_1(writer1["out"], rep1("\9", writer1["indent"]))
	else
	end
	return pushCdr_21_1(writer1["out"], text1)
end)
line_21_1 = (function(writer2, text2, force1)
	if text2 then
		append_21_1(writer2, text2)
	else
	end
	local temp4
	if force1 then
		temp4 = force1
	else
		temp4 = _21_1(writer2["tabs-pending"])
	end
	if temp4 then
		writer2["tabs-pending"] = true
		writer2["line"] = succ1(writer2["line"])
		return pushCdr_21_1(writer2["out"], "\n")
	else
	end
end)
indent_21_1 = (function(writer3)
	writer3["indent"] = succ1(writer3["indent"])
	return nil
end)
unindent_21_1 = (function(writer4)
	writer4["indent"] = pred1(writer4["indent"])
	return nil
end)
beginBlock_21_1 = (function(writer5, text3)
	line_21_1(writer5, text3)
	return indent_21_1(writer5)
end)
nextBlock_21_1 = (function(writer6, text4)
	unindent_21_1(writer6)
	line_21_1(writer6, text4)
	return indent_21_1(writer6)
end)
endBlock_21_1 = (function(writer7, text5)
	unindent_21_1(writer7)
	return line_21_1(writer7, text5)
end)
pushNode_21_1 = (function(writer8, node3)
	local range2 = getSource1(node3)
	if range2 then
		pushCdr_21_1(writer8["node-stack"], node3)
		writer8["active-pos"] = range2
		return nil
	else
	end
end)
popNode_21_1 = (function(writer9, node4)
	local range3 = getSource1(node4)
	if range3 then
		local stack1 = writer9["node-stack"]
		local previous1 = last1(stack1)
		if (previous1 == node4) then
		else
			error1("Incorrect node popped")
		end
		popLast_21_1(stack1)
		writer9["arg-pos"] = last1(stack1)
		return nil
	else
	end
end)
_2d3e_string1 = (function(writer10)
	return concat1(writer10["out"])
end)
createLookup1 = (function(...)
	local lst1 = _pack(...) lst1.tag = "list"
	local out2 = ({})
	local r_1691 = _23_1(lst1)
	local r_1671 = nil
	r_1671 = (function(r_1681)
		if (r_1681 <= r_1691) then
			local entry1 = lst1[r_1681]
			out2[entry1] = true
			return r_1671((r_1681 + 1))
		else
		end
	end)
	r_1671(1)
	return out2
end)
keywords1 = createLookup1("and", "break", "do", "else", "elseif", "end", "false", "for", "function", "if", "in", "local", "nil", "not", "or", "repeat", "return", "then", "true", "until", "while")
createState1 = (function(meta1)
	return struct1("ctr-lookup", ({}), "var-lookup", ({}), "meta", (function()
		if meta1 then
			return meta1
		else
			return ({})
		end
	end)())
end)
builtins1 = require1("tacky.analysis.resolve")["builtins"]
builtinVars1 = require1("tacky.analysis.resolve")["declaredVars"]
escape1 = (function(name1)
	if keywords1[name1] then
		return _2e2e_1("_e", name1)
	elseif find1(name1, "^%w[_%w%d]*$") then
		return name1
	else
		local out3
		local temp5
		local r_2331
		r_2331 = charAt1(name1, 1)
		temp5 = find1(r_2331, "%d")
		if temp5 then
			out3 = "_e"
		else
			out3 = ""
		end
		local upper2 = false
		local esc1 = false
		local r_1831 = len1(name1)
		local r_1811 = nil
		r_1811 = (function(r_1821)
			if (r_1821 <= r_1831) then
				local char2 = charAt1(name1, r_1821)
				local temp6
				local r_1851 = (char2 == "-")
				if r_1851 then
					local r_1861
					local r_2291
					r_2291 = charAt1(name1, pred1(r_1821))
					r_1861 = find1(r_2291, "[%a%d']")
					if r_1861 then
						local r_2271
						r_2271 = charAt1(name1, succ1(r_1821))
						temp6 = find1(r_2271, "[%a%d']")
					else
						temp6 = r_1861
					end
				else
					temp6 = r_1851
				end
				if temp6 then
					upper2 = true
				elseif find1(char2, "[^%w%d]") then
					local r_2311
					local r_2301 = char2
					r_2311 = byte1(r_2301)
					char2 = format1("%02x", r_2311)
					if esc1 then
					else
						esc1 = true
						out3 = _2e2e_1(out3, "_")
					end
					out3 = _2e2e_1(out3, char2)
				else
					if esc1 then
						esc1 = false
						out3 = _2e2e_1(out3, "_")
					else
					end
					if upper2 then
						upper2 = false
						char2 = upper1(char2)
					else
					end
					out3 = _2e2e_1(out3, char2)
				end
				return r_1811((r_1821 + 1))
			else
			end
		end)
		r_1811(1)
		if esc1 then
			out3 = _2e2e_1(out3, "_")
		else
		end
		return out3
	end
end)
escapeVar1 = (function(var1, state1)
	if builtinVars1[var1] then
		return var1["name"]
	else
		local v1 = escape1(var1["name"])
		local id1 = state1["var-lookup"][var1]
		if id1 then
		else
			id1 = succ1((function(r_1721)
				if r_1721 then
					return r_1721
				else
					return 0
				end
			end)(state1["ctr-lookup"][v1]))
			state1["ctr-lookup"][v1] = id1
			state1["var-lookup"][var1] = id1
		end
		return _2e2e_1(v1, tostring1(id1))
	end
end)
statement_3f_1 = (function(node5)
	if list_3f_1(node5) then
		local first1 = car2(node5)
		if symbol_3f_1(first1) then
			return (first1["var"] == builtins1["cond"])
		elseif list_3f_1(first1) then
			local func1 = car2(first1)
			local r_1731 = symbol_3f_1(func1)
			if r_1731 then
				return (func1["var"] == builtins1["lambda"])
			else
				return r_1731
			end
		else
			return false
		end
	else
		return false
	end
end)
literal_3f_1 = (function(node6)
	if list_3f_1(node6) then
		local first2 = car2(node6)
		local r_1741 = symbol_3f_1(first2)
		if r_1741 then
			local r_1751 = (first2["var"] == builtins1["quote"])
			if r_1751 then
				return r_1751
			else
				return (first2["var"] == builtins1["syntax-quote"])
			end
		else
			return r_1741
		end
	elseif symbol_3f_1(node6) then
		return builtinVars1[node6["var"]]
	else
		return true
	end
end)
truthy_3f_1 = (function(node7)
	local r_1761 = symbol_3f_1(node7)
	if r_1761 then
		return (builtinVars1["true"] == node7["var"])
	else
		return r_1761
	end
end)
compileQuote1 = (function(node8, out4, state2, level1)
	if (level1 == 0) then
		return compileExpression1(node8, out4, state2)
	else
		local ty2 = type1(node8)
		if (ty2 == "string") then
			return append_21_1(out4, quoted1(node8["value"]))
		elseif (ty2 == "number") then
			return append_21_1(out4, tostring1(node8["value"]))
		elseif (ty2 == "symbol") then
			append_21_1(out4, _2e2e_1("{ tag=\"symbol\", contents=", quoted1(node8["contents"])))
			if node8["var"] then
				append_21_1(out4, _2e2e_1(", var=", quoted1(tostring1(node8["var"]))))
			else
			end
			return append_21_1(out4, "}")
		elseif (ty2 == "key") then
			return append_21_1(out4, _2e2e_1("{tag=\"key\", value=", quoted1(node8["value"]), "}"))
		elseif (ty2 == "list") then
			local first3 = car2(node8)
			local temp7
			local r_1871 = symbol_3f_1(first3)
			if r_1871 then
				local r_1881 = (first3["var"] == builtins1["unquote"])
				if r_1881 then
					temp7 = r_1881
				else
					temp7 = ("var" == builtins1["unquote-splice"])
				end
			else
				temp7 = r_1871
			end
			if temp7 then
				return compileQuote1(nth1(node8, 2), out4, state2, (function()
					if level1 then
						return pred1(level1)
					else
						return level1
					end
				end)())
			else
				local temp8
				local r_1901 = symbol_3f_1(first3)
				if r_1901 then
					temp8 = (first3["var"] == builtins1["syntax-quote"])
				else
					temp8 = r_1901
				end
				if temp8 then
					return compileQuote1(nth1(node8, 2), out4, state2, (function()
						if level1 then
							return succ1(level1)
						else
							return level1
						end
					end)())
				else
					pushNode_21_1(out4, node8)
					local containsUnsplice1 = false
					local r_1961 = _23_1(node8)
					local r_1941 = nil
					r_1941 = (function(r_1951)
						if (r_1951 <= r_1961) then
							local sub2 = node8[r_1951]
							local temp9
							local r_1981 = list_3f_1(sub2)
							if r_1981 then
								local r_1991 = symbol_3f_1(car2(sub2))
								if r_1991 then
									temp9 = (sub2[1]["var"] == builtins1["unquote-splice"])
								else
									temp9 = r_1991
								end
							else
								temp9 = r_1981
							end
							if temp9 then
								containsUnsplice1 = true
							else
							end
							return r_1941((r_1951 + 1))
						else
						end
					end)
					r_1941(1)
					if containsUnsplice1 then
						local offset1 = 0
						beginBlock_21_1(out4, "(function()")
						line_21_1(out4, "local _offset, _result, _temp = 0, {tag=\"list\",n=0}")
						local r_2021 = _23_1(node8)
						local r_2001 = nil
						r_2001 = (function(r_2011)
							if (r_2011 <= r_2021) then
								local sub3 = nth1(node8, r_2011)
								local temp10
								local r_2041 = list_3f_1(sub3)
								if r_2041 then
									local r_2051 = symbol_3f_1(car2(sub3))
									if r_2051 then
										temp10 = (sub3[1]["var"] == builtins1["unquote-splice"])
									else
										temp10 = r_2051
									end
								else
									temp10 = r_2041
								end
								if temp10 then
									offset1 = (offset1 + 1)
									append_21_1(out4, "_temp = ")
									compileQuote1(nth1(sub3, 2), out4, state2, pred1(level1))
									line_21_1(out4)
									line_21_1(out4, _2e2e_1("for _c = 1, _temp.n do _result[", tostring1((r_2011 - offset1)), " + _c + _offset] = _temp[_c] end"))
									line_21_1(out4, "_offset = _offset + _temp.n")
								else
									append_21_1(out4, _2e2e_1("_result[", tostring1((r_2011 - offset1)), " + _offset] = "))
									compileQuote1(sub3, out4, state2, level1)
									line_21_1(out4)
								end
								return r_2001((r_2011 + 1))
							else
							end
						end)
						r_2001(1)
						line_21_1(out4, _2e2e_1("_result.n = _offset + ", tostring1((_23_1(node8) - offset1))))
						line_21_1(out4, "return _result")
						endBlock_21_1(out4, "end)()")
					else
						append_21_1(out4, _2e2e_1("{tag = \"list\", n = ", tostring1(_23_1(node8))))
						local r_2441 = _23_1(node8)
						local r_2421 = nil
						r_2421 = (function(r_2431)
							if (r_2431 <= r_2441) then
								local sub4 = node8[r_2431]
								append_21_1(out4, ", ")
								compileQuote1(sub4, out4, state2, level1)
								return r_2421((r_2431 + 1))
							else
							end
						end)
						r_2421(1)
						append_21_1(out4, "}")
					end
					return popNode_21_1(out4, node8)
				end
			end
		else
			return error1(_2e2e_1("Unknown type ", ty2))
		end
	end
end)
compileExpression1 = (function(node9, out5, state3, ret1)
	if list_3f_1(node9) then
		pushNode_21_1(out5, node9)
		local head1 = car2(node9)
		if symbol_3f_1(head1) then
			local var2 = head1["var"]
			if (var2 == builtins1["lambda"]) then
				if (ret1 == "") then
				else
					if ret1 then
						append_21_1(out5, ret1)
					else
					end
					local args2 = nth1(node9, 2)
					local variadic1 = nil
					local i1 = 1
					append_21_1(out5, "(function(")
					local r_2061 = nil
					r_2061 = (function()
						local temp11
						local r_2071 = (i1 <= _23_1(args2))
						if r_2071 then
							temp11 = _21_1(variadic1)
						else
							temp11 = r_2071
						end
						if temp11 then
							if (i1 > 1) then
								append_21_1(out5, ", ")
							else
							end
							local var3 = args2[i1]["var"]
							if var3["isVariadic"] then
								append_21_1(out5, "...")
								variadic1 = i1
							else
								append_21_1(out5, escapeVar1(var3, state3))
							end
							i1 = (i1 + 1)
							return r_2061()
						else
						end
					end)
					r_2061()
					beginBlock_21_1(out5, ")")
					if variadic1 then
						local argsVar1 = escapeVar1(args2[variadic1]["var"], state3)
						if (variadic1 == _23_1(args2)) then
							line_21_1(out5, _2e2e_1("local ", argsVar1, " = _pack(...) ", argsVar1, ".tag = \"list\""))
						else
							local remaining1 = (_23_1(args2) - variadic1)
							line_21_1(out5, _2e2e_1("local _n = _select(\"#\", ...) - ", tostring1(remaining1)))
							append_21_1(out5, _2e2e_1("local ", argsVar1))
							local r_2481 = _23_1(args2)
							local r_2461 = nil
							r_2461 = (function(r_2471)
								if (r_2471 <= r_2481) then
									append_21_1(out5, ", ")
									append_21_1(out5, escapeVar1(args2[r_2471]["var"], state3))
									return r_2461((r_2471 + 1))
								else
								end
							end)
							r_2461(succ1(variadic1))
							line_21_1(out5)
							beginBlock_21_1(out5, "if _n > 0 then")
							append_21_1(out5, argsVar1)
							line_21_1(out5, " = { tag=\"list\", n=_n, _unpack(_pack(...), 1, _n)}")
							local r_2521 = _23_1(args2)
							local r_2501 = nil
							r_2501 = (function(r_2511)
								if (r_2511 <= r_2521) then
									append_21_1(out5, escapeVar1(args2[r_2511]["var"], state3))
									if (r_2511 < _23_1(args2)) then
										append_21_1(out5, ", ")
									else
									end
									return r_2501((r_2511 + 1))
								else
								end
							end)
							r_2501(succ1(variadic1))
							line_21_1(out5, " = select(_n + 1, ...)")
							nextBlock_21_1(out5, "else")
							append_21_1(out5, argsVar1)
							line_21_1(out5, " = { tag=\"list\", n=0}")
							local r_2561 = _23_1(args2)
							local r_2541 = nil
							r_2541 = (function(r_2551)
								if (r_2551 <= r_2561) then
									append_21_1(out5, escapeVar1(args2[r_2551]["var"], state3))
									if (r_2551 < _23_1(args2)) then
										append_21_1(out5, ", ")
									else
									end
									return r_2541((r_2551 + 1))
								else
								end
							end)
							r_2541(succ1(variadic1))
							line_21_1(out5, " = ...")
							endBlock_21_1(out5, "end")
						end
					else
					end
					compileBlock1(node9, out5, state3, 3, "return ")
					unindent_21_1(out5)
					append_21_1(out5, "end)")
				end
			elseif (var2 == builtins1["cond"]) then
				local closure1 = _21_1(ret1)
				local hadFinal1 = false
				local ends1 = 1
				if closure1 then
					beginBlock_21_1(out5, "(function()")
					ret1 = "return "
				else
				end
				local i2 = 2
				local r_2581 = nil
				r_2581 = (function()
					local temp12
					local r_2591 = _21_1(hadFinal1)
					if r_2591 then
						temp12 = (i2 <= _23_1(node9))
					else
						temp12 = r_2591
					end
					if temp12 then
						local item1 = nth1(node9, i2)
						local case1 = nth1(item1, 1)
						local isFinal1 = truthy_3f_1(case1)
						if isFinal1 then
							if (i2 == 2) then
								append_21_1(out5, "do")
							else
							end
						elseif statement_3f_1(case1) then
							if (i2 > 2) then
								indent_21_1(out5)
								line_21_1(out5)
								ends1 = (ends1 + 1)
							else
							end
							local tmp1 = escapeVar1(struct1("name", "temp"), state3)
							line_21_1(out5, _2e2e_1("local ", tmp1))
							compileExpression1(case1, out5, state3, _2e2e_1(tmp1, " = "))
							line_21_1(out5)
							line_21_1(out5, _2e2e_1("if ", tmp1, " then"))
						else
							append_21_1(out5, "if ")
							compileExpression1(case1, out5, state3)
							append_21_1(out5, " then")
						end
						indent_21_1(out5)
						line_21_1(out5)
						compileBlock1(item1, out5, state3, 2, ret1)
						unindent_21_1(out5)
						if isFinal1 then
							hadFinal1 = true
						else
							append_21_1(out5, "else")
						end
						i2 = (i2 + 1)
						return r_2581()
					else
					end
				end)
				r_2581()
				if hadFinal1 then
				else
					indent_21_1(out5)
					line_21_1(out5)
					append_21_1(out5, "_error(\"unmatched item\")")
					unindent_21_1(out5)
					line_21_1(out5)
				end
				local r_2621 = ends1
				local r_2601 = nil
				r_2601 = (function(r_2611)
					if (r_2611 <= r_2621) then
						append_21_1(out5, "end")
						if (r_2611 < ends1) then
							unindent_21_1(out5)
							line_21_1(out5)
						else
						end
						return r_2601((r_2611 + 1))
					else
					end
				end)
				r_2601(1)
				if closure1 then
					line_21_1(out5)
					endBlock_21_1(out5, "end)()")
				else
				end
			elseif (var2 == builtins1["set!"]) then
				compileExpression1(nth1(node9, 3), out5, state3, _2e2e_1(escapeVar1(node9[2]["var"], state3), " = "))
				local temp13
				local r_2641 = ret1
				if r_2641 then
					temp13 = (ret1 ~= "")
				else
					temp13 = r_2641
				end
				if temp13 then
					line_21_1(out5)
					append_21_1(out5, ret1)
					append_21_1(out5, "nil")
				else
				end
			elseif (var2 == builtins1["define"]) then
				compileExpression1(nth1(node9, _23_1(node9)), out5, state3, _2e2e_1(escapeVar1(node9["defVar"], state3), " = "))
			elseif (var2 == builtins1["define-macro"]) then
				compileExpression1(nth1(node9, _23_1(node9)), out5, state3, _2e2e_1(escapeVar1(node9["defVar"], state3), " = "))
			elseif (var2 == builtins1["define-native"]) then
				local meta2 = state3["meta"][node9["defVar"]["fullName"]]
				local ty3 = type1(meta2)
				if (ty3 == "nil") then
					append_21_1(out5, format1("%s = _libs[%q]", escapeVar1(node9["defVar"], state3), node9["defVar"]["fullName"]))
				elseif (ty3 == "var") then
					append_21_1(out5, format1("%s = %s", escapeVar1(node9["defVar"], state3), meta2["contents"]))
				else
					local temp14
					local r_2651 = (ty3 == "expr")
					if r_2651 then
						temp14 = r_2651
					else
						temp14 = (ty3 == "stmt")
					end
					if temp14 then
						local count1 = meta2["count"]
						append_21_1(out5, format1("%s = function(", escapeVar1(node9["defVar"], state3)))
						local r_2661 = nil
						r_2661 = (function(r_2671)
							if (r_2671 <= count1) then
								if (r_2671 == 1) then
								else
									append_21_1(out5, ", ")
								end
								append_21_1(out5, _2e2e_1("v", tonumber1(r_2671)))
								return r_2661((r_2671 + 1))
							else
							end
						end)
						r_2661(1)
						append_21_1(out5, ") ")
						if (ty3 == "expr") then
							append_21_1(out5, "return ")
						else
						end
						local r_2711 = meta2["contents"]
						local r_2741 = _23_1(r_2711)
						local r_2721 = nil
						r_2721 = (function(r_2731)
							if (r_2731 <= r_2741) then
								local entry2 = r_2711[r_2731]
								if number_3f_1(entry2) then
									append_21_1(out5, _2e2e_1("v", tonumber1(entry2)))
								else
									append_21_1(out5, entry2)
								end
								return r_2721((r_2731 + 1))
							else
							end
						end)
						r_2721(1)
						append_21_1(out5, " end")
					else
						_error("unmatched item")
					end
				end
			elseif (var2 == builtins1["quote"]) then
				if (ret1 == "") then
				else
					if ret1 then
						append_21_1(out5, ret1)
					else
					end
					compileQuote1(nth1(node9, 2), out5, state3)
				end
			elseif (var2 == builtins1["syntax-quote"]) then
				if (ret1 == "") then
					append_21_1(out5, "local _ =")
				elseif ret1 then
					append_21_1(out5, ret1)
				else
				end
				compileQuote1(nth1(node9, 2), out5, state3, 1)
			elseif (var2 == builtins1["unquote"]) then
				fail_21_1("unquote outside of syntax-quote")
			elseif (var2 == builtins1["unquote-splice"]) then
				fail_21_1("unquote-splice outside of syntax-quote")
			elseif (var2 == builtins1["import"]) then
				if (ret1 == nil) then
					append_21_1(out5, "nil")
				elseif (ret1 ~= "") then
					append_21_1(out5, ret1)
					append_21_1(out5, "nil")
				else
				end
			else
				local meta3
				local r_2871 = symbol_3f_1(head1)
				if r_2871 then
					local r_2881 = (head1["var"]["tag"] == "native")
					if r_2881 then
						meta3 = state3["meta"][head1["var"]["fullName"]]
					else
						meta3 = r_2881
					end
				else
					meta3 = r_2871
				end
				local metaTy1 = type1(meta3)
				if (metaTy1 == "nil") then
				elseif (metaTy1 == "boolean") then
				elseif (metaTy1 == "expr") then
				elseif (metaTy1 == "stmt") then
					if ret1 then
					else
						meta3 = nil
					end
				elseif (metaTy1 == "var") then
					meta3 = nil
				else
					_error("unmatched item")
				end
				local temp15
				local r_2761 = meta3
				if r_2761 then
					temp15 = (pred1(_23_1(node9)) == meta3["count"])
				else
					temp15 = r_2761
				end
				if temp15 then
					local temp16
					local r_2771 = ret1
					if r_2771 then
						temp16 = (meta3["tag"] == "expr")
					else
						temp16 = r_2771
					end
					if temp16 then
						append_21_1(out5, ret1)
					else
					end
					local contents2 = meta3["contents"]
					local r_2801 = _23_1(contents2)
					local r_2781 = nil
					r_2781 = (function(r_2791)
						if (r_2791 <= r_2801) then
							local entry3 = nth1(contents2, r_2791)
							if number_3f_1(entry3) then
								compileExpression1(nth1(node9, succ1(entry3)), out5, state3)
							else
								append_21_1(out5, entry3)
							end
							return r_2781((r_2791 + 1))
						else
						end
					end)
					r_2781(1)
					local temp17
					local r_2821 = (meta3["tag"] ~= "expr")
					if r_2821 then
						temp17 = (ret1 ~= "")
					else
						temp17 = r_2821
					end
					if temp17 then
						line_21_1(out5)
						append_21_1(out5, ret1)
						append_21_1(out5, "nil")
						line_21_1(out5)
					else
					end
				else
					if ret1 then
						append_21_1(out5, ret1)
					else
					end
					if literal_3f_1(head1) then
						append_21_1(out5, "(")
						compileExpression1(head1, out5, state3)
						append_21_1(out5, ")")
					else
						compileExpression1(head1, out5, state3)
					end
					append_21_1(out5, "(")
					local r_2851 = _23_1(node9)
					local r_2831 = nil
					r_2831 = (function(r_2841)
						if (r_2841 <= r_2851) then
							if (r_2841 > 2) then
								append_21_1(out5, ", ")
							else
							end
							compileExpression1(nth1(node9, r_2841), out5, state3)
							return r_2831((r_2841 + 1))
						else
						end
					end)
					r_2831(2)
					append_21_1(out5, ")")
				end
			end
		else
			local temp18
			local r_2891 = ret1
			if r_2891 then
				local r_2901 = list_3f_1(head1)
				if r_2901 then
					local r_2911 = symbol_3f_1(car2(head1))
					if r_2911 then
						temp18 = (head1[1]["var"] == builtins1["lambda"])
					else
						temp18 = r_2911
					end
				else
					temp18 = r_2901
				end
			else
				temp18 = r_2891
			end
			if temp18 then
				local args3 = nth1(head1, 2)
				local offset2 = 1
				local r_2941 = _23_1(args3)
				local r_2921 = nil
				r_2921 = (function(r_2931)
					if (r_2931 <= r_2941) then
						local var4 = args3[r_2931]["var"]
						append_21_1(out5, _2e2e_1("local ", escapeVar1(var4, state3)))
						if var4["isVariadic"] then
							local count2 = (_23_1(node9) - _23_1(args3))
							if (count2 < 0) then
								count2 = 0
							else
							end
							append_21_1(out5, " = { tag=\"list\", n=")
							append_21_1(out5, tostring1(count2))
							local r_2981 = count2
							local r_2961 = nil
							r_2961 = (function(r_2971)
								if (r_2971 <= r_2981) then
									append_21_1(out5, ", ")
									compileExpression1(nth1(node9, (r_2931 + r_2971)), out5, state3)
									return r_2961((r_2971 + 1))
								else
								end
							end)
							r_2961(1)
							offset2 = count2
							line_21_1(out5, "}")
						else
							local expr2 = nth1(node9, (r_2931 + offset2))
							local name2 = escapeVar1(var4, state3)
							local ret2 = nil
							if expr2 then
								if statement_3f_1(expr2) then
									ret2 = _2e2e_1(name2, " = ")
									line_21_1(out5)
								else
									append_21_1(out5, " = ")
								end
								compileExpression1(expr2, out5, state3, ret2)
								line_21_1(out5)
							else
								line_21_1(out5)
							end
						end
						return r_2921((r_2931 + 1))
					else
					end
				end)
				r_2921(1)
				local r_3021 = _23_1(node9)
				local r_3001 = nil
				r_3001 = (function(r_3011)
					if (r_3011 <= r_3021) then
						compileExpression1(nth1(node9, r_3011), out5, state3, "")
						line_21_1(out5)
						return r_3001((r_3011 + 1))
					else
					end
				end)
				r_3001((_23_1(args3) + (offset2 + 1)))
				compileBlock1(head1, out5, state3, 3, ret1)
			else
				if ret1 then
					append_21_1(out5, ret1)
				else
				end
				if literal_3f_1(car2(node9)) then
					append_21_1(out5, "(")
					compileExpression1(car2(node9), out5, state3)
					append_21_1(out5, ")")
				else
					compileExpression1(car2(node9), out5, state3)
				end
				append_21_1(out5, "(")
				local r_3061 = _23_1(node9)
				local r_3041 = nil
				r_3041 = (function(r_3051)
					if (r_3051 <= r_3061) then
						if (r_3051 > 2) then
							append_21_1(out5, ", ")
						else
						end
						compileExpression1(nth1(node9, r_3051), out5, state3)
						return r_3041((r_3051 + 1))
					else
					end
				end)
				r_3041(2)
				append_21_1(out5, ")")
			end
		end
		return popNode_21_1(out5, node9)
	else
		if (ret1 == "") then
		else
			if ret1 then
				append_21_1(out5, ret1)
			else
			end
			if symbol_3f_1(node9) then
				return append_21_1(out5, escapeVar1(node9["var"], state3))
			elseif string_3f_1(node9) then
				return append_21_1(out5, quoted1(node9["value"]))
			elseif number_3f_1(node9) then
				return append_21_1(out5, tostring1(node9["value"]))
			elseif key_3f_1(node9) then
				return append_21_1(out5, quoted1(node9["value"]))
			else
				return error1(_2e2e_1("Unknown type: ", type1(node9)))
			end
		end
	end
end)
compileBlock1 = (function(nodes1, out6, state4, start1, ret3)
	local r_1791 = _23_1(nodes1)
	local r_1771 = nil
	r_1771 = (function(r_1781)
		if (r_1781 <= r_1791) then
			local ret_27_1
			if (r_1781 == _23_1(nodes1)) then
				ret_27_1 = ret3
			else
				ret_27_1 = ""
			end
			compileExpression1(nth1(nodes1, r_1781), out6, state4, ret_27_1)
			line_21_1(out6)
			return r_1771((r_1781 + 1))
		else
		end
	end)
	return r_1771(start1)
end)
prelude1 = (function(out7)
	line_21_1(out7, "if not table.pack then table.pack = function(...) return { n = select(\"#\", ...), ... } end end")
	line_21_1(out7, "if not table.unpack then table.unpack = unpack end")
	line_21_1(out7, "local load = load if _VERSION:find(\"5.1\") then load = function(x, n, _, env) local f, e = loadstring(x, n) if not f then error(e, 2) end if env then setfenv(f, env) end return f end end")
	return line_21_1(out7, "local _select, _unpack, _pack, _error = select, table.unpack, table.pack, error")
end)
backend1 = struct1("createState", createState1, "escape", escape1, "escapeVar", escapeVar1, "block", compileBlock1, "expression", compileExpression1, "prelude", prelude1)
wrapGenerate1 = (function(func2)
	return (function(node10, ...)
		local args4 = _pack(...) args4.tag = "list"
		local writer11 = create1()
		func2(node10, writer11, unpack1(args4, 1, _23_1(args4)))
		return _2d3e_string1(writer11)
	end)
end)
wrapNormal1 = (function(func3)
	return (function(...)
		local args5 = _pack(...) args5.tag = "list"
		local writer12 = create1()
		func3(writer12, unpack1(args5, 1, _23_1(args5)))
		return _2d3e_string1(writer12)
	end)
end)
return struct1("lua", struct1("expression", wrapGenerate1(compileExpression1), "block", wrapGenerate1(compileBlock1), "prelude", wrapNormal1(prelude1), "backend", backend1), "writer", struct1("create", create1, "append", append_21_1, "line", line_21_1, "tostring", _2d3e_string1))

if not table.pack then table.pack = function(...) return { n = select("#", ...), ... } end end
if not table.unpack then table.unpack = unpack end
local load = load if _VERSION:find("5.1") then load = function(x, _, _, env) local f, e = loadstring(x); if not f then error(e, 1) end; return setfenv(f, env) end end
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
for k, v in pairs(_temp) do _libs["lib/lua/basic/".. k] = v end
local _3d_1, _2f3d_1, _3c_1, _3c3d_1, _3e_1, _3e3d_1, _2b_1, _2d_1, _25_1, _2e2e_1, slice1, error1, getmetatable1, next1, pcall1, getIdx1, setIdx_21_1, require1, tostring1, type_23_1, _23_1, format1, concat1, remove1, unpack1, emptyStruct1, iterPairs1, car1, cdr1, list1, cons1, _21_1, pretty1, pair1, snd1, list_3f_1, nil_3f_1, string_3f_1, number_3f_1, symbol_3f_1, key_3f_1, exists_3f_1, type1, car2, cdr2, foldr1, map1, all1, nth1, pushCdr_21_1, removeNth_21_1, reverse1, caar1, _2e2e_2, struct1, _23_keys1, succ1, pred1, fail_21_1, self1, builtins1, visitQuote1, visitNode1, visitBlock1, builtins2, builtinVars1, createState1, getVar1, getNode1, addUsage_21_1, addDefinition_21_1, definitionsVisitor1, definitionsVisit1, usagesVisit1, builtins3, traverseQuote1, traverseNode1, traverseBlock1, traverseList1, putError_21_1, putWarning_21_1, putVerbose_21_1, putDebug_21_1, putNodeError_21_1, putNodeWarning_21_1, doNodeError_21_1, formatPosition1, formatRange1, formatNode1, getSource1, abs1, huge1, modf1, builtins4, builtinVars2, hasSideEffect1, constant_3f_1, urn_2d3e_val1, val_2d3e_urn1, truthy_3f_1, makeProgn1, getConstantVal1, optimiseOnce1, optimise1
_3d_1 = function(v1, v2) return (v1 == v2) end
_2f3d_1 = function(v1, v2) return (v1 ~= v2) end
_3c_1 = function(v1, v2) return (v1 < v2) end
_3c3d_1 = function(v1, v2) return (v1 <= v2) end
_3e_1 = function(v1, v2) return (v1 > v2) end
_3e3d_1 = function(v1, v2) return (v1 >= v2) end
_2b_1 = function(v1, v2) return (v1 + v2) end
_2d_1 = function(v1, v2) return (v1 - v2) end
_25_1 = function(v1, v2) return (v1 % v2) end
_2e2e_1 = function(v1, v2) return (v1 .. v2) end
slice1 = _libs["lib/lua/basic/slice"]
error1 = error
getmetatable1 = getmetatable
next1 = next
pcall1 = pcall
getIdx1 = function(v1, v2) return v1[v2] end
setIdx_21_1 = function(v1, v2, v3) v1[v2] = v3 end
require1 = require
tostring1 = tostring
type_23_1 = type
_23_1 = (function(x1)
	return x1["n"]
end)
format1 = string.format
concat1 = table.concat
remove1 = table.remove
unpack1 = table.unpack
emptyStruct1 = function() return {} end
iterPairs1 = function(x, f) for k, v in pairs(x) do f(k, v) end end
car1 = (function(xs1)
	return xs1[1]
end)
cdr1 = (function(xs2)
	return slice1(xs2, 2)
end)
list1 = (function(...)
	local xs3 = _pack(...) xs3.tag = "list"
	return xs3
end)
cons1 = (function(x2, xs4)
	return list1(x2, unpack1(xs4))
end)
_21_1 = (function(expr1)
	if expr1 then
		return false
	else
		return true
	end
end)
pretty1 = (function(value1)
	local ty1 = type_23_1(value1)
	if (ty1 == "table") then
		local tag1 = value1["tag"]
		if (tag1 == "list") then
			local out1 = {tag = "list", n = 0}
			local r_31 = _23_1(value1)
			local r_11 = nil
			r_11 = (function(r_21)
				if (r_21 <= r_31) then
					out1[r_21] = pretty1(value1[r_21])
					return r_11((r_21 + 1))
				else
				end
			end)
			r_11(1)
			return ("(" .. (concat1(out1, " ") .. ")"))
		else
			local temp1
			local r_71 = (type_23_1(getmetatable1(value1)) == "table")
			if r_71 then
				temp1 = (type_23_1(getmetatable1(value1)["--pretty-print"]) == "function")
			else
				temp1 = r_71
			end
			if temp1 then
				return getmetatable1(value1)["--pretty-print"](value1)
			elseif (tag1 == "list") then
				return value1["contents"]
			elseif (tag1 == "symbol") then
				return value1["contents"]
			elseif (tag1 == "key") then
				return (":" .. value1["contents"])
			elseif (tag1 == "string") then
				return format1("%q", value1["value"])
			elseif (tag1 == "number") then
				return tostring1(value1["value"])
			else
				return tostring1(value1)
			end
		end
	elseif (ty1 == "string") then
		return format1("%q", value1)
	else
		return tostring1(value1)
	end
end)
pair1 = (function(x3, y1)
	local ret1 = {}
	ret1["tag"] = { tag="symbol", contents="pair"}
	ret1["fst"] = x3
	ret1["snd"] = y1
	return ret1
end)
snd1 = (function(x4)
	return x4["snd"]
end)
list_3f_1 = (function(x5)
	return (type1(x5) == "list")
end)
nil_3f_1 = (function(x6)
	if x6 then
		local r_161 = list_3f_1(x6)
		if r_161 then
			return (_23_1(x6) == 0)
		else
			return r_161
		end
	else
		return x6
	end
end)
string_3f_1 = (function(x7)
	return (type1(x7) == "string")
end)
number_3f_1 = (function(x8)
	return (type1(x8) == "number")
end)
symbol_3f_1 = (function(x9)
	return (type1(x9) == "symbol")
end)
key_3f_1 = (function(x10)
	return (type1(x10) == "key")
end)
exists_3f_1 = (function(x11)
	return _21_1((type1(x11) == "nil"))
end)
type1 = (function(val1)
	local ty2 = type_23_1(val1)
	if (ty2 == "table") then
		local tag2 = val1["tag"]
		if tag2 then
			return tag2
		else
			return "table"
		end
	else
		return ty2
	end
end)
car2 = (function(x12)
	local r_361 = type1(x12)
	if (r_361 ~= "list") then
		error1(format1("bad argment %s (expected %s, got %s)", "x", "list", r_361), 2)
	else
	end
	return car1(x12)
end)
cdr2 = (function(x13)
	local r_371 = type1(x13)
	if (r_371 ~= "list") then
		error1(format1("bad argment %s (expected %s, got %s)", "x", "list", r_371), 2)
	else
	end
	if nil_3f_1(x13) then
		return {tag = "list", n = 0}
	else
		return cdr1(x13)
	end
end)
foldr1 = (function(f1, z1, xs5)
	local r_381 = type1(f1)
	if (r_381 ~= "function") then
		error1(format1("bad argment %s (expected %s, got %s)", "f", "function", r_381), 2)
	else
	end
	local r_501 = type1(xs5)
	if (r_501 ~= "list") then
		error1(format1("bad argment %s (expected %s, got %s)", "xs", "list", r_501), 2)
	else
	end
	if nil_3f_1(xs5) then
		return z1
	else
		local head1 = car2(xs5)
		local tail1 = cdr2(xs5)
		return f1(head1, foldr1(f1, z1, tail1))
	end
end)
map1 = (function(f2, xs6, acc1)
	local r_391 = type1(f2)
	if (r_391 ~= "function") then
		error1(format1("bad argment %s (expected %s, got %s)", "f", "function", r_391), 2)
	else
	end
	local r_511 = type1(xs6)
	if (r_511 ~= "list") then
		error1(format1("bad argment %s (expected %s, got %s)", "xs", "list", r_511), 2)
	else
	end
	if _21_1(exists_3f_1(acc1)) then
		return map1(f2, xs6, {tag = "list", n = 0})
	elseif nil_3f_1(xs6) then
		return reverse1(acc1)
	else
		return map1(f2, cdr2(xs6), cons1(f2(car2(xs6)), acc1))
	end
end)
all1 = (function(p1, xs7)
	local r_421 = type1(p1)
	if (r_421 ~= "function") then
		error1(format1("bad argment %s (expected %s, got %s)", "p", "function", r_421), 2)
	else
	end
	local r_551 = type1(xs7)
	if (r_551 ~= "list") then
		error1(format1("bad argment %s (expected %s, got %s)", "xs", "list", r_551), 2)
	else
	end
	return foldr1((function(x14, y2)
		if x14 then
			return y2
		else
			return x14
		end
	end), true, map1(p1, xs7))
end)
nth1 = (function(xs8, idx1)
	return xs8[idx1]
end)
pushCdr_21_1 = (function(xs9, val2)
	local r_461 = type1(xs9)
	if (r_461 ~= "list") then
		error1(format1("bad argment %s (expected %s, got %s)", "xs", "list", r_461), 2)
	else
	end
	local len1 = (_23_1(xs9) + 1)
	xs9["n"] = len1
	xs9[len1] = val2
	return xs9
end)
removeNth_21_1 = (function(li1, idx2)
	local r_481 = type1(li1)
	if (r_481 ~= "list") then
		error1(format1("bad argment %s (expected %s, got %s)", "li", "list", r_481), 2)
	else
	end
	li1["n"] = (li1["n"] - 1)
	return remove1(li1, idx2)
end)
reverse1 = (function(xs10, acc2)
	if _21_1(exists_3f_1(acc2)) then
		return reverse1(xs10, {tag = "list", n = 0})
	elseif nil_3f_1(xs10) then
		return acc2
	else
		return reverse1(cdr2(xs10), cons1(car2(xs10), acc2))
	end
end)
caar1 = (function(x15)
	return car2(car2(x15))
end)
_2e2e_2 = (function(...)
	local args1 = _pack(...) args1.tag = "list"
	return concat1(args1)
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
	local out2 = {}
	local r_721 = _23_1(keys1)
	local r_701 = nil
	r_701 = (function(r_711)
		if (r_711 <= r_721) then
			local key2 = keys1[r_711]
			local val3 = keys1[(1 + r_711)]
			out2[(function()
				if key_3f_1(key2) then
					return contents1(key2)
				else
					return key2
				end
			end)()
			] = val3
			return r_701((r_711 + 2))
		else
		end
	end)
	r_701(1)
	return out2
end)
_23_keys1 = (function(st1)
	local cnt1 = 0
	iterPairs1(st1, (function()
		cnt1 = (cnt1 + 1)
		return nil
	end))
	return cnt1
end)
succ1 = (function(x16)
	return (x16 + 1)
end)
pred1 = (function(x17)
	return (x17 - 1)
end)
fail_21_1 = (function(x18)
	return error1(x18, 0)
end)
self1 = (function(x19, key3, ...)
	local args2 = _pack(...) args2.tag = "list"
	return x19[key3](x19, unpack1(args2))
end)
builtins1 = require1("tacky.analysis.resolve")["builtins"]
visitQuote1 = (function(node1, visitor1, level1)
	if (level1 == 0) then
		return visitNode1(node1, visitor1)
	else
		local tag3 = node1["tag"]
		local temp2
		local r_1591 = (tag3 == "string")
		if r_1591 then
			temp2 = r_1591
		else
			local r_1601 = (tag3 == "number")
			if r_1601 then
				temp2 = r_1601
			else
				local r_1611 = (tag3 == "key")
				if r_1611 then
					temp2 = r_1611
				else
					temp2 = (tag3 == "symbol")
				end
			end
		end
		if temp2 then
			return nil
		elseif (tag3 == "list") then
			local first1 = nth1(node1, 1)
			local temp3
			if first1 then
				temp3 = (first1["tag"] == "symbol")
			else
				temp3 = first1
			end
			if temp3 then
				local temp4
				local r_1631 = (first1["contents"] == "unquote")
				if r_1631 then
					temp4 = r_1631
				else
					temp4 = (first1["contents"] == "unquote-splice")
				end
				if temp4 then
					return visitQuote1(nth1(node1, 2), visitor1, pred1(level1))
				elseif (first1["contents"] == "syntax-quote") then
					return visitQuote1(nth1(node1, 2), visitor1, succ1(level1))
				else
					local r_1681 = _23_1(node1)
					local r_1661 = nil
					r_1661 = (function(r_1671)
						if (r_1671 <= r_1681) then
							local sub1 = node1[r_1671]
							visitQuote1(sub1, visitor1, level1)
							return r_1661((r_1671 + 1))
						else
						end
					end)
					return r_1661(1)
				end
			else
				local r_1741 = _23_1(node1)
				local r_1721 = nil
				r_1721 = (function(r_1731)
					if (r_1731 <= r_1741) then
						local sub2 = node1[r_1731]
						visitQuote1(sub2, visitor1, level1)
						return r_1721((r_1731 + 1))
					else
					end
				end)
				return r_1721(1)
			end
		elseif error1 then
			return _2e2e_2("Unknown tag ", tag3)
		else
			_error("unmatched item")
		end
	end
end)
visitNode1 = (function(node2, visitor2)
	if (visitor2(node2, visitor2) == false) then
	else
		local tag4 = node2["tag"]
		local temp5
		local r_1521 = (tag4 == "string")
		if r_1521 then
			temp5 = r_1521
		else
			local r_1531 = (tag4 == "number")
			if r_1531 then
				temp5 = r_1531
			else
				local r_1541 = (tag4 == "key")
				if r_1541 then
					temp5 = r_1541
				else
					temp5 = (tag4 == "symbol")
				end
			end
		end
		if temp5 then
			return nil
		elseif (tag4 == "list") then
			local first2 = nth1(node2, 1)
			if (first2["tag"] == "symbol") then
				local func1 = first2["var"]
				local funct1 = func1["tag"]
				if (func1 == builtins1["lambda"]) then
					return visitBlock1(node2, 3, visitor2)
				elseif (func1 == builtins1["cond"]) then
					local r_1781 = _23_1(node2)
					local r_1761 = nil
					r_1761 = (function(r_1771)
						if (r_1771 <= r_1781) then
							local case1 = nth1(node2, r_1771)
							visitNode1(nth1(case1, 1), visitor2)
							visitBlock1(case1, 2, visitor2)
							return r_1761((r_1771 + 1))
						else
						end
					end)
					return r_1761(2)
				elseif (func1 == builtins1["set!"]) then
					return visitNode1(nth1(node2, 3), visitor2)
				elseif (func1 == builtins1["quote"]) then
				elseif (func1 == builtins1["syntax-quote"]) then
					return visitQuote1(nth1(node2, 2), visitor2, 1)
				else
					local temp6
					local r_1801 = (func1 == builtins1["unquote"])
					if r_1801 then
						temp6 = r_1801
					else
						temp6 = (func1 == builtins1["unquote-splice"])
					end
					if temp6 then
						return fail_21_1("unquote/unquote-splice should never appear head")
					else
						local temp7
						local r_1811 = (func1 == builtins1["define"])
						if r_1811 then
							temp7 = r_1811
						else
							temp7 = (func1 == builtins1["define-macro"])
						end
						if temp7 then
							return visitNode1(nth1(node2, _23_1(node2)), visitor2)
						elseif (func1 == builtins1["define-native"]) then
						elseif (func1 == builtins1["import"]) then
						else
							local temp8
							local r_1821 = (funct1 == "defined")
							if r_1821 then
								temp8 = r_1821
							else
								local r_1831 = (funct1 == "arg")
								if r_1831 then
									temp8 = r_1831
								else
									local r_1841 = (funct1 == "native")
									if r_1841 then
										temp8 = r_1841
									else
										temp8 = (funct1 == "macro")
									end
								end
							end
							if temp8 then
								return visitBlock1(node2, 1, visitor2)
							else
								return fail_21_1(_2e2e_2("Unknown kind ", funct1, " for variable ", func1["name"]))
							end
						end
					end
				end
			else
				return visitBlock1(node2, 1, visitor2)
			end
		else
			return error1(_2e2e_2("Unknown tag ", tag4))
		end
	end
end)
visitBlock1 = (function(node3, start1, visitor3)
	local r_1571 = _23_1(node3)
	local r_1551 = nil
	r_1551 = (function(r_1561)
		if (r_1561 <= r_1571) then
			visitNode1(nth1(node3, r_1561), visitor3)
			return r_1551((r_1561 + 1))
		else
		end
	end)
	return r_1551(start1)
end)
builtins2 = require1("tacky.analysis.resolve")["builtins"]
builtinVars1 = require1("tacky.analysis.resolve")["declaredVars"]
createState1 = (function()
	return struct1("vars", {}, "nodes", {})
end)
getVar1 = (function(state1, var1)
	local entry1 = state1["vars"][var1]
	if entry1 then
	else
		entry1 = struct1("var", var1, "usages", struct1(), "defs", struct1(), "active", false)
		state1["vars"][var1] = entry1
	end
	return entry1
end)
getNode1 = (function(state2, node4)
	local entry2 = state2["nodes"][node4]
	if entry2 then
	else
		entry2 = struct1("uses", {tag = "list", n = 0})
		state2["nodes"][node4] = entry2
	end
	return entry2
end)
addUsage_21_1 = (function(state3, var2, node5)
	local varMeta1 = getVar1(state3, var2)
	local nodeMeta1 = getNode1(state3, node5)
	varMeta1["usages"][node5] = true
	varMeta1["active"] = true
	nodeMeta1["uses"][var2] = true
	return nil
end)
addDefinition_21_1 = (function(state4, var3, node6, kind1, value2)
	local varMeta2 = getVar1(state4, var3)
	varMeta2["defs"][node6] = struct1("tag", kind1, "value", value2)
	return nil
end)
definitionsVisitor1 = (function(state5, node7, visitor4)
	local temp9
	local r_1411 = list_3f_1(node7)
	if r_1411 then
		temp9 = symbol_3f_1(car2(node7))
	else
		temp9 = r_1411
	end
	if temp9 then
		local func2 = car2(node7)["var"]
		if (func2 == builtins2["lambda"]) then
			local r_1431 = nth1(node7, 2)
			local r_1461 = _23_1(r_1431)
			local r_1441 = nil
			r_1441 = (function(r_1451)
				if (r_1451 <= r_1461) then
					local arg1 = r_1431[r_1451]
					addDefinition_21_1(state5, arg1["var"], arg1, "arg", arg1)
					return r_1441((r_1451 + 1))
				else
				end
			end)
			return r_1441(1)
		elseif (func2 == builtins2["set!"]) then
			return addDefinition_21_1(state5, node7[2]["var"], node7, "set", nth1(node7, 3))
		else
			local temp10
			local r_1481 = (func2 == builtins2["define"])
			if r_1481 then
				temp10 = r_1481
			else
				temp10 = (func2 == builtins2["define-macro"])
			end
			if temp10 then
				return addDefinition_21_1(state5, node7["defVar"], node7, "define", nth1(node7, _23_1(node7)))
			elseif (func2 == builtins2["define-native"]) then
				return addDefinition_21_1(state5, node7["defVar"], node7, "native")
			else
			end
		end
	else
		local temp11
		local r_1491 = list_3f_1(node7)
		if r_1491 then
			local r_1501 = list_3f_1(car2(node7))
			if r_1501 then
				local r_1511 = symbol_3f_1(caar1(node7))
				if r_1511 then
					temp11 = (caar1(node7)["var"] == builtins2["lambda"])
				else
					temp11 = r_1511
				end
			else
				temp11 = r_1501
			end
		else
			temp11 = r_1491
		end
		if temp11 then
			local lam1 = car2(node7)
			local args3 = nth1(lam1, 2)
			local offset1 = 1
			local r_1871 = _23_1(args3)
			local r_1851 = nil
			r_1851 = (function(r_1861)
				if (r_1861 <= r_1871) then
					local arg2 = nth1(args3, r_1861)
					local val4 = nth1(node7, (r_1861 + offset1))
					if arg2["var"]["isVariadic"] then
						local count1 = (_23_1(node7) - _23_1(args3))
						if (count1 < 0) then
							count1 = 0
						else
						end
						offset1 = count1
						addDefinition_21_1(state5, arg2["var"], arg2, "arg", arg2)
					else
						addDefinition_21_1(state5, arg2["var"], arg2, "let", (function()
							if val4 then
								return val4
							else
								return struct1("tag", "symbol", "contents", "nil", "var", builtinVars1["nil"])
							end
						end)())
					end
					return r_1851((r_1861 + 1))
				else
				end
			end)
			r_1851(1)
			visitBlock1(node7, 2, visitor4)
			visitBlock1(lam1, 3, visitor4)
			return false
		else
		end
	end
end)
definitionsVisit1 = (function(state6, nodes1)
	return visitBlock1(nodes1, 1, (function(r_1971, r_1981)
		return definitionsVisitor1(state6, r_1971, r_1981)
	end))
end)
usagesVisit1 = (function(state7, nodes2, pred2)
	if pred2 then
	else
		pred2 = (function()
			return true
		end)
	end
	local queue1 = {tag = "list", n = 0}
	local visited1 = {}
	local addUsage1 = (function(var4, user1)
		addUsage_21_1(state7, var4, user1)
		local varMeta3 = getVar1(state7, var4)
		if varMeta3["active"] then
			return iterPairs1(varMeta3["defs"], (function(_5f_1, def1)
				local val5 = def1["value"]
				local temp12
				if val5 then
					temp12 = _21_1(visited1[val5])
				else
					temp12 = val5
				end
				if temp12 then
					return pushCdr_21_1(queue1, val5)
				else
				end
			end))
		else
		end
	end)
	local visit1 = (function(node8)
		if visited1[node8] then
			return false
		else
			visited1[node8] = true
			if symbol_3f_1(node8) then
				addUsage1(node8["var"], node8)
				return true
			else
				local temp13
				local r_1991 = list_3f_1(node8)
				if r_1991 then
					local r_2001 = (_23_1(node8) > 0)
					if r_2001 then
						temp13 = symbol_3f_1(car2(node8))
					else
						temp13 = r_2001
					end
				else
					temp13 = r_1991
				end
				if temp13 then
					local func3 = car2(node8)["var"]
					local temp14
					local r_2011 = (func3 == builtins2["set!"])
					if r_2011 then
						temp14 = r_2011
					else
						local r_2021 = (func3 == builtins2["define"])
						if r_2021 then
							temp14 = r_2021
						else
							temp14 = (func3 == builtins2["define-macro"])
						end
					end
					if temp14 then
						if pred2(nth1(node8, 3)) then
							return true
						else
							return false
						end
					else
						return true
					end
				else
					return true
				end
			end
		end
	end)
	local r_1941 = _23_1(nodes2)
	local r_1921 = nil
	r_1921 = (function(r_1931)
		if (r_1931 <= r_1941) then
			local node9 = nodes2[r_1931]
			pushCdr_21_1(queue1, node9)
			return r_1921((r_1931 + 1))
		else
		end
	end)
	r_1921(1)
	local r_1961 = nil
	r_1961 = (function()
		if (_23_1(queue1) > 0) then
			visitNode1(removeNth_21_1(queue1, 1), visit1)
			return r_1961()
		else
		end
	end)
	return r_1961()
end)
builtins3 = require1("tacky.analysis.resolve")["builtins"]
traverseQuote1 = (function(node10, visitor5, level2)
	if (level2 == 0) then
		return traverseNode1(node10, visitor5)
	else
		local tag5 = node10["tag"]
		local temp15
		local r_2151 = (tag5 == "string")
		if r_2151 then
			temp15 = r_2151
		else
			local r_2161 = (tag5 == "number")
			if r_2161 then
				temp15 = r_2161
			else
				local r_2171 = (tag5 == "key")
				if r_2171 then
					temp15 = r_2171
				else
					temp15 = (tag5 == "symbol")
				end
			end
		end
		if temp15 then
			return node10
		elseif (tag5 == "list") then
			local first3 = nth1(node10, 1)
			local temp16
			if first3 then
				temp16 = (first3["tag"] == "symbol")
			else
				temp16 = first3
			end
			if temp16 then
				local temp17
				local r_2191 = (first3["contents"] == "unquote")
				if r_2191 then
					temp17 = r_2191
				else
					temp17 = (first3["contents"] == "unquote-splice")
				end
				if temp17 then
					node10[2] = traverseQuote1(nth1(node10, 2), visitor5, pred1(level2))
					return node10
				elseif (first3["contents"] == "syntax-quote") then
					node10[2] = traverseQuote1(nth1(node10, 2), visitor5, succ1(level2))
					return node10
				else
					local r_2221 = _23_1(node10)
					local r_2201 = nil
					r_2201 = (function(r_2211)
						if (r_2211 <= r_2221) then
							node10[r_2211] = traverseQuote1(nth1(node10, r_2211), visitor5, level2)
							return r_2201((r_2211 + 1))
						else
						end
					end)
					r_2201(1)
					return node10
				end
			else
				local r_2261 = _23_1(node10)
				local r_2241 = nil
				r_2241 = (function(r_2251)
					if (r_2251 <= r_2261) then
						node10[r_2251] = traverseQuote1(nth1(node10, r_2251), visitor5, level2)
						return r_2241((r_2251 + 1))
					else
					end
				end)
				r_2241(1)
				return node10
			end
		elseif error1 then
			return _2e2e_2("Unknown tag ", tag5)
		else
			_error("unmatched item")
		end
	end
end)
traverseNode1 = (function(node11, visitor6)
	local tag6 = node11["tag"]
	local temp18
	local r_2041 = (tag6 == "string")
	if r_2041 then
		temp18 = r_2041
	else
		local r_2051 = (tag6 == "number")
		if r_2051 then
			temp18 = r_2051
		else
			local r_2061 = (tag6 == "key")
			if r_2061 then
				temp18 = r_2061
			else
				temp18 = (tag6 == "symbol")
			end
		end
	end
	if temp18 then
		return visitor6(node11, visitor6)
	elseif (tag6 == "list") then
		local first4 = car2(node11)
		first4 = visitor6(first4, visitor6)
		node11[1] = first4
		if (first4["tag"] == "symbol") then
			local func4 = first4["var"]
			local funct2 = func4["tag"]
			if (func4 == builtins3["lambda"]) then
				traverseBlock1(node11, 3, visitor6)
				return visitor6(node11, visitor6)
			elseif (func4 == builtins3["cond"]) then
				local r_2301 = _23_1(node11)
				local r_2281 = nil
				r_2281 = (function(r_2291)
					if (r_2291 <= r_2301) then
						local case2 = nth1(node11, r_2291)
						case2[1] = traverseNode1(nth1(case2, 1), visitor6)
						traverseBlock1(case2, 2, visitor6)
						return r_2281((r_2291 + 1))
					else
					end
				end)
				r_2281(2)
				return visitor6(node11, visitor6)
			elseif (func4 == builtins3["set!"]) then
				node11[3] = traverseNode1(nth1(node11, 3), visitor6)
				return visitor6(node11, visitor6)
			elseif (func4 == builtins3["quote"]) then
				return visitor6(node11, visitor6)
			elseif (func4 == builtins3["syntax-quote"]) then
				node11[2] = traverseQuote1(nth1(node11, 2), visitor6, 1)
				return visitor6(node11, visitor6)
			else
				local temp19
				local r_2321 = (func4 == builtins3["unquote"])
				if r_2321 then
					temp19 = r_2321
				else
					temp19 = (func4 == builtins3["unquote-splice"])
				end
				if temp19 then
					return fail_21_1("unquote/unquote-splice should never appear head")
				else
					local temp20
					local r_2331 = (func4 == builtins3["define"])
					if r_2331 then
						temp20 = r_2331
					else
						temp20 = (func4 == builtins3["define-macro"])
					end
					if temp20 then
						node11[_23_1(node11)] = traverseNode1(nth1(node11, _23_1(node11)), visitor6)
						return visitor6(node11, visitor6)
					elseif (func4 == builtins3["define-native"]) then
						return visitor6(node11, visitor6)
					elseif (func4 == builtins3["import"]) then
						return visitor6(node11, visitor6)
					else
						local temp21
						local r_2341 = (funct2 == "defined")
						if r_2341 then
							temp21 = r_2341
						else
							local r_2351 = (funct2 == "arg")
							if r_2351 then
								temp21 = r_2351
							else
								local r_2361 = (funct2 == "native")
								if r_2361 then
									temp21 = r_2361
								else
									temp21 = (funct2 == "macro")
								end
							end
						end
						if temp21 then
							traverseList1(node11, 1, visitor6)
							return visitor6(node11, visitor6)
						else
							return fail_21_1(_2e2e_2("Unknown kind ", funct2, " for variable ", func4["name"]))
						end
					end
				end
			end
		else
			traverseList1(node11, 1, visitor6)
			return visitor6(node11, visitor6)
		end
	else
		return error1(_2e2e_2("Unknown tag ", tag6))
	end
end)
traverseBlock1 = (function(node12, start2, visitor7)
	local r_2091 = _23_1(node12)
	local r_2071 = nil
	r_2071 = (function(r_2081)
		if (r_2081 <= r_2091) then
			local result1 = traverseNode1(nth1(node12, (r_2081 + 0)), visitor7)
			node12[r_2081] = result1
			return r_2071((r_2081 + 1))
		else
		end
	end)
	r_2071(start2)
	return node12
end)
traverseList1 = (function(node13, start3, visitor8)
	local r_2131 = _23_1(node13)
	local r_2111 = nil
	r_2111 = (function(r_2121)
		if (r_2121 <= r_2131) then
			node13[r_2121] = traverseNode1(nth1(node13, r_2121), visitor8)
			return r_2111((r_2121 + 1))
		else
		end
	end)
	r_2111(start3)
	return node13
end)
putError_21_1 = (function(logger1, msg1)
	return self1(logger1, "put-error!", msg1)
end)
putWarning_21_1 = (function(logger2, msg2)
	return self1(logger2, "put-warning!", msg2)
end)
putVerbose_21_1 = (function(logger3, msg3)
	return self1(logger3, "put-verbose!", msg3)
end)
putDebug_21_1 = (function(logger4, msg4)
	return self1(logger4, "put-debug!", msg4)
end)
putNodeError_21_1 = (function(logger5, msg5, node14, explain1, ...)
	local lines1 = _pack(...) lines1.tag = "list"
	return self1(logger5, "put-node-error!", msg5, node14, explain1, lines1)
end)
putNodeWarning_21_1 = (function(logger6, msg6, node15, explain2, ...)
	local lines2 = _pack(...) lines2.tag = "list"
	return self1(logger6, "put-node-warning!", msg6, node15, explain2, lines2)
end)
doNodeError_21_1 = (function(logger7, msg7, node16, explain3, ...)
	local lines3 = _pack(...) lines3.tag = "list"
	self1(logger7, "put-node-error!", msg7, node16, explain3, lines3)
	return fail_21_1(msg7)
end)
struct1("putError", putError_21_1, "putWarning", putWarning_21_1, "putVerbose", putVerbose_21_1, "putDebug", putDebug_21_1, "putNodeError", putNodeError_21_1, "putNodeWarning", putNodeWarning_21_1, "doNodeError", doNodeError_21_1)
formatPosition1 = (function(pos1)
	return _2e2e_2(pos1["line"], ":", pos1["column"])
end)
formatRange1 = (function(range1)
	if range1["finish"] then
		return format1("%s:[%s .. %s]", range1["name"], formatPosition1(range1["start"]), formatPosition1(range1["finish"]))
	else
		return format1("%s:[%s]", range1["name"], formatPosition1(range1["start"]))
	end
end)
formatNode1 = (function(node17)
	local temp22
	local r_2371 = node17["range"]
	if r_2371 then
		temp22 = node17["contents"]
	else
		temp22 = r_2371
	end
	if temp22 then
		return format1("%s (%q)", formatRange1(node17["range"]), node17["contents"])
	elseif node17["range"] then
		return formatRange1(node17["range"])
	elseif node17["macro"] then
		local macro1 = node17["macro"]
		return format1("macro expansion of %s (%s)", macro1["var"]["name"], formatNode1(macro1["node"]))
	else
		local temp23
		local r_2401 = node17["start"]
		if r_2401 then
			temp23 = node17["finish"]
		else
			temp23 = r_2401
		end
		if temp23 then
			return formatRange1(node17)
		else
			return "?"
		end
	end
end)
getSource1 = (function(node18)
	local result2 = nil
	local r_2381 = nil
	r_2381 = (function()
		local temp24
		local r_2391 = node18
		if r_2391 then
			temp24 = _21_1(result2)
		else
			temp24 = r_2391
		end
		if temp24 then
			result2 = node18["range"]
			node18 = node18["parent"]
			return r_2381()
		else
		end
	end)
	r_2381()
	return result2
end)
struct1("formatPosition", formatPosition1, "formatRange", formatRange1, "formatNode", formatNode1, "getSource", getSource1)
abs1 = math.abs
huge1 = math.huge
modf1 = math.modf
builtins4 = require1("tacky.analysis.resolve")["builtins"]
builtinVars2 = require1("tacky.analysis.resolve")["declaredVars"]
hasSideEffect1 = (function(node19)
	local tag7 = type1(node19)
	local temp25
	local r_1241 = (tag7 == "number")
	if r_1241 then
		temp25 = r_1241
	else
		local r_1251 = (tag7 == "string")
		if r_1251 then
			temp25 = r_1251
		else
			local r_1261 = (tag7 == "key")
			if r_1261 then
				temp25 = r_1261
			else
				temp25 = (tag7 == "symbol")
			end
		end
	end
	if temp25 then
		return false
	elseif (tag7 == "list") then
		local fst1 = car2(node19)
		if (type1(fst1) == "symbol") then
			local var5 = fst1["var"]
			local r_1271 = (var5 ~= builtins4["lambda"])
			if r_1271 then
				return (var5 ~= builtins4["quote"])
			else
				return r_1271
			end
		else
			return true
		end
	else
		_error("unmatched item")
	end
end)
constant_3f_1 = (function(node20)
	local r_1281 = string_3f_1(node20)
	if r_1281 then
		return r_1281
	else
		local r_1291 = number_3f_1(node20)
		if r_1291 then
			return r_1291
		else
			return key_3f_1(node20)
		end
	end
end)
urn_2d3e_val1 = (function(node21)
	if string_3f_1(node21) then
		return node21["value"]
	elseif number_3f_1(node21) then
		return node21["value"]
	elseif key_3f_1(node21) then
		return node21["value"]
	else
		_error("unmatched item")
	end
end)
val_2d3e_urn1 = (function(val6)
	local ty3 = type_23_1(val6)
	if (ty3 == "string") then
		return struct1("tag", "string", "value", val6)
	elseif (ty3 == "number") then
		return struct1("tag", "number", "value", val6)
	elseif (ty3 == "nil") then
		return struct1("tag", "symbol", "contents", "nil", "var", builtinVars2["nil"])
	elseif (ty3 == "boolean") then
		return struct1("tag", "symbol", "contents", tostring1(val6), "var", builtinVars2[tostring1(val6)])
	else
		_error("unmatched item")
	end
end)
truthy_3f_1 = (function(node22)
	local temp26
	local r_1301 = string_3f_1(node22)
	if r_1301 then
		temp26 = r_1301
	else
		local r_1311 = key_3f_1(node22)
		if r_1311 then
			temp26 = r_1311
		else
			temp26 = number_3f_1(node22)
		end
	end
	if temp26 then
		return true
	elseif symbol_3f_1(node22) then
		return (builtinVars2["true"] == node22["var"])
	else
		return false
	end
end)
makeProgn1 = (function(body1)
	local lambda1 = struct1("tag", "symbol", "contents", "lambda", "var", builtins4["lambda"])
	return {tag = "list", n = 1, (function()
		local _offset, _result, _temp = 0, {tag="list",n=0}
		_result[1 + _offset] = lambda1
		_result[2 + _offset] = {tag = "list", n = 0}
		_temp = body1
		for _c = 1, _temp.n do _result[2 + _c + _offset] = _temp[_c] end
		_offset = _offset + _temp.n
		_result.n = _offset + 2
		return _result
	end)()
	}
end)
getConstantVal1 = (function(lookup1, sym1)
	local var6 = sym1["var"]
	local def2 = getVar1(lookup1, sym1["var"])
	if (var6 == builtinVars2["true"]) then
		return sym1
	elseif (var6 == builtinVars2["false"]) then
		return sym1
	elseif (var6 == builtinVars2["nil"]) then
		return sym1
	elseif (_23_keys1(def2["defs"]) == 1) then
		local ent1 = nth1(list1(next1(def2["defs"])), 2)
		local val7 = ent1["value"]
		local ty4 = ent1["tag"]
		local temp27
		local r_2411 = string_3f_1(val7)
		if r_2411 then
			temp27 = r_2411
		else
			local r_2421 = number_3f_1(val7)
			if r_2421 then
				temp27 = r_2421
			else
				temp27 = key_3f_1(val7)
			end
		end
		if temp27 then
			return val7
		else
			local temp28
			local r_2431 = symbol_3f_1(val7)
			if r_2431 then
				local r_2441 = (ty4 == "define")
				if r_2441 then
					temp28 = r_2441
				else
					local r_2451 = (ty4 == "set")
					if r_2451 then
						temp28 = r_2451
					else
						temp28 = (ty4 == "let")
					end
				end
			else
				temp28 = r_2431
			end
			if temp28 then
				local r_2461 = getConstantVal1(lookup1, val7)
				if r_2461 then
					return r_2461
				else
					return sym1
				end
			else
				return sym1
			end
		end
	else
		return nil
	end
end)
optimiseOnce1 = (function(nodes3, state8)
	local changed1 = false
	local r_1321 = nil
	r_1321 = (function(r_1331)
		local temp29
		if false then
			temp29 = (r_1331 <= 1)
		else
			temp29 = (r_1331 >= 1)
		end
		if temp29 then
			local node23 = nth1(nodes3, r_1331)
			local temp30
			local r_1361 = list_3f_1(node23)
			if r_1361 then
				local r_1371 = (_23_1(node23) > 0)
				if r_1371 then
					local r_1381 = symbol_3f_1(car2(node23))
					if r_1381 then
						temp30 = (car2(node23)["var"] == builtins4["import"])
					else
						temp30 = r_1381
					end
				else
					temp30 = r_1371
				end
			else
				temp30 = r_1361
			end
			if temp30 then
				if (r_1331 == _23_1(nodes3)) then
					nodes3[r_1331] = struct1("tag", "symbol", "contents", "nil", "var", builtinVars2["nil"])
				else
					removeNth_21_1(nodes3, r_1331)
				end
				changed1 = true
			else
			end
			return r_1321((r_1331 + -1))
		else
		end
	end)
	r_1321(_23_1(nodes3))
	local r_2471 = nil
	r_2471 = (function(r_2481)
		local temp31
		if false then
			temp31 = (r_2481 <= 1)
		else
			temp31 = (r_2481 >= 1)
		end
		if temp31 then
			local node24 = nth1(nodes3, r_2481)
			if _21_1(hasSideEffect1(node24)) then
				removeNth_21_1(nodes3, r_2481)
				changed1 = true
			else
			end
			return r_2471((r_2481 + -1))
		else
		end
	end)
	r_2471(pred1(_23_1(nodes3)))
	traverseList1(nodes3, 1, (function(node25)
		local temp32
		local r_2511 = list_3f_1(node25)
		if r_2511 then
			temp32 = all1(constant_3f_1, cdr2(node25))
		else
			temp32 = r_2511
		end
		if temp32 then
			local head2 = car2(node25)
			local meta1
			local r_2561 = symbol_3f_1(head2)
			if r_2561 then
				local r_2571 = _21_1(head2["folded"])
				if r_2571 then
					local r_2581 = (head2["var"]["tag"] == "native")
					if r_2581 then
						meta1 = state8["meta"][head2["var"]["fullName"]]
					else
						meta1 = r_2581
					end
				else
					meta1 = r_2571
				end
			else
				meta1 = r_2561
			end
			local temp33
			if meta1 then
				local r_2531 = meta1["pure"]
				if r_2531 then
					temp33 = meta1["value"]
				else
					temp33 = r_2531
				end
			else
				temp33 = meta1
			end
			if temp33 then
				local res1 = list1(pcall1(meta1["value"], unpack1(map1(urn_2d3e_val1, cdr2(node25)))))
				if car2(res1) then
					local val8 = nth1(res1, 2)
					local temp34
					local r_2541 = number_3f_1(val8)
					if r_2541 then
						local r_2551 = (snd1(pair1(modf1(val8))) ~= 0)
						if r_2551 then
							temp34 = r_2551
						else
							temp34 = (abs1(val8) == huge1)
						end
					else
						temp34 = r_2541
					end
					if temp34 then
						head2["folded"] = true
						return node25
					else
						return val_2d3e_urn1(val8)
					end
				else
					head2["folded"] = true
					putNodeWarning_21_1(state8["logger"], _2e2e_2("Cannot execute constant expression"), node25, nil, getSource1(node25), _2e2e_2("Executed ", pretty1(node25), ", failed with: ", nth1(res1, 2)))
					return node25
				end
			else
				return node25
			end
		else
			return node25
		end
	end))
	traverseList1(nodes3, 1, (function(node26)
		local temp35
		local r_2591 = list_3f_1(node26)
		if r_2591 then
			local r_2601 = symbol_3f_1(car2(node26))
			if r_2601 then
				temp35 = (car2(node26)["var"] == builtins4["cond"])
			else
				temp35 = r_2601
			end
		else
			temp35 = r_2591
		end
		if temp35 then
			local final1 = nil
			local r_2631 = _23_1(node26)
			local r_2611 = nil
			r_2611 = (function(r_2621)
				if (r_2621 <= r_2631) then
					local case3 = nth1(node26, r_2621)
					if final1 then
						changed1 = true
						removeNth_21_1(node26, final1)
					elseif truthy_3f_1(car2(nth1(node26, r_2621))) then
						final1 = succ1(r_2621)
					else
					end
					return r_2611((r_2621 + 1))
				else
				end
			end)
			r_2611(2)
			local temp36
			local r_2651 = (_23_1(node26) == 2)
			if r_2651 then
				temp36 = truthy_3f_1(car2(nth1(node26, 2)))
			else
				temp36 = r_2651
			end
			if temp36 then
				changed1 = true
				local body2 = cdr2(nth1(node26, 2))
				if (_23_1(body2) == 1) then
					return car2(body2)
				else
					return makeProgn1(cdr2(nth1(node26, 2)))
				end
			else
				return node26
			end
		else
			return node26
		end
	end))
	local lookup2 = createState1()
	definitionsVisit1(lookup2, nodes3)
	usagesVisit1(lookup2, nodes3, hasSideEffect1)
	local r_2661 = nil
	r_2661 = (function(r_2671)
		local temp37
		if false then
			temp37 = (r_2671 <= 1)
		else
			temp37 = (r_2671 >= 1)
		end
		if temp37 then
			local node27 = nth1(nodes3, r_2671)
			local temp38
			local r_2701 = node27["defVar"]
			if r_2701 then
				temp38 = _21_1(getVar1(lookup2, node27["defVar"])["active"])
			else
				temp38 = r_2701
			end
			if temp38 then
				if (r_2671 == _23_1(nodes3)) then
					nodes3[r_2671] = struct1("tag", "symbol", "contents", "nil", "var", builtinVars2["nil"])
				else
					removeNth_21_1(nodes3, r_2671)
				end
				changed1 = true
			else
			end
			return r_2661((r_2671 + -1))
		else
		end
	end)
	r_2661(_23_1(nodes3))
	visitBlock1(nodes3, 1, (function(node28)
		local temp39
		local r_2711 = list_3f_1(node28)
		if r_2711 then
			local r_2721 = list_3f_1(car2(node28))
			if r_2721 then
				local r_2731 = symbol_3f_1(caar1(node28))
				if r_2731 then
					temp39 = (caar1(node28)["var"] == builtins4["lambda"])
				else
					temp39 = r_2731
				end
			else
				temp39 = r_2721
			end
		else
			temp39 = r_2711
		end
		if temp39 then
			local lam2 = car2(node28)
			local args4 = nth1(lam2, 2)
			local offset2 = 1
			local remOffset1 = 0
			local r_2761 = _23_1(args4)
			local r_2741 = nil
			r_2741 = (function(r_2751)
				if (r_2751 <= r_2761) then
					local arg3 = nth1(args4, (r_2751 - remOffset1))
					local val9 = nth1(node28, ((r_2751 + offset2) - remOffset1))
					if arg3["var"]["isVariadic"] then
						local count2 = (_23_1(node28) - _23_1(args4))
						if (count2 < 0) then
							count2 = 0
						else
						end
						offset2 = count2
					elseif (nil == val9) then
					elseif hasSideEffect1(val9) then
					elseif (_23_keys1(getVar1(lookup2, arg3["var"])["usages"]) > 0) then
					else
						removeNth_21_1(args4, (r_2751 - remOffset1))
						removeNth_21_1(node28, ((r_2751 + offset2) - remOffset1))
						remOffset1 = (remOffset1 + 1)
					end
					return r_2741((r_2751 + 1))
				else
				end
			end)
			return r_2741(1)
		else
		end
	end))
	traverseList1(nodes3, 1, (function(node29)
		if symbol_3f_1(node29) then
			local var7 = getConstantVal1(lookup2, node29)
			local temp40
			if var7 then
				temp40 = (var7 ~= node29)
			else
				temp40 = var7
			end
			if temp40 then
				changed1 = true
				return var7
			else
				return node29
			end
		else
			return node29
		end
	end))
	return changed1
end)
optimise1 = (function(nodes4, state9)
	if state9 then
	else
		state9 = struct1("meta", {})
	end
	local iteration1 = 0
	local changed2 = true
	local r_1391 = nil
	r_1391 = (function()
		local temp41
		local r_1401 = changed2
		if r_1401 then
			temp41 = (iteration1 < 10)
		else
			temp41 = r_1401
		end
		if temp41 then
			changed2 = optimiseOnce1(nodes4, state9)
			iteration1 = (iteration1 + 1)
			return r_1391()
		else
		end
	end)
	r_1391()
	return nodes4
end)
return optimise1

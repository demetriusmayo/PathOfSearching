--[[

LUA MODULE

  bit.numberlua - Bitwise operations implemented in pure Lua as numbers,
    with Lua 5.2 'bit32' and (LuaJIT) LuaBitOp 'bit' compatibility interfaces.

SYNOPSIS

  local bit = require 'bit.numberlua'
  print(bit.band(0xff00ff00, 0x00ff00ff)) --> 0xffffffff
  
  -- Interface providing strong Lua 5.2 'bit32' compatibility
  local bit32 = require 'bit.numberlua'.bit32
  assert(bit32.band(-1) == 0xffffffff)
  
  -- Interface providing strong (LuaJIT) LuaBitOp 'bit' compatibility
  local bit = require 'bit.numberlua'.bit
  assert(bit.tobit(0xffffffff) == -1)
  
DESCRIPTION
  
  This library implements bitwise operations entirely in Lua.
  This module is typically intended if for some reasons you don't want
  to or cannot  install a popular C based bit library like BitOp 'bit' [1]
  (which comes pre-installed with LuaJIT) or 'bit32' (which comes
  pre-installed with Lua 5.2) but want a similar interface.
  
  This modules represents bit arrays as non-negative Lua numbers. [1]
  It can represent 32-bit bit arrays when Lua is compiled
  with lua_Number as double-precision IEEE 754 floating point.

  The module is nearly the most efficient it can be but may be a few times
  slower than the C based bit libraries and is orders or magnitude
  slower than LuaJIT bit operations, which compile to native code.  Therefore,
  this library is inferior in performane to the other modules.

  The `xor` function in this module is based partly on Roberto Ierusalimschy's
  post in http://lua-users.org/lists/lua-l/2002-09/msg00134.html .
  
  The included BIT.bit32 and BIT.bit sublibraries aims to provide 100%
  compatibility with the Lua 5.2 "bit32" and (LuaJIT) LuaBitOp "bit" library.
  This compatbility is at the cost of some efficiency since inputted
  numbers are normalized and more general forms (e.g. multi-argument
  bitwise operators) are supported.
  
STATUS

  WARNING: Not all corner cases have been tested and documented.
  Some attempt was made to make these similar to the Lua 5.2 [2]
  and LuaJit BitOp [3] libraries, but this is not fully tested and there
  are currently some differences.  Addressing these differences may
  be improved in the future but it is not yet fully determined how to
  resolve these differences.
  
  The BIT.bit32 library passes the Lua 5.2 test suite (bitwise.lua)
  http://www.lua.org/tests/5.2/ .  The BIT.bit library passes the LuaBitOp
  test suite (bittest.lua).  However, these have not been tested on
  platforms with Lua compiled with 32-bit integer numbers.

API

  BIT.tobit(x) --> z
  
    Similar to function in BitOp.
    
  BIT.tohex(x, n)
  
    Similar to function in BitOp.
  
  BIT.band(x, y) --> z
  
    Similar to function in Lua 5.2 and BitOp but requires two arguments.
  
  BIT.bor(x, y) --> z
  
    Similar to function in Lua 5.2 and BitOp but requires two arguments.

  BIT.bxor(x, y) --> z
  
    Similar to function in Lua 5.2 and BitOp but requires two arguments.
  
  BIT.bnot(x) --> z
  
    Similar to function in Lua 5.2 and BitOp.

  BIT.lshift(x, disp) --> z
  
    Similar to function in Lua 5.2 (warning: BitOp uses unsigned lower 5 bits of shift),
  
  BIT.rshift(x, disp) --> z
  
    Similar to function in Lua 5.2 (warning: BitOp uses unsigned lower 5 bits of shift),

  BIT.extract(x, field [, width]) --> z
  
    Similar to function in Lua 5.2.
  
  BIT.replace(x, v, field, width) --> z
  
    Similar to function in Lua 5.2.
  
  BIT.bswap(x) --> z
  
    Similar to function in Lua 5.2.

  BIT.rrotate(x, disp) --> z
  BIT.ror(x, disp) --> z
  
    Similar to function in Lua 5.2 and BitOp.

  BIT.lrotate(x, disp) --> z
  BIT.rol(x, disp) --> z

    Similar to function in Lua 5.2 and BitOp.
  
  BIT.arshift
  
    Similar to function in Lua 5.2 and BitOp.
    
  BIT.btest
  
    Similar to function in Lua 5.2 with requires two arguments.

  BIT.bit32
  
    This table contains functions that aim to provide 100% compatibility
    with the Lua 5.2 "bit32" library.
    
    bit32.arshift (x, disp) --> z
    bit32.band (...) --> z
    bit32.bnot (x) --> z
    bit32.bor (...) --> z
    bit32.btest (...) --> true | false
    bit32.bxor (...) --> z
    bit32.extract (x, field [, width]) --> z
    bit32.replace (x, v, field [, width]) --> z
    bit32.lrotate (x, disp) --> z
    bit32.lshift (x, disp) --> z
    bit32.rrotate (x, disp) --> z
    bit32.rshift (x, disp) --> z

  BIT.bit
  
    This table contains functions that aim to provide 100% compatibility
    with the LuaBitOp "bit" library (from LuaJIT).
    
    bit.tobit(x) --> y
    bit.tohex(x [,n]) --> y
    bit.bnot(x) --> y
    bit.bor(x1 [,x2...]) --> y
    bit.band(x1 [,x2...]) --> y
    bit.bxor(x1 [,x2...]) --> y
    bit.lshift(x, n) --> y
    bit.rshift(x, n) --> y
    bit.arshift(x, n) --> y
    bit.rol(x, n) --> y
    bit.ror(x, n) --> y
    bit.bswap(x) --> y
    
DEPENDENCIES

  None (other than Lua 5.1 or 5.2).
    
DOWNLOAD/INSTALLATION

  If using LuaRocks:
    luarocks install lua-bit-numberlua

  Otherwise, download <https://github.com/davidm/lua-bit-numberlua/zipball/master>.
  Alternately, if using git:
    git clone git://github.com/davidm/lua-bit-numberlua.git
    cd lua-bit-numberlua
  Optionally unpack:
    ./util.mk
  or unpack and install in LuaRocks:
    ./util.mk install 

REFERENCES

  [1] http://lua-users.org/wiki/FloatingPoint
  [2] http://www.lua.org/manual/5.2/
  [3] http://bitop.luajit.org/
  
LICENSE

  (c) 2008-2011 David Manura.  Licensed under the same terms as Lua (MIT).

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
  (end license)

--]]

local M = {}

local floor = math.floor

local MOD = 2^32
local MODM = MOD-1

local function memoize(f)
  local mt = {}
  local t = setmetatable({}, mt)
  function mt:__index(k)
    local v = f(k); t[k] = v
    return v
  end
  return t
end

local function make_bitop_uncached(t, m)
  local function bitop(a, b)
    local res,p = 0,1
    while a ~= 0 and b ~= 0 do
      local am, bm = a%m, b%m
      res = res + t[am][bm]*p
      a = (a - am) / m
      b = (b - bm) / m
      p = p*m
    end
    res = res + (a+b)*p
    return res
  end
  return bitop
end

local function make_bitop(t)
  local op1 = make_bitop_uncached(t,2^1)
  local op2 = memoize(function(a)
    return memoize(function(b)
      return op1(a, b)
    end)
  end)
  return make_bitop_uncached(op2, 2^(t.n or 1))
end

-- ok?  probably not if running on a 32-bit int Lua number type platform
function M.tobit(x)
  return x % 2^32
end

M.bxor = make_bitop {[0]={[0]=0,[1]=1},[1]={[0]=1,[1]=0}, n=4}
local bxor = M.bxor

function M.bnot(a)   return MODM - a end
local bnot = M.bnot

function M.band(a,b) return ((a+b) - bxor(a,b))/2 end
local band = M.band

function M.bor(a,b)  return MODM - band(MODM - a, MODM - b) end
local bor = M.bor

local lshift, rshift -- forward declare

function M.rshift(a,disp) -- Lua5.2 insipred
  if disp < 0 then return lshift(a,-disp) end
  return floor(a % 2^32 / 2^disp)
end
rshift = M.rshift

function M.lshift(a,disp) -- Lua5.2 inspired
  if disp < 0 then return rshift(a,-disp) end 
  return (a * 2^disp) % 2^32
end
lshift = M.lshift

function M.tohex(x, n) -- BitOp style
  n = n or 8
  local up
  if n <= 0 then
    if n == 0 then return '' end
    up = true
    n = - n
  end
  x = band(x, 16^n-1)
  return ('%0'..n..(up and 'X' or 'x')):format(x)
end
local tohex = M.tohex

function M.extract(n, field, width) -- Lua5.2 inspired
  width = width or 1
  return band(rshift(n, field), 2^width-1)
end
local extract = M.extract

function M.replace(n, v, field, width) -- Lua5.2 inspired
  width = width or 1
  local mask1 = 2^width-1
  v = band(v, mask1) -- required by spec?
  local mask = bnot(lshift(mask1, field))
  return band(n, mask) + lshift(v, field)
end
local replace = M.replace

function M.bswap(x)  -- BitOp style
  local a = band(x, 0xff); x = rshift(x, 8)
  local b = band(x, 0xff); x = rshift(x, 8)
  local c = band(x, 0xff); x = rshift(x, 8)
  local d = band(x, 0xff)
  return lshift(lshift(lshift(a, 8) + b, 8) + c, 8) + d
end
local bswap = M.bswap

function M.rrotate(x, disp)  -- Lua5.2 inspired
  disp = disp % 32
  local low = band(x, 2^disp-1)
  return rshift(x, disp) + lshift(low, 32-disp)
end
local rrotate = M.rrotate

function M.lrotate(x, disp)  -- Lua5.2 inspired
  return rrotate(x, -disp)
end
local lrotate = M.lrotate

M.rol = M.lrotate  -- LuaOp inspired
M.ror = M.rrotate  -- LuaOp insipred


function M.arshift(x, disp) -- Lua5.2 inspired
  local z = rshift(x, disp)
  if x >= 0x80000000 then z = z + lshift(2^disp-1, 32-disp) end
  return z
end
local arshift = M.arshift

function M.btest(x, y) -- Lua5.2 inspired
  return band(x, y) ~= 0
end

--
-- Start Lua 5.2 "bit32" compat section.
--

M.bit32 = {} -- Lua 5.2 'bit32' compatibility


local function bit32_bnot(x)
  return (-1 - x) % MOD
end
M.bit32.bnot = bit32_bnot

local function bit32_bxor(a, b, c, ...)
  local z
  if b then
    a = a % MOD
    b = b % MOD
    z = bxor(a, b)
    if c then
      z = bit32_bxor(z, c, ...)
    end
    return z
  elseif a then
    return a % MOD
  else
    return 0
  end
end
M.bit32.bxor = bit32_bxor

local function bit32_band(a, b, c, ...)
  local z
  if b then
    a = a % MOD
    b = b % MOD
    z = ((a+b) - bxor(a,b)) / 2
    if c then
      z = bit32_band(z, c, ...)
    end
    return z
  elseif a then
    return a % MOD
  else
    return MODM
  end
end
M.bit32.band = bit32_band

local function bit32_bor(a, b, c, ...)
  local z
  if b then
    a = a % MOD
    b = b % MOD
    z = MODM - band(MODM - a, MODM - b)
    if c then
      z = bit32_bor(z, c, ...)
    end
    return z
  elseif a then
    return a % MOD
  else
    return 0
  end
end
M.bit32.bor = bit32_bor

function M.bit32.btest(...)
  return bit32_band(...) ~= 0
end

function M.bit32.lrotate(x, disp)
  return lrotate(x % MOD, disp)
end

function M.bit32.rrotate(x, disp)
  return rrotate(x % MOD, disp)
end

function M.bit32.lshift(x,disp)
  if disp > 31 or disp < -31 then return 0 end
  return lshift(x % MOD, disp)
end

function M.bit32.rshift(x,disp)
  if disp > 31 or disp < -31 then return 0 end
  return rshift(x % MOD, disp)
end

function M.bit32.arshift(x,disp)
  x = x % MOD
  if disp >= 0 then
    if disp > 31 then
      return (x >= 0x80000000) and MODM or 0
    else
      local z = rshift(x, disp)
      if x >= 0x80000000 then z = z + lshift(2^disp-1, 32-disp) end
      return z
    end
  else
    return lshift(x, -disp)
  end
end

function M.bit32.extract(x, field, ...)
  local width = ... or 1
  if field < 0 or field > 31 or width < 0 or field+width > 32 then error 'out of range' end
  x = x % MOD
  return extract(x, field, ...)
end

function M.bit32.replace(x, v, field, ...)
  local width = ... or 1
  if field < 0 or field > 31 or width < 0 or field+width > 32 then error 'out of range' end
  x = x % MOD
  v = v % MOD
  return replace(x, v, field, ...)
end


--
-- Start LuaBitOp "bit" compat section.
--

M.bit = {} -- LuaBitOp "bit" compatibility

function M.bit.tobit(x)
  x = x % MOD
  if x >= 0x80000000 then x = x - MOD end
  return x
end
local bit_tobit = M.bit.tobit

function M.bit.tohex(x, ...)
  return tohex(x % MOD, ...)
end

function M.bit.bnot(x)
  return bit_tobit(bnot(x % MOD))
end

local function bit_bor(a, b, c, ...)
  if c then
    return bit_bor(bit_bor(a, b), c, ...)
  elseif b then
    return bit_tobit(bor(a % MOD, b % MOD))
  else
    return bit_tobit(a)
  end
end
M.bit.bor = bit_bor

local function bit_band(a, b, c, ...)
  if c then
    return bit_band(bit_band(a, b), c, ...)
  elseif b then
    return bit_tobit(band(a % MOD, b % MOD))
  else
    return bit_tobit(a)
  end
end
M.bit.band = bit_band

local function bit_bxor(a, b, c, ...)
  if c then
    return bit_bxor(bit_bxor(a, b), c, ...)
  elseif b then
    return bit_tobit(bxor(a % MOD, b % MOD))
  else
    return bit_tobit(a)
  end
end
M.bit.bxor = bit_bxor

function M.bit.lshift(x, n)
  return bit_tobit(lshift(x % MOD, n % 32))
end

function M.bit.rshift(x, n)
  return bit_tobit(rshift(x % MOD, n % 32))
end

function M.bit.arshift(x, n)
  return bit_tobit(arshift(x % MOD, n % 32))
end

function M.bit.rol(x, n)
  return bit_tobit(lrotate(x % MOD, n % 32))
end

function M.bit.ror(x, n)
  return bit_tobit(rrotate(x % MOD, n % 32))
end

function M.bit.bswap(x)
  return bit_tobit(bswap(x % MOD))
end


----------------------------------------------------------------------------------
-- Path of Building
--
-- Module: Mod Tools
-- Various functions for dealing with modifiers
--
local pairs = pairs
local ipairs = ipairs
local select = select
local type = type
local t_insert = table.insert
local t_sort = table.sort
local m_floor = math.floor
local m_abs = math.abs
local s_format = string.format
local band = bit32_band
local bor = bit32_bor

modLib = { }

function modLib.createMod(modName, modType, modVal, ...)
	local flags = 0
	local keywordFlags = 0
	local tagStart = 1
	local source
	if select('#', ...) >= 1 and type(select(1, ...)) == "string" then
		source = select(1, ...)
		tagStart = 2
	end
	if select('#', ...) >= 2 and type(select(2, ...)) == "number" then
		flags = select(2, ...)
		tagStart = 3
	end
	if select('#', ...) >= 3 and type(select(3, ...)) == "number" then
		keywordFlags = select(3, ...)
		tagStart = 4
	end
	return {
		name = modName,
		type = modType,
		value = modVal,
		flags = flags,
		keywordFlags = keywordFlags,
		source = source,
		select(tagStart, ...)
	}
end

modLib.parseMod = { }
modLib.parseModCache = { }


function modLib.compareModParams(modA, modB)
	if modA.name ~= modB.name or modA.type ~= modB.type or modA.flags ~= modB.flags or modA.keywordFlags ~= modB.keywordFlags or #modA ~= #modB then
		return false
	end
	for i, tag in ipairs(modA) do
		if tag.type ~= modB[i].type then
			return false
		end
		if modLib.formatTag(tag) ~= modLib.formatTag(modB[i]) then
			return false
		end
	end
	return true
end

function modLib.formatFlags(flags, src)
	local flagNames = { }
	for name, val in pairs(src) do
		if band(flags, val) == val then
			t_insert(flagNames, name)
		end
	end
	t_sort(flagNames)
	local ret
	for i, name in ipairs(flagNames) do
		ret = (ret and ret.."," or "") .. name
	end
	return ret or "-"
end

function modLib.formatTag(tag)
	local paramNames = { }
	local haveType
	for name, val in pairs(tag) do
		if name == "type" then
			haveType = true
		else
			t_insert(paramNames, name)
		end
	end
	t_sort(paramNames)
	if haveType then
		t_insert(paramNames, 1, "type")
	end
	local str = ""
	for i, paramName in ipairs(paramNames) do
		if i > 1 then
			str = str .. "/"
		end
		local val = tag[paramName]
		if type(val) == "table" then
			if val[1] then
				if type(val[1]) == "table" then
					val = modLib.formatTags(val)
				else
					val = table.concat(val, ",")
				end
			else
				val = modLib.formatTag(tag[paramName])
			end
			val = "{"..val.."}"
		end
		str = str .. s_format("%s=%s", paramName, tostring(val))
	end
	return str
end

function modLib.formatTags(tagList)
	local ret
	for _, tag in ipairs(tagList) do
		ret = (ret and ret.."," or "") .. modLib.formatTag(tag)
	end
	return ret or "-"
end

function modLib.formatValue(value)
	if type(value) ~= "table" then
		return tostring(value)
	end
	local paramNames = { }
	local haveType
	for name, val in pairs(value) do
		if name == "type" then
			haveType = true
		else
			t_insert(paramNames, name)
		end
	end
	t_sort(paramNames)
	if haveType then
		t_insert(paramNames, 1, "type")
	end
	local ret = ""
	for i, paramName in ipairs(paramNames) do
		if i > 1 then
			ret = ret .. "/"
		end
		if paramName == "mod" then
			ret = ret .. s_format("%s=[%s]", paramName, modLib.formatMod(value[paramName]))
		else
			ret = ret .. s_format("%s=%s", paramName, tostring(value[paramName]))
		end
	end
	return "{"..ret.."}"
end

function modLib.formatModParams(mod)
	return s_format("%s|%s|%s|%s|%s", mod.name, mod.type, modLib.formatFlags(mod.flags, ModFlag), modLib.formatFlags(mod.keywordFlags, KeywordFlag), modLib.formatTags(mod))
end

function modLib.formatMod(mod)
	return modLib.formatValue(mod.value) .. " = " .. modLib.formatModParams(mod)
end

----------------------------------------------------------------------------------
colorCodes = {
    NORMAL = "^xC8C8C8",
    MAGIC = "^x8888FF",
    RARE = "^xFFFF77",
    UNIQUE = "^xAF6025",
    RELIC = "^x60C060",
    GEM = "^x1AA29B",
    PROPHECY = "^xB54BFF",
    CURRENCY = "^xAA9E82",
    CRAFTED = "^xB8DAF1",
    CUSTOM = "^x5CF0BB",
    SOURCE = "^x88FFFF",
    UNSUPPORTED = "^xF05050",
    WARNING = "^xFF9922",
    TIP = "^x80A080",
    FIRE = "^xD02020",
    COLD = "^x60A0E7",
    LIGHTNING = "^xFFD700",
    CHAOS = "^xD02090",
    POSITIVE = "^x33FF77",
    NEGATIVE = "^xDD0022",
    OFFENCE = "^xE07030",
    DEFENCE = "^x8080E0",
    SCION = "^xFFF0F0",
    MARAUDER = "^xE05030",
    RANGER = "^x70FF70",
    WITCH = "^x7070FF",
    DUELIST = "^xE0E070",
    TEMPLAR = "^xC040FF",
    SHADOW = "^x30C0D0",
    MAINHAND = "^x50FF50",
    MAINHANDBG = "^x071907",
    OFFHAND = "^xB7B7FF",
    OFFHANDBG = "^x070719",
    SHAPER = "^x55BBFF",
    ELDER = "^xAA77CC",
}
colorCodes.STRENGTH = colorCodes.MARAUDER
colorCodes.DEXTERITY = colorCodes.RANGER
colorCodes.INTELLIGENCE = colorCodes.WITCH

ModFlag = {}
-- Damage modes
ModFlag.Attack = 0x00000001
ModFlag.Spell = 0x00000002
ModFlag.Hit = 0x00000004
ModFlag.Dot = 0x00000008
ModFlag.Cast = 0x00000010
-- Damage sources
ModFlag.Melee = 0x00000100
ModFlag.Area = 0x00000200
ModFlag.Projectile = 0x00000400
ModFlag.SourceMask = 0x00000600
ModFlag.Ailment = 0x00000800
-- Weapon types
ModFlag.Axe = 0x00001000
ModFlag.Bow = 0x00002000
ModFlag.Claw = 0x00004000
ModFlag.Dagger = 0x00008000
ModFlag.Mace = 0x00010000
ModFlag.Staff = 0x00020000
ModFlag.Sword = 0x00040000
ModFlag.Wand = 0x00080000
ModFlag.Unarmed = 0x00100000
-- Weapon classes
ModFlag.WeaponMelee = 0x00200000
ModFlag.WeaponRanged = 0x00400000
ModFlag.Weapon = 0x00800000
ModFlag.Weapon1H = 0x01000000
ModFlag.Weapon2H = 0x02000000

KeywordFlag = {}
-- Skill keywords
KeywordFlag.Aura = 0x00000001
KeywordFlag.Curse = 0x00000002
KeywordFlag.Warcry = 0x00000004
KeywordFlag.Movement = 0x00000008
KeywordFlag.Fire = 0x00000010
KeywordFlag.Cold = 0x00000020
KeywordFlag.Lightning = 0x00000040
KeywordFlag.Chaos = 0x00000080
KeywordFlag.Vaal = 0x00000100
KeywordFlag.Bow = 0x00000200
-- Skill types
KeywordFlag.Trap = 0x00001000
KeywordFlag.Mine = 0x00002000
KeywordFlag.Totem = 0x00004000
KeywordFlag.Minion = 0x00008000
KeywordFlag.Attack = 0x00010000
KeywordFlag.Spell = 0x00020000
KeywordFlag.Hit = 0x00040000
KeywordFlag.Ailment = 0x00080000
-- Other effects
KeywordFlag.Poison = 0x00100000
KeywordFlag.Bleed = 0x00200000
KeywordFlag.Ignite = 0x00400000
-- Damage over Time types
KeywordFlag.PhysicalDot = 0x01000000
KeywordFlag.LightningDot = 0x02000000
KeywordFlag.ColdDot = 0x04000000
KeywordFlag.FireDot = 0x08000000
KeywordFlag.ChaosDot = 0x10000000

-- Active skill types, used in ActiveSkills.dat and GrantedEffects.dat
-- Had to reverse engineer this, not sure what all of the values mean
SkillType = {
    Attack = 1,
    Spell = 2,
    Projectile = 3, -- Specifically skills which fire projectiles
    DualWield = 4, -- Attack requires dual wielding, only used on Dual Strike
    Buff = 5,
    Removed6 = 6, -- Now removed, was CanDualWield: Attack can be used while dual wielding
    MainHandOnly = 7, -- Attack only uses the main hand; removed in 3.5 but still needed for 2.6
    Removed8 = 8, -- Now removed, was only used on Cleave
    Minion = 9,
    Hit = 10, -- Skill hits (not used on attacks because all of them hit)
    Area = 11,
    Duration = 12,
    Shield = 13, -- Skill requires a shield
    ProjectileDamage = 14, -- Skill deals projectile damage but doesn't fire projectiles
    ManaCostReserved = 15, -- The skill's mana cost is a reservation
    ManaCostPercent = 16, -- The skill's mana cost is a percentage
    SkillCanTrap = 17, -- Skill can be turned into a trap
    SpellCanTotem = 18, -- Spell can be turned into a totem
    SkillCanMine = 19, -- Skill can be turned into a mine
    CauseElementalStatus = 20, -- Causes elemental status effects, but doesn't hit (used on Herald of Ash to allow Elemental Proliferation to apply)
    CreateMinion = 21, -- Creates or summons minions
    AttackCanTotem = 22, -- Attack can be turned into a totem
    Chaining = 23,
    Melee = 24,
    MeleeSingleTarget = 25,
    SpellCanRepeat = 26, -- Spell can repeat via Spell Echo
    Type27 = 27, -- No idea, used on auras and certain damage skills
    AttackCanRepeat = 28, -- Attack can repeat via Multistrike
    CausesBurning = 29, -- Deals burning damage
    Totem = 30,
    Type31 = 31, -- No idea, used on Molten Shell and the Thunder glove enchants, and added by Blasphemy
    Curse = 32,
    FireSkill = 33,
    ColdSkill = 34,
    LightningSkill = 35,
    TriggerableSpell = 36,
    Trap = 37,
    MovementSkill = 38,
    Removed39 = 39, -- Now removed, was Cast
    DamageOverTime = 40,
    Mine = 41,
    TriggeredSpell = 42,
    Vaal = 43,
    Aura = 44,
    LightningSpell = 45, -- Used for Mjolner
    Type46 = 46, -- Doesn't appear to be used at all
    TriggeredAttack = 47,
    ProjectileAttack = 48,
    MinionSpell = 49, -- Used for Null's Inclination
    ChaosSkill = 50,
    Type51 = 51, -- Not used by any skill
    Type52 = 52, -- Allows Contagion, Blight and Scorching Ray to be supported by Iron Will
    Type53 = 53, -- Allows Burning Arrow and Vigilant Strike to be supported by Inc AoE and Conc Effect
    Type54 = 54, -- Not used by any skill
    Type55 = 55, -- Allows Burning Arrow to be supported by Inc/Less Duration and Rapid Decay
    Type56 = 56, -- Not used by any skill
    Type57 = 57, -- Appears to be the same as 47
    Channelled = 58,
    Type59 = 59, -- Allows Contagion, Blight and Scorching Ray to be supported by Controlled Destruction
    ColdSpell = 60, -- Used for Cospri's Malice
    TriggeredGrantedSkill = 61, -- Skill granted by item that is automatically triggered, prevents trigger gems and trap/mine/totem from applying
    Golem = 62,
    Herald = 63,
    AuraDebuff = 64, -- Used by Death Aura, added by Blasphemy
    Type65 = 65, -- Excludes Ruthless from Cyclone
    Type66 = 66, -- Allows Iron Will
    SpellCanCascade = 67, -- Spell can cascade via Spell Cascade
    SkillCanVolley = 68, -- Skill can be supported by Volley
    SkillCanMirageArcher = 69, -- Skill can be supported by Mirage Archer
    Type70 = 70, -- Excludes Volley from Vaal Fireball and Vaal Spark
    Type71 = 71, -- Excludes Volley from Spectral Shield Throw
    Type72 = 72, -- Excludes Summon Phantasm on Kill from Manifest Dancing Dervish
    Type73 = 73, -- Allows LMP/GMP on Rain of Arrows and Toxic Rain
    Warcry = 74, -- Warcry
    Instant = 75, -- Instant cast skill
    Brand = 76,
    DestroysCorpse = 77, -- Consumes corpses on use
    NonHitChill = 78,
    ChillingArea = 79,
}
-- Map of modifier names
local modNameList = {
	-- Attributes
	["strength"] = "Str",
	["dexterity"] = "Dex",
	["intelligence"] = "Int",
	["strength and dexterity"] = { "Str", "Dex" },
	["strength and intelligence"] = { "Str", "Int" },
	["dexterity and intelligence"] = { "Dex", "Int" },
	["attributes"] = { "Str", "Dex", "Int" },
	["all attributes"] = { "Str", "Dex", "Int" },
	-- Life/mana
	["life"] = "Life",
	["maximum life"] = "Life",
	["mana"] = "Mana",
	["maximum mana"] = "Mana",
	["mana regeneration"] = "ManaRegen",
	["mana regeneration rate"] = "ManaRegen",
	["mana cost"] = "ManaCost",
	["mana cost of"] = "ManaCost",
	["mana cost of skills"] = "ManaCost",
	["total mana cost of skills"] = "ManaCost",
	["mana reserved"] = "ManaReserved",
	["mana reservation"] = "ManaReserved",
	["mana reservation of skills"] = "ManaReserved",
	-- Primary defences
	["maximum energy shield"] = "EnergyShield",
	["energy shield recharge rate"] = "EnergyShieldRecharge",
	["start of energy shield recharge"] = "EnergyShieldRechargeFaster",
	["armour"] = "Armour",
	["evasion"] = "Evasion",
	["evasion rating"] = "Evasion",
	["energy shield"] = "EnergyShield",
	["armour and evasion"] = "ArmourAndEvasion",
	["armour and evasion rating"] = "ArmourAndEvasion",
	["evasion rating and armour"] = "ArmourAndEvasion",
	["armour and energy shield"] = "ArmourAndEnergyShield",
	["evasion rating and energy shield"] = "EvasionAndEnergyShield",
	["evasion and energy shield"] = "EvasionAndEnergyShield",
	["armour, evasion and energy shield"] = "Defences",
	["defences"] = "Defences",
	["to evade"] = "EvadeChance",
	["chance to evade"] = "EvadeChance",
	["to evade attacks"] = "EvadeChance",
	["chance to evade attacks"] = "EvadeChance",
	["chance to evade projectile attacks"] = "ProjectileEvadeChance",
	["chance to evade melee attacks"] = "MeleeEvadeChance",
	-- Resistances
	["physical damage reduction"] = "PhysicalDamageReduction",
	["physical damage reduction from hits"] = "PhysicalDamageReductionWhenHit",
	["fire resistance"] = "FireResist",
	["maximum fire resistance"] = "FireResistMax",
	["cold resistance"] = "ColdResist",
	["maximum cold resistance"] = "ColdResistMax",
	["lightning resistance"] = "LightningResist",
	["maximum lightning resistance"] = "LightningResistMax",
	["chaos resistance"] = "ChaosResist",
	["fire and cold resistances"] = { "FireResist", "ColdResist" },
	["fire and lightning resistances"] = { "FireResist", "LightningResist" },
	["cold and lightning resistances"] = { "ColdResist", "LightningResist" },
	["elemental resistances"] = "ElementalResist",
	["all elemental resistances"] = "ElementalResist",
	["all resistances"] = { "ElementalResist", "ChaosResist" },
	["all maximum elemental resistances"] = { "FireResistMax", "ColdResistMax", "LightningResistMax" },
	["all maximum resistances"] = { "FireResistMax", "ColdResistMax", "LightningResistMax", "ChaosResistMax" },
	["fire and chaos resistances"] = { "FireResist", "ChaosResist" },
	["cold and chaos resistances"] = { "ColdResist", "ChaosResist" },
	["lightning and chaos resistances"] = { "LightningResist", "ChaosResist" },
	-- Damage taken
	["damage taken"] = "DamageTaken",
	["damage taken when hit"] = "DamageTakenWhenHit",
	["damage taken from damage over time"] = "DamageTakenOverTime",
	["physical damage taken"] = "PhysicalDamageTaken",
	["physical damage from hits taken"] = "PhysicalDamageTaken",
	["physical damage taken when hit"] = "PhysicalDamageTakenWhenHit",
	["physical damage taken over time"] = "PhysicalDamageTakenOverTime",
	["lightning damage taken"] = "LightningDamageTaken",
	["lightning damage from hits taken"] = "LightningDamageTaken",
	["lightning damage taken when hit"] = "LightningDamageTakenWhenHit",
	["lightning damage taken over time"] = "LightningDamageTakenOverTime",
	["cold damage taken"] = "ColdDamageTaken",
	["cold damage from hits taken"] = "ColdDamageTaken",
	["cold damage taken when hit"] = "ColdDamageTakenWhenHit",
	["cold damage taken over time"] = "ColdDamageTakenOverTime",
	["fire damage taken"] = "FireDamageTaken",
	["fire damage from hits taken"] = "FireDamageTaken",
	["fire damage taken when hit"] = "FireDamageTakenWhenHit",
	["fire damage taken over time"] = "FireDamageTakenOverTime",
	["chaos damage taken"] = "ChaosDamageTaken",
	["chaos damage from hits taken"] = "ChaosDamageTaken",
	["chaos damage taken when hit"] = "ChaosDamageTakenWhenHit",
	["chaos damage taken over time"] = "ChaosDamageTakenOverTime",
	["elemental damage taken"] = "ElementalDamageTaken",
	["elemental damage taken when hit"] = "ElementalDamageTakenWhenHit",
	["elemental damage taken over time"] = "ElementalDamageTakenOverTime",
	-- Other defences
	["to dodge attacks"] = "AttackDodgeChance",
	["to dodge attack hits"] = "AttackDodgeChance",
	["to dodge spells"] = "SpellDodgeChance",
	["to dodge spell hits"] = "SpellDodgeChance",
	["to dodge spell damage"] = "SpellDodgeChance",
	["to dodge attacks and spells"] = { "AttackDodgeChance", "SpellDodgeChance" },
	["to dodge attacks and spell damage"] = { "AttackDodgeChance", "SpellDodgeChance" },
	["to dodge attack and spell hits"] = { "AttackDodgeChance", "SpellDodgeChance" },
	["to block"] = "BlockChance",
	["to block attacks"] = "BlockChance",
	["to block attack damage"] = "BlockChance",
	["block chance"] = "BlockChance",
	["block chance with staves"] = { "BlockChance", tag = { type = "Condition", var = "UsingStaff" } },
	["to block with staves"] = { "BlockChance", tag = { type = "Condition", var = "UsingStaff" } },
	["spell block chance"] = "SpellBlockChance",
	["to block spells"] = "SpellBlockChance",
	["to block spell damage"] = "SpellBlockChance",
	["chance to block attacks and spells"] = { "BlockChance", "SpellBlockChance" },
	["maximum block chance"] = "BlockChanceMax",
	["maximum chance to block attack damage"] = "BlockChanceMax",
	["maximum chance to block spell damage"] = "SpellBlockChanceMax",
	["to avoid being stunned"] = "AvoidStun",
	["to avoid being shocked"] = "AvoidShock",
	["to avoid being frozen"] = "AvoidFrozen",
	["to avoid being chilled"] = "AvoidChilled",
	["to avoid being ignited"] = "AvoidIgnite",
	["to avoid elemental ailments"] = { "AvoidShock", "AvoidFrozen", "AvoidChilled", "AvoidIgnite" },
	["to avoid elemental status ailments"] = { "AvoidShock", "AvoidFrozen", "AvoidChilled", "AvoidIgnite" },
	["to avoid bleeding"] = "AvoidBleed",
	["damage is taken from mana before life"] = "DamageTakenFromManaBeforeLife",
	["damage taken from mana before life"] = "DamageTakenFromManaBeforeLife",
	["effect of curses on you"] = "CurseEffectOnSelf",
	["life recovery rate"] = "LifeRecoveryRate",
	["mana recovery rate"] = "ManaRecoveryRate",
	["energy shield recovery rate"] = "EnergyShieldRecoveryRate",
	["recovery rate of life, mana and energy shield"] = { "LifeRecoveryRate", "ManaRecoveryRate", "EnergyShieldRecoveryRate" },
	-- Stun/knockback modifiers
	["stun recovery"] = "StunRecovery",
	["stun and block recovery"] = "StunRecovery",
	["block and stun recovery"] = "StunRecovery",
	["stun threshold"] = "StunThreshold",
	["block recovery"] = "BlockRecovery",
	["enemy stun threshold"] = "EnemyStunThreshold",
	["stun duration on enemies"] = "EnemyStunDuration",
	["stun duration"] = "EnemyStunDuration",
	["to knock enemies back on hit"] = "EnemyKnockbackChance",
	["knockback distance"] = "EnemyKnockbackDistance",
	-- Auras/curses/buffs
	["aura effect"] = "AuraEffect",
	["effect of non-curse auras you cast"] = "AuraEffect",
	["effect of non-curse auras from your skills"] = "AuraEffect",
	["effect of your curses"] = "CurseEffect",
	["effect of auras on you"] = "AuraEffectOnSelf",
	["effect of auras on your minions"] = { "AuraEffectOnSelf", addToMinion = true },
	["curse effect"] = "CurseEffect",
	["curse duration"] = { "Duration", keywordFlags = KeywordFlag.Curse },
	["radius of auras"] = { "AreaOfEffect", keywordFlags = KeywordFlag.Aura },
	["radius of curses"] = { "AreaOfEffect", keywordFlags = KeywordFlag.Curse },
	["buff effect"] = "BuffEffect",
	["effect of buffs on you"] = "BuffEffectOnSelf",
	["effect of buffs granted by your golems"] = { "BuffEffect", tag = { type = "SkillType", skillType = SkillType.Golem } },
	["effect of buffs granted by socketed golem skills"] = { "BuffEffect", addToSkill = { type = "SocketedIn", slotName = "{SlotName}", keyword = "golem" } },
	["effect of the buff granted by your stone golems"] = { "BuffEffect", tag = { type = "SkillName", skillName = "Summon Stone Golem" } },
	["effect of the buff granted by your lightning golems"] = { "BuffEffect", tag = { type = "SkillName", skillName = "Summon Lightning Golem" } },
	["effect of the buff granted by your ice golems"] = { "BuffEffect", tag = { type = "SkillName", skillName = "Summon Ice Golem" } },
	["effect of the buff granted by your flame golems"] = { "BuffEffect", tag = { type = "SkillName", skillName = "Summon Flame Golem" } },
	["effect of the buff granted by your chaos golems"] = { "BuffEffect", tag = { type = "SkillName", skillName = "Summon Chaos Golem" } },
	["effect of offering spells"] = { "BuffEffect", tag = { type = "SkillName", skillNameList = { "Bone Offering", "Flesh Offering", "Spirit Offering" } } },
	["effect of heralds on you"] = { "BuffEffect", tag = { type = "SkillType", skillType = SkillType.Herald } },
	["warcry effect"] = { "BuffEffect", keywordFlags = KeywordFlag.Warcry },
	["aspect of the avian buff effect"] = { "BuffEffect", tag = { type = "SkillName", skillName = "Aspect of the Avian" } },
	-- Charges
	["maximum power charge"] = "PowerChargesMax",
	["maximum power charges"] = "PowerChargesMax",
	["minimum power charge"] = "PowerChargesMin",
	["minimum power charges"] = "PowerChargesMin",
	["power charge duration"] = "PowerChargesDuration",
	["maximum frenzy charge"] = "FrenzyChargesMax",
	["maximum frenzy charges"] = "FrenzyChargesMax",
	["minimum frenzy charge"] = "FrenzyChargesMin",
	["minimum frenzy charges"] = "FrenzyChargesMin",
	["frenzy charge duration"] = "FrenzyChargesDuration",
	["maximum endurance charge"] = "EnduranceChargesMax",
	["maximum endurance charges"] = "EnduranceChargesMax",
	["minimum endurance charge"] = "EnduranceChargesMin",
	["minimum endurance charges"] = "EnduranceChargesMin",
	["endurance charge duration"] = "EnduranceChargesDuration",
	["maximum frenzy charges and maximum power charges"] = { "FrenzyChargesMax", "PowerChargesMax" },
	["endurance, frenzy and power charge duration"] = { "PowerChargesDuration", "FrenzyChargesDuration", "EnduranceChargesDuration" },
	["maximum siphoning charge"] = "SiphoningChargesMax",
	["maximum siphoning charges"] = "SiphoningChargesMax",
	["maximum number of crab barriers"] = "CrabBarriersMax",
	-- On hit/kill/leech effects
	["life gained on kill"] = "LifeOnKill",
	["mana gained on kill"] = "ManaOnKill",
	["life gained for each enemy hit"] = { "LifeOnHit" },
	["life gained for each enemy hit by attacks"] = { "LifeOnHit", flags = ModFlag.Attack },
	["life gained for each enemy hit by your attacks"] = { "LifeOnHit", flags = ModFlag.Attack },
	["life gained for each enemy hit by spells"] = { "LifeOnHit", flags = ModFlag.Spell },
	["life gained for each enemy hit by your spells"] = { "LifeOnHit", flags = ModFlag.Spell },
	["mana gained for each enemy hit by attacks"] = { "ManaOnHit", flags = ModFlag.Attack },
	["mana gained for each enemy hit by your attacks"] = { "ManaOnHit", flags = ModFlag.Attack },
	["energy shield gained for each enemy hit"] = { "EnergyShieldOnHit" },
	["energy shield gained for each enemy hit by attacks"] = { "EnergyShieldOnHit", flags = ModFlag.Attack },
	["energy shield gained for each enemy hit by your attacks"] = { "EnergyShieldOnHit", flags = ModFlag.Attack },
	["life and mana gained for each enemy hit"] = { "LifeOnHit", "ManaOnHit", flags = ModFlag.Attack },
	["damage as life"] = "DamageLifeLeech",
	["life leeched per second"] = "LifeLeechRate",
	["mana leeched per second"] = "ManaLeechRate",
	["maximum life per second to maximum life leech rate"] = "MaxLifeLeechRate",
	["maximum mana per second to maximum mana leech rate"] = "MaxManaLeechRate",
	-- Projectile modifiers
	["projectile"] = "ProjectileCount",
	["projectiles"] = "ProjectileCount",
	["projectile speed"] = "ProjectileSpeed",
	["arrow speed"] = { "ProjectileSpeed", flags = ModFlag.Bow },
	-- Totem/trap/mine modifiers
	["totem placement speed"] = "TotemPlacementSpeed",
	["totem life"] = "TotemLife",
	["totem duration"] = "TotemDuration",
	["maximum number of summoned totems"] = "ActiveTotemLimit",
	["trap throwing speed"] = "TrapThrowingSpeed",
	["trap trigger area of effect"] = "TrapTriggerAreaOfEffect",
	["trap duration"] = "TrapDuration",
	["cooldown recovery speed for throwing traps"] = { "CooldownRecovery", keywordFlags = KeywordFlag.Trap },
	["mine laying speed"] = "MineLayingSpeed",
	["mine detonation area of effect"] = "MineDetonationAreaOfEffect",
	["mine duration"] = "MineDuration",
	-- Minion modifiers
	["maximum number of skeletons"] = "ActiveSkeletonLimit",
	["maximum number of zombies"] = "ActiveZombieLimit",
	["number of zombies allowed"] = "ActiveZombieLimit",
	["maximum number of spectres"] = "ActiveSpectreLimit",
	["maximum number of golems"] = "ActiveGolemLimit",
	["maximum number of summoned golems"] = "ActiveGolemLimit",
	["maximum number of summoned raging spirits"] = "ActiveRagingSpiritLimit",
	["maximum number of summoned holy relics"] = "ActiveHolyRelicLimit",
	["minion duration"] = { "Duration", tag = { type = "SkillType", skillType = SkillType.CreateMinion } },
	["skeleton duration"] = { "Duration", tag = { type = "SkillName", skillName = "Summon Skeleton" } },
	["sentinel of dominance duration"] = { "Duration", tag = { type = "SkillName", skillName = "Dominating Blow" } },
	-- Other skill modifiers
	["radius"] = "AreaOfEffect",
	["radius of area skills"] = "AreaOfEffect",
	["area of effect radius"] = "AreaOfEffect",
	["area of effect"] = "AreaOfEffect",
	["area of effect of skills"] = "AreaOfEffect",
	["area of effect of area skills"] = "AreaOfEffect",
	["aspect of the spider area of effect"] = { "AreaOfEffect", tag = { type = "SkillName", skillName = "Aspect of the Spider" } },
	["firestorm explosion area of effect"] = { "AreaOfEffectSecondary", tag = { type = "SkillName", skillName = "Firestorm" } },
	["duration"] = "Duration",
	["skill effect duration"] = "Duration",
	["chaos skill effect duration"] = { "Duration", keywordFlags = KeywordFlag.Chaos },
	["aspect of the spider debuff duration"] = { "Duration", tag = { type = "SkillName", skillName = "Aspect of the Spider" } },
	["fire trap burning ground duration"] = { "Duration", tag = { type = "SkillName", skillName = "Fire Trap" } },
	["cooldown recovery"] = "CooldownRecovery",
	["cooldown recovery speed"] = "CooldownRecovery",
	["weapon range"] = "WeaponRange",
	["melee weapon range"] = "MeleeWeaponRange",
	["melee weapon and unarmed range"] = { "MeleeWeaponRange", "UnarmedRange" },
	["melee weapon and unarmed attack range"] = { "MeleeWeaponRange", "UnarmedRange" },
	["to deal double damage"] = "DoubleDamageChance",
	["activation frequency"] = "BrandActivationFrequency",
	["brand activation frequency"] = "BrandActivationFrequency",
	-- Buffs
	["onslaught effect"] = "OnslaughtEffect",
	["fortify duration"] = "FortifyDuration",
	["effect of fortify on you"] = "FortifyEffectOnSelf",
	["effect of tailwind on you"] = "TailwindEffectOnSelf",
	-- Basic damage types
	["damage"] = "Damage",
	["physical damage"] = "PhysicalDamage",
	["lightning damage"] = "LightningDamage",
	["cold damage"] = "ColdDamage",
	["fire damage"] = "FireDamage",
	["chaos damage"] = "ChaosDamage",
	["non-chaos damage"] = "NonChaosDamage",
	["elemental damage"] = "ElementalDamage",
	-- Other damage forms
	["attack damage"] = { "Damage", flags = ModFlag.Attack },
	["attack physical damage"] = { "PhysicalDamage", flags = ModFlag.Attack },
	["physical attack damage"] = { "PhysicalDamage", flags = ModFlag.Attack },
	["physical weapon damage"] = { "PhysicalDamage", flags = ModFlag.Weapon },
	["physical damage with weapons"] = { "PhysicalDamage", flags = ModFlag.Weapon },
	["physical melee damage"] = { "PhysicalDamage", flags = ModFlag.Melee },
	["melee physical damage"] = { "PhysicalDamage", flags = ModFlag.Melee },
	["projectile damage"] = { "Damage", flags = ModFlag.Projectile },
	["projectile attack damage"] = { "Damage", flags = (ModFlag.Projectile | ModFlag.Attack) },
	["bow damage"] = { "Damage", flags = ModFlag.Bow },
	["damage with arrow hits"] = { "Damage", flags = (ModFlag.Bow | ModFlag.Hit) },
	["wand damage"] = { "Damage", flags = ModFlag.Wand },
	["wand physical damage"] = { "PhysicalDamage", flags = ModFlag.Wand },
	["claw physical damage"] = { "PhysicalDamage", flags = ModFlag.Claw },
	["sword physical damage"] = { "PhysicalDamage", flags = ModFlag.Sword },
	["damage over time"] = { "Damage", flags = ModFlag.Dot },
	["physical damage over time"] = { "PhysicalDamage", keywordFlags = KeywordFlag.PhysicalDot },
	["burning damage"] = { "FireDamage", keywordFlags = KeywordFlag.FireDot },
	["damage with ignite"] = { "Damage", keywordFlags = KeywordFlag.Ignite },
	["damage with ignites"] = { "Damage", keywordFlags = KeywordFlag.Ignite },
	["incinerate damage for each stage"] = { "Damage", tagList = { { type = "Multiplier", var = "IncinerateStage" }, { type = "SkillName", skillName = "Incinerate" } } },
	["non-ailment chaos damage over time multiplier"] = "ChaosDotMultiplier",
	["cold damage over time multiplier"] = "ColdDotMultiplier",
	-- Crit/accuracy/speed modifiers
	["critical strike chance"] = "CritChance",
	["attack critical strike chance"] = { "CritChance", flags = ModFlag.Attack },
	["critical strike multiplier"] = "CritMultiplier",
	["accuracy"] = "Accuracy",
	["accuracy rating"] = "Accuracy",
	["minion accuracy rating"] = { "Accuracy", addToMinion = true },
	["attack speed"] = { "Speed", flags = ModFlag.Attack },
	["cast speed"] = { "Speed", flags = ModFlag.Cast },
	["attack and cast speed"] = "Speed",
	["attack and movement speed"] = { "Speed", "MovementSpeed" },
	-- Elemental ailments
	["to shock"] = "EnemyShockChance",
	["shock chance"] = "EnemyShockChance",
	["to freeze"] = "EnemyFreezeChance",
	["freeze chance"] = "EnemyFreezeChance",
	["to ignite"] = "EnemyIgniteChance",
	["ignite chance"] = "EnemyIgniteChance",
	["to freeze, shock and ignite"] = { "EnemyFreezeChance", "EnemyShockChance", "EnemyIgniteChance" },
	["effect of shock"] = "EnemyShockEffect",
	["effect of chill"] = "EnemyChillEffect",
	["effect of chill on you"] = "SelfChillEffect",
	["effect of non-damaging ailments"] = { "EnemyShockEffect", "EnemyChillEffect", "EnemyFreezeEffech" },
	["shock duration"] = "EnemyShockDuration",
	["freeze duration"] = "EnemyFreezeDuration",
	["chill duration"] = "EnemyChillDuration",
	["ignite duration"] = "EnemyIgniteDuration",
	["duration of elemental ailments"] = { "EnemyShockDuration", "EnemyFreezeDuration", "EnemyChillDuration", "EnemyIgniteDuration" },
	["duration of elemental status ailments"] = { "EnemyShockDuration", "EnemyFreezeDuration", "EnemyChillDuration", "EnemyIgniteDuration" },
	["duration of ailments"] = { "EnemyShockDuration", "EnemyFreezeDuration", "EnemyChillDuration", "EnemyIgniteDuration", "EnemyPoisonDuration", "EnemyBleedDuration" },
	-- Other ailments
	["to poison"] = "PoisonChance",
	["to cause poison"] = "PoisonChance",
	["to poison on hit"] = "PoisonChance",
	["poison duration"] = { "EnemyPoisonDuration" },
	["duration of poisons you inflict"] = { "EnemyPoisonDuration" },
	["to cause bleeding"] = "BleedChance",
	["to cause bleeding on hit"] = "BleedChance",
	["to inflict bleeding"] = "BleedChance",
	["to inflict bleeding on hit"] = "BleedChance",
	["bleed duration"] = { "EnemyBleedDuration" },
	["bleeding duration"] = { "EnemyBleedDuration" },
	-- Misc modifiers
	["movement speed"] = "MovementSpeed",
	["attack, cast and movement speed"] = { "Speed", "MovementSpeed" },
	["light radius"] = "LightRadius",
	["rarity of items found"] = "LootRarity",
	["quantity of items found"] = "LootQuantity",
	["item quantity"] = "LootQuantity",
	["strength requirement"] = "StrRequirement",
	["dexterity requirement"] = "DexRequirement",
	["intelligence requirement"] = "IntRequirement",
	["attribute requirements"] = { "StrRequirement", "DexRequirement", "IntRequirement" },
	["effect of socketed jewels"] = "SocketedJewelEffect",
	-- Flask modifiers
	["effect"] = "FlaskEffect",
	["effect of flasks"] = "FlaskEffect",
	["effect of flasks on you"] = "FlaskEffect",
	["amount recovered"] = "FlaskRecovery",
	["life recovered"] = "FlaskRecovery",
	["mana recovered"] = "FlaskRecovery",
	["life recovery from flasks"] = "FlaskLifeRecovery",
	["mana recovery from flasks"] = "FlaskManaRecovery",
	["flask effect duration"] = "FlaskDuration",
	["recovery speed"] = "FlaskRecoveryRate",
	["recovery rate"] = "FlaskRecoveryRate",
	["flask recovery rate"] = "FlaskRecoveryRate",
	["flask recovery speed"] = "FlaskRecoveryRate",
	["flask life recovery rate"] = "FlaskLifeRecoveryRate",
	["flask mana recovery rate"] = "FlaskManaRecoveryRate",
	["extra charges"] = "FlaskCharges",
	["maximum charges"] = "FlaskCharges",
	["charges used"] = "FlaskChargesUsed",
	["flask charges used"] = "FlaskChargesUsed",
	["flask charges gained"] = "FlaskChargesGained",
	["charge recovery"] = "FlaskChargeRecovery",
}
local modNameListNew = {
    ["to maximum life"] = "explicit.stat_3299347043",
    ["to cold resistance"] = "explicit.stat_4220027924",
    ["to fire resistance"] = "explicit.stat_3372524247",
    ["to lightning resistance"] = "explicit.stat_1671376347",
    ["to maximum mana"] = "explicit.stat_1050105434",
    ["to maximum energy shield"] = "explicit.stat_3489782002",
    ["to strength"] = "explicit.stat_4080418644",
    ["to dexterity"] = "explicit.stat_3261801346",
    ["to intelligence"] = "explicit.stat_328541901",
    ["to all elemental resistances"] = "explicit.stat_2901986750",
    ["to accuracy rating"] = "explicit.stat_803737631",
    ["adds to physical damage to attacks"] = "explicit.stat_3032590688",
    ["increased rarity of items found"] = "explicit.stat_3917489142",
    ["increased stun and block recovery"] = "explicit.stat_2511217560",
    ["life regenerated per second"] = "explicit.stat_3325883026",
    ["increased physical damage (local)"] = "explicit.stat_1805374733",
    ["increased movement speed"] = "explicit.stat_2250533757",
    ["increased mana regeneration rate"] = "explicit.stat_789117908",
    ["to global critical strike multiplier"] = "explicit.stat_3556824919",
    ["increased attack speed (local)"] = "explicit.stat_210067635",
    ["increased spell damage"] = "explicit.stat_2974417149",
    ["increased attack speed"] = "explicit.stat_681332047",
    ["adds to lightning damage to attacks"] = "explicit.stat_1754445556",
    ["increased elemental damage with attack skills"] = "explicit.stat_387439868",
    ["adds to physical damage (local)"] = "explicit.stat_1940865751",
    ["adds to fire damage to attacks"] = "explicit.stat_1573130764",
    ["to maximum energy shield (local)"] = "explicit.stat_4052037485",
    ["increased global critical strike chance"] = "explicit.stat_587431675",
    ["increased fire damage"] = "explicit.stat_3962278098",
    ["increased cast speed"] = "explicit.stat_2891184298",
    ["to chaos resistance"] = "explicit.stat_2923486259",
    ["adds to cold damage to attacks"] = "explicit.stat_4067062424",
    ["increased maximum life"] = "explicit.stat_983749596",
    ["increased evasion rating (local)"] = "explicit.stat_124859000",
    ["to all attributes"] = "explicit.stat_1379411836",
    ["increased lightning damage"] = "explicit.stat_2231156303",
    ["increased cold damage"] = "explicit.stat_3291658075",
    ["increased energy shield"] = "explicit.stat_4015621042",
    ["increased maximum energy shield"] = "explicit.stat_2482852589",
    ["to evasion rating"] = "explicit.stat_2144192055",
    ["to armour"] = "explicit.stat_809229260",
    ["increased global physical damage"] = "explicit.stat_1310194496",
    ["adds to lightning damage (local)"] = "explicit.stat_3336890334",
    ["to accuracy rating (local)"] = "explicit.stat_691932474",
    ["increased critical strike chance"] = "explicit.stat_2375316951",
    ["increased stun duration on enemies"] = "explicit.stat_2517001139",
    ["increased armour (local)"] = "explicit.stat_1062208444",
    ["of physical attack damage leeched as life"] = "explicit.stat_3593843976",
    ["life gained on kill"] = "explicit.stat_3695891184",
    ["increased light radius"] = "explicit.stat_1263695895",
    ["mana gained on kill"] = "explicit.stat_1368271171",
    ["adds to cold damage (local)"] = "explicit.stat_1037193709",
    ["adds to fire damage (local)"] = "explicit.stat_709508406",
    ["of physical attack damage leeched as mana"] = "explicit.stat_3237948413",
    ["to evasion rating (local)"] = "explicit.stat_53045048",
    ["to armour (local)"] = "explicit.stat_3484657501",
    ["increased critical strike chance for spells"] = "explicit.stat_737908626",
    ["increased area damage"] = "explicit.stat_4251717817",
    ["reduced enemy stun threshold"] = "explicit.stat_1443060084",
    ["increased armour and energy shield"] = "explicit.stat_3321629045",
    ["reflects physical damage to melee attackers"] = "explicit.stat_3767873853",
    ["increased armour and evasion"] = "explicit.stat_2451402625",
    ["increased projectile damage"] = "explicit.stat_1839076647",
    ["life gained for each enemy hit by your attacks"] = "explicit.stat_2797971005",
    ["increased projectile speed"] = "explicit.stat_3759663284",
    ["increased armour"] = "explicit.stat_2866361420",
    ["increased maximum mana"] = "explicit.stat_2748665614",
    ["increased evasion rating"] = "explicit.stat_2106365538",
    ["increased damage"] = "explicit.stat_2154246560",
    ["increased burning damage"] = "explicit.stat_1175385867",
    ["increased evasion and energy shield"] = "explicit.stat_1999113824",
    ["increased damage over time"] = "explicit.stat_967627487",
    ["increased global accuracy rating"] = "explicit.stat_624954515",
    ["adds to lightning damage to spells"] = "explicit.stat_2831165374",
    ["reduced mana cost of skills"] = "explicit.stat_474294393",
    ["increased melee damage"] = "explicit.stat_1002362373",
    ["adds to fire damage to spells"] = "explicit.stat_1133016593",
    ["chance to ignite"] = "explicit.stat_1335054179",
    ["increased attack and cast speed"] = "explicit.stat_2672805335",
    ["minions have increased maximum life"] = "explicit.stat_770672621",
    ["adds to cold damage to spells"] = "explicit.stat_2469416729",
    ["life gained for each enemy hit by attacks"] = "explicit.stat_821021828",
    ["minions deal increased damage"] = "explicit.stat_1589917703",
    ["increased quantity of items found"] = "explicit.stat_884586851",
    ["increased damage with poison"] = "explicit.stat_1290399200",
    ["increased attribute requirements"] = "explicit.stat_3639275092",
    ["to fire and lightning resistances"] = "explicit.stat_3441501978",
    ["increased damage with bleeding"] = "explicit.stat_1294118672",
    ["increased area of effect"] = "explicit.stat_280731498",
    ["to fire and cold resistances"] = "explicit.stat_2915988346",
    ["to cold and lightning resistances"] = "explicit.stat_4277795662",
    ["increased attack speed while dual wielding"] = "explicit.stat_4249220643",
    ["more monster life"] = "explicit.stat_95249895",
    ["chance to shock"] = "explicit.stat_1538773178",
    ["increased poison duration"] = "explicit.stat_2011656677",
    ["increased trap damage"] = "explicit.stat_2941585404",
    ["chance to freeze"] = "explicit.stat_2309614417",
    ["increased duration"] = "explicit.stat_156096868",
    ["increased attack speed while holding a shield"] = "explicit.stat_3805075944",
    ["increased charges used"] = "explicit.stat_3139816101",
    ["chance to block attack damage while dual wielding"] = "explicit.stat_2166444903",
    ["increased ignite duration on enemies"] = "explicit.stat_1086147743",
    ["to strength and intelligence"] = "explicit.stat_1535626285",
    ["increased flask life recovery rate"] = "explicit.stat_51994685",
    ["chance to block (shields)"] = "explicit.stat_4253454700",
    ["to dexterity and intelligence"] = "explicit.stat_2300185227",
    ["to strength and dexterity"] = "explicit.stat_538848803",
    ["extra gore"] = "explicit.stat_3403461239",
    ["to level of socketed gems"] = "explicit.stat_2843100721",
    ["to melee critical strike multiplier"] = "explicit.stat_4237442815",
    ["increased chaos damage"] = "explicit.stat_736967255",
    ["increased attack speed with swords"] = "explicit.stat_3293699237",
    ["increased physical weapon damage while dual wielding"] = "explicit.stat_1274831335",
    ["increased physical damage with swords"] = "explicit.stat_3814560373",
    ["increased totem damage"] = "explicit.stat_3851254963",
    ["increased physical damage with one handed melee weapons"] = "explicit.stat_1334465904",
    ["increased shock duration on enemies"] = "explicit.stat_3668351662",
    ["increased attack speed with one handed melee weapons"] = "explicit.stat_1813451228",
    ["increased physical damage with axes"] = "explicit.stat_2008219439",
    ["to level of socketed minion gems"] = "explicit.stat_3604946673",
    ["increased attack speed with axes"] = "explicit.stat_3550868361",
    ["increased flask effect duration"] = "explicit.stat_3741323227",
    ["adds to chaos damage to attacks"] = "explicit.stat_674553446",
    ["increased monster damage"] = "explicit.stat_1890519597",
    ["increased bleeding duration"] = "explicit.stat_1459321413",
    ["increased mine damage"] = "explicit.stat_2137912951",
    ["increased freeze duration on enemies"] = "explicit.stat_1073942215",
    ["to level of socketed fire gems"] = "explicit.stat_339179093",
    ["physical damage taken from attacks"] = "explicit.stat_3441651621",
    ["increased energy shield recharge rate"] = "explicit.stat_2339757871",
    ["gain of physical damage as extra cold damage"] = "explicit.stat_979246511",
    ["chance to cause bleeding on hit"] = "explicit.stat_1519615863",
    ["increased melee physical damage while holding a shield"] = "explicit.stat_3501769159",
    ["increased totem life"] = "explicit.stat_686254215",
    ["increased physical damage with two handed melee weapons"] = "explicit.stat_2056783069",
    ["mana regenerated per second"] = "explicit.stat_4291461939",
    ["of life regenerated per second"] = "explicit.stat_836936635",
    ["increased amount recovered"] = "explicit.stat_700317374",
    ["increased attack speed with two handed melee weapons"] = "explicit.stat_1917910910",
    ["increased elemental damage"] = "explicit.stat_3141070085",
    ["faster start of energy shield recharge"] = "explicit.stat_1782086450",
    ["chance to avoid being frozen"] = "explicit.stat_1514829491",
    ["to level of socketed melee gems"] = "explicit.stat_829382474",
    ["attacks have chance to cause bleeding"] = "explicit.stat_1923879260",
    ["increased melee critical strike chance"] = "explicit.stat_1199429645",
    ["increased flask charges gained"] = "explicit.stat_1452809865",
    ["to critical strike multiplier with fire skills"] = "explicit.stat_2307547323",
    ["to critical strike multiplier with lightning skills"] = "explicit.stat_2441475928",
    ["to critical strike multiplier with cold skills"] = "explicit.stat_915908446",
    ["minions have increased movement speed"] = "explicit.stat_174664100",
    ["increased damage when on low life"] = "explicit.stat_1513447578",
    ["increased movement speed when on low life"] = "explicit.stat_649025131",
    ["has abyssal sockets"] = "explicit.stat_3527617737",
    ["monsters deal extra damage as lightning"] = "explicit.stat_3416853625",
    ["to total mana cost of skills"] = "explicit.stat_3736589033",
    ["chance to block spell damage"] = "explicit.stat_561307714",
    ["chance to poison on hit (local)"] = "explicit.stat_3885634897",
    ["increased monster movement speed"] = "explicit.stat_2306522833",
    ["increased monster cast speed"] = "explicit.stat_2488361432",
    ["increased monster attack speed"] = "explicit.stat_1913583994",
    ["adds to lightning damage to bow attacks"] = "explicit.stat_1040269876",
    ["of physical damage converted to chaos damage"] = "explicit.stat_490098963",
    ["totems gain to all elemental resistances"] = "explicit.stat_1809006367",
    ["area contains many totems"] = "explicit.stat_1000591322",
    ["increased critical strike chance with fire skills"] = "explicit.stat_1104796138",
    ["adds to fire damage to bow attacks"] = "explicit.stat_3120164895",
    ["to level of socketed lightning gems"] = "explicit.stat_4043416969",
    ["rare monsters each have a nemesis mod"] = "explicit.stat_2391261970",
    ["increased flask mana recovery rate"] = "explicit.stat_1412217137",
    ["chance to knock enemies back on hit"] = "explicit.stat_977908611",
    ["increased critical strike chance with cold skills"] = "explicit.stat_3337344042",
    ["increased critical strike chance with lightning skills"] = "explicit.stat_1186596295",
    ["chance to cause monsters to flee"] = "explicit.stat_3181974858",
    ["increased charge recovery"] = "explicit.stat_3196823591",
    ["chance to block attack damage while holding a shield"] = "explicit.stat_4061558269",
    ["more magic monsters"] = "explicit.stat_3873704640",
    ["chance to avoid being chilled"] = "explicit.stat_3483999943",
    ["chance to block spell damage while dual wielding"] = "explicit.stat_138741818",
    ["chance to block spell damage while holding a shield"] = "explicit.stat_938645499",
    ["chance to poison on hit"] = "explicit.stat_795138349",
    ["increased spell damage while holding a shield"] = "explicit.stat_1766142294",
    ["increased mana reserved"] = "explicit.stat_2227180465",
    ["increased recovery rate"] = "explicit.stat_173226756",
    ["to maximum endurance charges"] = "explicit.stat_1515657623",
    ["immunity to bleeding during flask effect removes bleeding on use"] = "explicit.stat_122525378",
    ["to critical strike multiplier with one handed melee weapons"] = "explicit.stat_670153687",
    ["socketed gems are supported by level faster attacks"] = "explicit.stat_928701213",
    ["increased movement speed during flask effect"] = "explicit.stat_3182498570",
    ["adds to physical damage to bow attacks"] = "explicit.stat_1760576992",
    ["mana gained for each enemy hit by your attacks"] = "explicit.stat_820939409",
    ["increased trap throwing speed"] = "explicit.stat_118398748",
    ["to critical strike multiplier with elemental skills"] = "explicit.stat_1569407745",
    ["to critical strike multiplier while dual wielding"] = "explicit.stat_2546185479",
    ["adds to cold damage to bow attacks"] = "explicit.stat_215124030",
    ["to level of socketed cold gems"] = "explicit.stat_1645459191",
    ["gain of physical damage as extra chaos damage during effect"] = "explicit.stat_2818167778",
    ["of chaos damage leeched as life during flask effect"] = "explicit.stat_1341148741",
    ["gain of elemental damage as extra chaos damage during effect"] = "explicit.stat_3562241510",
    ["unique boss has increased attack and cast speed"] = "explicit.stat_2109106920",
    ["chance to gain a flask charge when you deal a critical strike"] = "explicit.stat_2858921304",
    ["chance to block attack damage"] = "explicit.stat_2530372417",
    ["unique boss deals increased damage"] = "explicit.stat_124877078",
    ["adds to chaos damage to spells"] = "explicit.stat_2300399854",
    ["increased spell damage while dual wielding"] = "explicit.stat_1678690824",
    ["more rare monsters"] = "explicit.stat_3793155082",
    ["reduced flask charges used"] = "explicit.stat_644456512",
    ["to maximum charges"] = "explicit.stat_3608809816",
    ["players have elemental equilibrium"] = "explicit.stat_1714180526",
    ["adds to cold damage to spells and attacks"] = "explicit.stat_1662717006",
    ["increased critical strike chance with one handed melee weapons"] = "explicit.stat_2381842786",
    ["monsters poison on hit"] = "explicit.stat_3350803563",
    ["immunity to freeze and chill during flask effect removes freeze and chill on use"] = "explicit.stat_3591635592",
    ["increased intelligence"] = "explicit.stat_656461285",
    ["to maximum number of spectres"] = "explicit.stat_125218179",
    ["increased physical damage with maces"] = "explicit.stat_3774831856",
    ["to cold damage over time multiplier"] = "explicit.stat_3993576199",
    ["increased dexterity"] = "explicit.stat_4139681126",
    ["adds to physical damage to spells"] = "explicit.stat_2435536961",
    ["players have less recovery rate of life and energy shield"] = "explicit.stat_4181072906",
    ["gain of physical damage as extra fire damage"] = "explicit.stat_369494213",
    ["to critical strike multiplier for spells"] = "explicit.stat_274716455",
    ["magic monster packs each have a bloodline mod"] = "explicit.stat_97115311",
    ["increased weapon critical strike chance while dual wielding"] = "explicit.stat_3702513529",
    ["increased cast speed with fire skills"] = "explicit.stat_1476643878",
    ["increased attack speed with wands"] = "explicit.stat_3720627346",
    ["socketed gems are supported by level increased area of effect"] = "explicit.stat_3720936304",
    ["energy shield gained for each enemy hit by your attacks"] = "explicit.stat_211381198",
    ["increased attack speed with maces"] = "explicit.stat_2515515064",
    ["monsters reflect of elemental damage"] = "explicit.stat_2764017512",
    ["increased global evasion rating when on low life"] = "explicit.stat_2695354435",
    ["increased strength requirement"] = "explicit.stat_295075366",
    ["increased mine laying speed"] = "explicit.stat_1896971621",
    ["mana gained when you block"] = "explicit.stat_2122183138",
    ["increased cast speed with cold skills"] = "explicit.stat_928238845",
    ["increased attack speed with daggers"] = "explicit.stat_2538566497",
    ["increased cast speed while holding a shield"] = "explicit.stat_1612163368",
    ["to critical strike multiplier with two handed melee weapons"] = "explicit.stat_252507949",
    ["increased cast speed with lightning skills"] = "explicit.stat_1788635023",
    ["increased spell damage while wielding a staff"] = "explicit.stat_3496944181",
    ["increased physical damage with claws"] = "explicit.stat_635761691",
    ["chance to dodge attack hits"] = "explicit.stat_2749862839",
    ["increased physical damage with daggers"] = "explicit.stat_3882531569",
    ["damage penetrates elemental resistances"] = "explicit.stat_2101383955",
    ["increased attack speed with bows"] = "explicit.stat_3759735052",
    ["increased attack speed with claws"] = "explicit.stat_1421645223",
    ["of life regenerated per second while on low life"] = "explicit.stat_3942946753",
    ["increased critical strike chance with elemental skills"] = "explicit.stat_439950087",
    ["increased physical damage with bows"] = "explicit.stat_402920808",
    ["culling strike"] = "explicit.stat_2524254339",
    ["increased effect of shock"] = "explicit.stat_2527686725",
    ["to maximum power charges"] = "explicit.stat_227523295",
    ["minions have to all elemental resistances"] = "explicit.stat_1423639565",
    ["increased movement speed while ignited"] = "explicit.stat_581625445",
    ["socketed gems are supported by level increased critical strikes"] = "explicit.stat_2259700079",
    ["increased effect of curses on you"] = "explicit.stat_3407849389",
    ["of damage taken gained as mana over 4 seconds when hit"] = "explicit.stat_472520716",
    ["increased physical damage with wands"] = "explicit.stat_2769075491",
    ["increased cast speed while dual wielding"] = "explicit.stat_2382196858",
    ["of physical damage converted to fire damage"] = "explicit.stat_1533563525",
    ["chance to avoid being stunned"] = "explicit.stat_4262448838",
    ["reflects physical damage to attackers on block"] = "explicit.stat_1445684883",
    ["socketed gems are supported by level blind"] = "explicit.stat_2223640518",
    ["increased skill effect duration"] = "explicit.stat_3377888098",
    ["right ring slot: reduced reflected physical damage taken"] = "explicit.stat_1357244124",
    ["increased critical strike chance with two handed melee weapons"] = "explicit.stat_764295120",
    ["chance to dodge spell hits"] = "explicit.stat_696707743",
    ["to non-ailment chaos damage over time multiplier"] = "explicit.stat_1653010703",
    ["increased strength"] = "explicit.stat_734614379",
    ["left ring slot: reduced reflected elemental damage taken"] = "explicit.stat_2422197812",
    ["hits can't be evaded"] = "explicit.stat_4126210832",
    ["monsters have increased critical strike chance"] = "explicit.stat_2753083623",
    ["to monster critical strike multiplier"] = "explicit.stat_57326096",
    ["reduced effect of chill on you"] = "explicit.stat_1478653032",
    ["monsters' skills chain additional times"] = "explicit.stat_3183973644",
    ["monsters have chance to avoid elemental ailments"] = "explicit.stat_322206271",
    ["monsters deal extra damage as cold"] = "explicit.stat_3448216135",
    ["monsters have increased area of effect"] = "explicit.stat_1708461270",
    ["monsters cannot be stunned"] = "explicit.stat_1041951480",
    ["monsters deal extra damage as fire"] = "explicit.stat_1497673356",
    ["chance to block spell damage"] = "explicit.stat_2881111359",
    ["monsters have chance to gain a power charge on hit"] = "explicit.stat_406353061",
    ["recover of maximum life on kill"] = "explicit.stat_2023107756",
    ["area is inhabited by additional rogue exile"] = "explicit.stat_3550168289",
    ["monsters fire additional projectiles"] = "explicit.stat_1309819744",
    ["minions have chance to block attack damage"] = "explicit.stat_3374054207",
    ["you take reduced extra damage from critical strikes"] = "explicit.stat_3855016469",
    ["monsters have chance to gain an endurance charge on hit"] = "explicit.stat_687813731",
    ["monsters take reduced extra damage from critical strikes"] = "explicit.stat_337935900",
    ["increased cast speed while wielding a staff"] = "explicit.stat_2066542501",
    ["unique boss has increased life"] = "explicit.stat_1959158336",
    ["area has increased monster variety"] = "explicit.stat_3561450806",
    ["unique boss has increased area of effect"] = "explicit.stat_3040667106",
    ["minions regenerate life per second"] = "explicit.stat_2479683456",
    ["socketed gems are supported by level concentrated effect"] = "explicit.stat_2388360415",
    ["increased attack speed if you've dealt a critical strike recently"] = "explicit.stat_1585344030",
    ["to maximum number of zombies"] = "explicit.stat_1652515349",
    ["implicit modifier magnitudes are doubled"] = "explicit.stat_2304729532",
    ["players have reduced chance to block"] = "explicit.stat_3729221884",
    ["players have less armour"] = "explicit.stat_272758639",
    ["chance to gain onslaught for 4 seconds on kill"] = "explicit.stat_3023957681",
    ["to level of socketed aura gems"] = "explicit.stat_2452998583",
    ["monsters have increased accuracy rating"] = "explicit.stat_1588049749",
    ["player chance to dodge is lucky"] = "explicit.stat_1651847244",
    ["players have less area of effect"] = "explicit.stat_2312028586",
    ["chance to blind enemies on hit with attacks"] = "explicit.stat_318953428",
    ["increased attack speed with staves"] = "explicit.stat_1394963553",
    ["socketed gems are supported by level trap"] = "explicit.stat_1122134690",
    ["players gain reduced flask charges"] = "explicit.stat_2549889921",
    ["gain of physical damage as extra chaos damage"] = "explicit.stat_3319896421",
    ["gain of physical damage as extra lightning damage"] = "explicit.stat_219391121",
    ["chance to block spell damage while wielding a staff"] = "explicit.stat_2120297997",
    ["reflects cold damage to melee attackers"] = "explicit.stat_4235886357",
    ["increased physical damage with staves"] = "explicit.stat_3150705301",
    ["increased experience gain (maps)"] = "explicit.stat_57434274",
    ["area has patches of chilled ground"] = "explicit.stat_389725673",
    ["increased life leeched per second"] = "explicit.stat_2633745731",
    ["chance to block attack damage while wielding a staff"] = "explicit.stat_1778298516",
    ["adds to chaos damage (local)"] = "explicit.stat_2223678961",
    ["area contains two unique bosses"] = "explicit.stat_799271621",
    ["increased movement speed when on full life"] = "explicit.stat_3393547195",
    ["chance to gain phasing for 4 seconds on kill"] = "explicit.stat_2918708827",
    ["to level of socketed bow gems"] = "explicit.stat_2027269580",
    ["to maximum frenzy charges"] = "explicit.stat_4078695",
    ["monsters have chance to gain a frenzy charge on hit"] = "explicit.stat_1742567045",
    ["to maximum chance to block attack damage"] = "explicit.stat_4124805414",
    ["of physical damage converted to cold damage"] = "explicit.stat_2133341901",
    ["socketed gems are supported by level faster casting"] = "explicit.stat_2169938251",
    ["monster physical damage reduction"] = "explicit.stat_839186746",
    ["instant recovery"] = "explicit.stat_1526933524",
    ["mercury footprints"] = "explicit.stat_3970396418",
    ["players are cursed with temporal chains"] = "explicit.stat_2326202293",
    ["chance to maim on hit"] = "explicit.stat_2763429652",
    ["increased movement speed per frenzy charge"] = "explicit.stat_1541516339",
    ["recharges charge when you take a critical strike"] = "explicit.stat_3662336899",
    ["minions deal to additional physical damage"] = "explicit.stat_1172029298",
    ["chance to gain a frenzy charge on kill"] = "explicit.stat_1826802197",
    ["regenerate life over 1 second when you cast a spell"] = "explicit.stat_1955882986",
    ["increased chill duration on enemies"] = "explicit.stat_3485067555",
    ["increased damage if you've killed recently"] = "explicit.stat_1072119541",
    ["to level of socketed spell gems"] = "explicit.stat_446733281",
    ["chance to avoid elemental ailments"] = "explicit.stat_3005472710",
    ["monsters reflect of physical damage"] = "explicit.stat_3464419871",
    ["energy shield regenerated per second"] = "explicit.stat_2561836520",
    ["monster elemental resistance"] = "explicit.stat_1054098949",
    ["monsters have a chance to avoid poison, blind, and bleeding"] = "explicit.stat_2215002568",
    ["monster chaos resistance"] = "explicit.stat_365540634",
    ["less effect of curses on monsters"] = "explicit.stat_3796523155",
    ["minions have increased area of effect"] = "explicit.stat_3811191316",
    ["immunity to shock during flask effect removes shock on use"] = "explicit.stat_1793666115",
    ["chance to cause bleeding on critical strike"] = "explicit.stat_513681673",
    ["adds knockback to melee attacks during flask effect"] = "explicit.stat_251342217",
    ["to maximum number of skeletons"] = "explicit.stat_2428829184",
    ["rampage"] = "explicit.stat_2397408229",
    ["immunity to ignite during flask effect removes burning on use"] = "explicit.stat_1195793677",
    ["players are cursed with vulnerability"] = "explicit.stat_1366534040",
    ["to critical strike multiplier if you've killed recently"] = "explicit.stat_2937483991",
    ["to evasion rating while on low life"] = "explicit.stat_3470876581",
    ["increased physical damage taken"] = "explicit.stat_3853018505",
    ["players are cursed with elemental weakness"] = "explicit.stat_558910024",
    ["reduced enemy stun threshold with this weapon"] = "explicit.stat_832404842",
    ["damage penetrates lightning resistance"] = "explicit.stat_818778753",
    ["chance to gain onslaught for 4 seconds on kill"] = "explicit.stat_665823128",
    ["area has patches of burning ground"] = "explicit.stat_3665534869",
    ["minions deal to additional cold damage"] = "explicit.stat_3152982863",
    ["increased trap duration"] = "explicit.stat_2001530951",
    ["life gained when you block"] = "explicit.stat_762600725",
    ["socketed gems are supported by level multistrike"] = "explicit.stat_2501237765",
    ["adds to fire damage to spells and attacks"] = "explicit.stat_3964634628",
    ["adds to lightning damage to wand attacks"] = "explicit.stat_2787733863",
    ["minions deal to additional fire damage"] = "explicit.stat_3351784991",
    ["area is a large maze"] = "explicit.stat_587175996",
    ["bow attacks fire an additional arrow"] = "explicit.stat_742529963",
    ["to level of socketed chaos gems"] = "explicit.stat_2675603254",
    ["more physical damage with unarmed attacks"] = "explicit.stat_2649720402",
    ["players have point blank"] = "explicit.stat_2835888248",
    ["players are cursed with enfeeble"] = "explicit.stat_4103440490",
    ["nearby enemies are intimidated"] = "explicit.stat_2899095498",
    ["of physical damage converted to lightning damage"] = "explicit.stat_3240769289",
    ["socketed gems are supported by level melee splash"] = "explicit.stat_1811422871",
    ["has no sockets"] = "explicit.stat_1493091477",
    ["increased effect of chill"] = "explicit.stat_828179689",
    ["minions deal to additional lightning damage"] = "explicit.stat_2930653471",
    ["to level of socketed curse gems"] = "explicit.stat_3691695237",
    ["increased curse duration"] = "explicit.stat_3824372849",
    ["maximum player resistances"] = "explicit.stat_3376488707",
    ["increased armour during flask effect"] = "explicit.stat_1693613464",
    ["of physical attack damage leeched as mana per blue socket"] = "explicit.stat_172852114",
    ["area has patches of desecrated ground"] = "explicit.stat_3577222856",
    ["socketed gems are supported by level hypothermia"] = "explicit.stat_13669281",
    ["additional physical damage reduction against abyssal monsters"] = "explicit.stat_287491423",
    ["increased evasion rating during flask effect"] = "explicit.stat_299054775",
    ["increased life recovery from flasks"] = "explicit.stat_821241191",
    ["reduced mana cost of minion skills"] = "explicit.stat_2969128501",
    ["damage penetrates elemental resistance if you haven't killed recently"] = "explicit.stat_455556407",
    ["slaying enemies close together can attract monsters from beyond"] = "explicit.stat_2202161594",
    ["chance to avoid being ignited"] = "explicit.stat_1783006896",
    ["increased frenzy charge duration"] = "explicit.stat_3338298622",
    ["curses have reduced effect on monsters"] = "explicit.stat_2999796964",
    ["this map's modifiers to quantity of items found also apply to rarity"] = "explicit.stat_436556261",
    ["increased character size"] = "explicit.stat_1408638732",
    ["minions have increased attack speed"] = "explicit.stat_3375935924",
    ["monster level"] = "explicit.stat_284496119",
    ["chance to gain a power charge on kill"] = "explicit.stat_2483795307",
    ["socketed gems are supported by level added fire damage"] = "explicit.stat_2572192375",
    ["chance to be ignited"] = "explicit.stat_1618339429",
    ["increased cast speed while ignited"] = "explicit.stat_3660039923",
    ["increased attack speed while ignited"] = "explicit.stat_2047819517",
    ["chance to gain unholy might for 4 seconds on melee kill"] = "explicit.stat_3166317791",
    ["all sockets are white"] = "explicit.stat_211836731",
    ["chance to avoid being shocked"] = "explicit.stat_1871765599",
    ["to fire resistance when socketed with a red gem"] = "explicit.stat_3051845758",
    ["to cold resistance when socketed with a green gem"] = "explicit.stat_1064331314",
    ["to lightning resistance when socketed with a blue gem"] = "explicit.stat_289814996",
    ["socketed gems are supported by level poison"] = "explicit.stat_2228279620",
    ["socketed gems have elemental equilibrium"] = "explicit.stat_2605850929",
    ["immune to curses during flask effect removes curses on use"] = "explicit.stat_1670623917",
    ["of physical damage from hits taken as fire damage"] = "explicit.stat_3342989455",
    ["additional elemental resistances during flask effect"] = "explicit.stat_962725504",
    ["unique boss gives increased experience"] = "explicit.stat_2484223218",
    ["primordial"] = "explicit.stat_1089165168",
    ["minions deal to additional chaos damage"] = "explicit.stat_2889601781",
    ["unique boss drops an additional map"] = "explicit.stat_655278200",
    ["increased movement speed if you haven't taken damage recently"] = "explicit.stat_3854949926",
    ["immune to poison during flask effect removes poison on use"] = "explicit.stat_2392912145",
    ["adds to cold damage to wand attacks"] = "explicit.stat_2383797932",
    ["socketed gems have reduced mana reservation"] = "explicit.stat_3289633055",
    ["increased evasion rating while moving"] = "explicit.stat_734823525",
    ["increased effect of non-curse auras from your skills"] = "explicit.stat_1880071428",
    ["socketed gems are supported by level spell totem"] = "explicit.stat_2962840349",
    ["of fire damage converted to chaos damage"] = "explicit.stat_2731249891",
    ["life gained for each enemy hit by your spells"] = "explicit.stat_2018035324",
    ["temporal chains has reduced effect on you"] = "explicit.stat_1152934561",
    ["socketed gems are supported by level spell echo"] = "explicit.stat_438778966",
    ["increased effect of socketed jewels"] = "explicit.stat_1482572705",
    ["monsters' melee attacks apply random curses on hit"] = "explicit.stat_41394014",
    ["monsters reflect curses"] = "explicit.stat_1341845920",
    ["monsters are immune to randomly chosen elemental ailments or stun"] = "explicit.stat_2355312681",
    ["monsters cannot be taunted"] = "explicit.stat_1106651798",
    ["all monster damage from hits always ignites"] = "explicit.stat_816367946",
    ["monsters' action speed cannot be modified to below base value"] = "explicit.stat_798009319",
    ["damage from enemies hitting you is unlucky while you are on low life"] = "explicit.stat_3753748365",
    ["adds to lightning damage to claw attacks"] = "explicit.stat_4231842891",
    ["socketed gems fire an additional projectile"] = "explicit.stat_4016885052",
    ["to chaos resistance when on low life"] = "explicit.stat_2366940416",
    ["life regenerated per second per level"] = "explicit.stat_1384864963",
    ["to maximum fire resistance"] = "explicit.stat_4095671657",
    ["increased damage against abyssal monsters"] = "explicit.stat_3257279374",
    ["of recovery applied instantly"] = "explicit.stat_2503377690",
    ["adds to lightning damage to spells and attacks"] = "explicit.stat_2885144362",
    ["physical damage taken on minion death"] = "explicit.stat_4176970656",
    ["increased movement speed if you've killed recently"] = "explicit.stat_279227559",
    ["items and gems have increased attribute requirements"] = "explicit.stat_752930724",
    ["increased critical strike chance if you haven't dealt a critical strike recently"] = "explicit.stat_2856328513",
    ["increased damage taken while on full energy shield"] = "explicit.stat_969865219",
    ["increased experience gain"] = "explicit.stat_3666934677",
    ["increased cast speed if you've dealt a critical strike recently"] = "explicit.stat_1174076861",
    ["increased damage with movement skills"] = "explicit.stat_856021430",
    ["with at least 40 strength in radius, molten strike fires an additional projectile"] = "explicit.stat_2845889407",
    ["adds to lightning damage to sword attacks"] = "explicit.stat_1237708713",
    ["of life regenerated per second while moving"] = "explicit.stat_908516597",
    ["you can apply an additional curse"] = "explicit.stat_30642521",
    ["increased effect"] = "explicit.stat_553298121",
    ["with at least 40 strength in radius, molten strike has increased area of effect"] = "explicit.stat_1163758055",
    ["increased area of effect of aura skills"] = "explicit.stat_895264825",
    ["area is inhabited by skeletons"] = "explicit.stat_45546355",
    ["chance to dodge attack and spell hits if you've been hit recently"] = "explicit.stat_3278968597",
    ["cannot be knocked back"] = "explicit.stat_4212255859",
    ["unwavering stance"] = "explicit.stat_1683578560",
    ["adds to fire damage to wand attacks"] = "explicit.stat_87098247",
    ["socketed gems are supported by level melee physical damage"] = "explicit.stat_2985291457",
    ["socketed gems are supported by level elemental proliferation"] = "explicit.stat_2929101122",
    ["recover of maximum mana on kill"] = "explicit.stat_1030153674",
    ["monsters have a chance to cause elemental ailments on hit"] = "explicit.stat_2553656203",
    ["to maximum cold resistance"] = "explicit.stat_3676141501",
    ["nearby allies gain increased mana regeneration rate"] = "explicit.stat_1370753114",
    ["socketed gems are supported by level maim"] = "explicit.stat_3826977109",
    ["nearby allies gain of life regenerated per second"] = "explicit.stat_1688975080",
    ["socketed gems are supported by level increased critical damage"] = "explicit.stat_1108755349",
    ["recover of life when you lose a spirit charge"] = "explicit.stat_305634887",
    ["projectiles pierce an additional target"] = "explicit.stat_2067062068",
    ["to maximum spirit charges per abyss jewel affecting you"] = "explicit.stat_4053097676",
    ["socketed gems are supported by level chance to bleed"] = "explicit.stat_4197676934",
    ["additional physical damage reduction if you weren't damaged by a hit recently"] = "explicit.stat_3603666270",
    ["of chaos damage leeched as life"] = "explicit.stat_744082851",
    ["to melee weapon and unarmed attack range"] = "explicit.stat_2264295449",
    ["zealot's oath during flask effect"] = "explicit.stat_851224302",
    ["of maximum life taken as chaos damage per second"] = "explicit.stat_3232201443",
    ["recover of your maximum life on use"] = "explicit.stat_2629106530",
    ["socketed gems are supported by level elemental damage with attacks"] = "explicit.stat_2532625478",
    ["adds to cold damage to claw attacks"] = "explicit.stat_2848646243",
    ["adds to lightning damage to dagger attacks"] = "explicit.stat_3479683016",
    ["chance to deal double damage"] = "explicit.stat_1172810729",
    ["to weapon range"] = "explicit.stat_350598685",
    ["adds to cold damage to sword attacks"] = "explicit.stat_972201717",
    ["increased mana regeneration rate while moving"] = "explicit.stat_1327522346",
    ["increased skeleton duration"] = "explicit.stat_1331384105",
    ["chance to grant onslaught to nearby enemies on kill"] = "explicit.stat_1924591908",
    ["chance to block spell damage if you were damaged by a hit recently"] = "explicit.stat_1101206134",
    ["adds to lightning damage to axe attacks"] = "explicit.stat_1582068183",
    ["trigger level spirit burst when you use a skill while you have a spirit charge"] = "explicit.stat_1992516007",
    ["chance to gain a spirit charge on kill"] = "explicit.stat_570644802",
    ["area has seconds between monster waves"] = "explicit.stat_2609732382",
    ["action speed cannot be modified to below base value"] = "explicit.stat_628716294",
    ["chance to grant unholy might to nearby enemies on kill"] = "explicit.stat_1745710984",
    ["area has waves of monsters"] = "explicit.stat_4182502594",
    ["chance to block attack damage if you were damaged by a hit recently"] = "explicit.stat_852195286",
    ["socketed gems are supported by level ancestral call"] = "explicit.stat_696805682",
    ["increased attributes"] = "explicit.stat_3143208761",
    ["increased attack damage against bleeding enemies"] = "explicit.stat_3944782785",
    ["gains no charges during effect of any overflowing chalice flask"] = "explicit.stat_3741956733",
    ["socketed gems are supported by level remote mine"] = "explicit.stat_1710508327",
    ["increased damage taken"] = "explicit.stat_3691641145",
    ["increased mana recovery from flasks"] = "explicit.stat_2222186378",
    ["minions have increased cast speed"] = "explicit.stat_4000101551",
    ["increased charges gained by other flasks during flask effect"] = "explicit.stat_1085359447",
    ["adds to fire damage to claw attacks"] = "explicit.stat_2154290807",
    ["players cannot regenerate life, mana or energy shield"] = "explicit.stat_1910157106",
    ["increased duration of curses on you"] = "explicit.stat_2920970371",
    ["gore footprints"] = "explicit.stat_2319448214",
    ["gain of elemental damage as extra chaos damage"] = "explicit.stat_3495544060",
    ["life gained on killing ignited enemies"] = "explicit.stat_893903361",
    ["minions have chance to dodge attack hits"] = "explicit.stat_3214518396",
    ["increased global physical damage with weapons per red socket"] = "explicit.stat_2112615899",
    ["increased global attack speed per green socket"] = "explicit.stat_250876318",
    ["of physical damage from hits taken as lightning damage"] = "explicit.stat_425242359",
    ["to melee weapon range per white socket"] = "explicit.stat_2076080860",
    ["mana gained for each enemy hit by attacks"] = "explicit.stat_640052854",
    ["you take of your maximum life as chaos damage on use"] = "explicit.stat_2301696196",
    ["you gain a power charge on use"] = "explicit.stat_2697049014",
    ["you gain an endurance charge on use"] = "explicit.stat_3986030307",
    ["removes of your maximum energy shield on use"] = "explicit.stat_2917449574",
    ["cannot be stunned"] = "explicit.stat_1694106311",
    ["you gain a frenzy charge on use"] = "explicit.stat_3230795453",
    ["final boss drops higher level items"] = "explicit.stat_2689259705",
    ["moving while bleeding doesn't cause you to take extra damage"] = "explicit.stat_935326447",
    ["vaal skills have reduced soul cost during effect"] = "explicit.stat_1274125114",
    ["of energy shield regenerated per second"] = "explicit.stat_3594640492",
    ["vaal skills used during effect have reduced soul gain prevention duration"] = "explicit.stat_902947445",
    ["area contains unbridged gaps to cross"] = "explicit.stat_860864690",
    ["enemies you kill have a chance to explode, dealing a quarter of their maximum life as chaos damage"] = "explicit.stat_1776945532",
    ["socketed gems are supported by level slower projectiles"] = "explicit.stat_1390285657",
    ["increased armour while not ignited, frozen or shocked"] = "explicit.stat_1164767410",
    ["vaal skills deal increased damage during effect"] = "explicit.stat_4067144129",
    ["monsters have chance to avoid ailments"] = "explicit.stat_376585490",
    ["increased elemental damage with attack skills during any flask effect"] = "explicit.stat_782323220",
    ["socketed gems are supported by level innervate"] = "explicit.stat_1106668565",
    ["cannot gain mana during effect"] = "explicit.stat_2198697797",
    ["adds to fire damage to sword attacks"] = "explicit.stat_601249293",
    ["recover of maximum energy shield on kill"] = "explicit.stat_2406605753",
    ["chance to avoid being ignited while on low life"] = "explicit.stat_4271082039",
    ["to fire resistance while on low life"] = "explicit.stat_38301299",
    ["increased block and stun recovery during flask effect"] = "explicit.stat_3479987487",
    ["consumes 1 frenzy charge on use"] = "explicit.stat_570159344",
    ["increased movement speed for you and nearby allies"] = "explicit.stat_3410049114",
    ["adds to lightning damage to mace attacks"] = "explicit.stat_2096159630",
    ["ignited enemies you hit are destroyed on kill"] = "explicit.stat_3173052379",
    ["increased damage over time while wielding a two handed weapon"] = "explicit.stat_4193088553",
    ["of cold damage converted to fire damage"] = "explicit.stat_723832351",
    ["adds to cold damage to axe attacks"] = "explicit.stat_1782176131",
    ["players have increased cooldown recovery speed for movement skills"] = "explicit.stat_2159994279",
    ["gain onslaught for second per frenzy charge on use"] = "explicit.stat_3457100218",
    ["increased damage taken from skeletons"] = "explicit.stat_705686721",
    ["increased damage taken from ghosts"] = "explicit.stat_2156764291",
    ["gain of physical damage as extra fire damage if you've dealt a critical strike recently"] = "explicit.stat_2810434465",
    ["of attack damage leeched as life"] = "explicit.stat_141810208",
    ["socketed gems are supported by level burning damage"] = "explicit.stat_2680613507",
    ["grants level aspect of the spider skill"] = "explicit.stat_956546305",
    ["increases and reductions to life in radius are transformed to apply to mana at 200% of their value"] = "explicit.stat_2479374428",
    ["adds to cold damage to dagger attacks"] = "explicit.stat_1263342750",
    ["socketed gems are supported by level minion damage"] = "explicit.stat_808939569",
    ["increased accuracy rating per frenzy charge"] = "explicit.stat_3700381193",
    ["chance to blind enemies on hit"] = "explicit.stat_2301191210",
    ["to level of socketed support gems"] = "explicit.stat_4154259475",
    ["adds to fire damage in main hand"] = "explicit.stat_169657426",
    ["of physical attack damage leeched as life during flask effect"] = "explicit.stat_3111255591",
    ["gain of weapon physical damage as extra damage of a random element"] = "explicit.stat_1038949719",
    ["dexterity from passives in radius is transformed to intelligence"] = "explicit.stat_2075199521",
    ["socketed gems are supported by level minion life"] = "explicit.stat_1337327984",
    ["to maximum number of summoned totems"] = "explicit.stat_429867172",
    ["chance to gain a power, frenzy or endurance charge on kill"] = "explicit.stat_498214257",
    ["1% increased movement speed per evasion rating, up to 75%"] = "explicit.stat_2591020064",
    ["physical damage taken when hit by animals"] = "explicit.stat_3277537093",
    ["socketed gems are supported by level mana leech"] = "explicit.stat_2608615082",
    ["adds to fire damage to axe attacks"] = "explicit.stat_2461965653",
    ["global chance to blind enemies on hit"] = "explicit.stat_2221570601",
    ["increases and reductions to energy shield in radius are transformed to apply to armour at 200% of their value"] = "explicit.stat_2605119037",
    ["found items have a chance to drop corrupted in area"] = "explicit.stat_728267040",
    ["adds to fire damage to dagger attacks"] = "explicit.stat_1910361436",
    ["to all elemental resistances while you have at least 200 strength"] = "explicit.stat_2415398184",
    ["of attack damage leeched as mana"] = "explicit.stat_350069479",
    ["socketed gems are supported by level chance to flee"] = "explicit.stat_952060721",
    ["30% increased movement speed for seconds on throwing a trap"] = "explicit.stat_3102860761",
    ["increased minion damage if you've used a minion skill recently"] = "explicit.stat_412745376",
    ["increased global damage"] = "explicit.stat_819529588",
    ["to chaos resistance during any flask effect"] = "explicit.stat_392168009",
    ["your fire damage can shock but not ignite"] = "explicit.stat_2949096603",
    ["your lightning damage can freeze but not shock"] = "explicit.stat_1011772129",
    ["restless dead"] = "explicit.stat_3303551725",
    ["your cold damage can ignite but not freeze or chill"] = "explicit.stat_1261612903",
    ["curse enemies with level 5 vulnerability on block"] = "explicit.stat_3477714116",
    ["area contains a large chest"] = "explicit.stat_2808735733",
    ["damage penetrates fire resistance"] = "explicit.stat_2653955271",
    ["with at least 40 intelligence in radius, raised zombies' slam attack has increased cooldown recovery speed"] = "explicit.stat_1097026492",
    ["increased spell damage taken when on low mana"] = "explicit.stat_3557561376",
    ["with at least 40 intelligence in radius, raised zombies' slam attack deals increased damage"] = "explicit.stat_781633505",
    ["grants level aspect of the cat skill"] = "explicit.stat_1265282021",
    ["cannot be stunned when on low life"] = "explicit.stat_1472543401",
    ["of physical attack damage leeched as mana during flask effect"] = "explicit.stat_374891408",
    ["increased spell damage per power charge"] = "explicit.stat_827329571",
    ["adds to cold damage to mace attacks"] = "explicit.stat_187418672",
    ["increased totem placement speed"] = "explicit.stat_3374165039",
    ["adds to cold damage to spells while holding a shield"] = "explicit.stat_2671663397",
    ["more melee physical damage during effect"] = "explicit.stat_3636096208",
    ["knocks back enemies in an area when you use a flask"] = "explicit.stat_3591397930",
    ["chance to cause enemies to flee on use"] = "explicit.stat_1457911472",
    ["inflicts a random level curse on you when your totems die"] = "explicit.stat_2918129907",
    ["adds to lightning damage to spells while holding a shield"] = "explicit.stat_1801889979",
    ["increased evasion rating during onslaught"] = "explicit.stat_156734303",
    ["increased damage with hits against chilled enemies"] = "explicit.stat_2805714016",
    ["chance to dodge spell hits while phasing"] = "explicit.stat_3621894381",
    ["increased armour if you haven't killed recently"] = "explicit.stat_2424133568",
    ["socketed gems are supported by level fortify"] = "explicit.stat_107118693",
    ["mana per 4 strength"] = "explicit.stat_507075051",
    ["accuracy rating per 2 intelligence"] = "explicit.stat_2196657026",
    ["increased melee physical damage per 10 dexterity"] = "explicit.stat_2355151849",
    ["life per 4 dexterity"] = "explicit.stat_2042405614",
    ["adds to chaos damage"] = "explicit.stat_3531280422",
    ["increased evasion rating per 10 intelligence"] = "explicit.stat_810772344",
    ["reduced spark duration"] = "explicit.stat_3420284170",
    ["grants level aspect of the avian skill"] = "explicit.stat_3914740665",
    ["with at least 40 intelligence in radius, spark fires an additional projectile"] = "explicit.stat_1650632809",
    ["adds to fire damage to mace attacks"] = "explicit.stat_3146788701",
    ["gain a power charge for each enemy you hit with a critical strike"] = "explicit.stat_1556625719",
    ["increased energy shield per 10 strength"] = "explicit.stat_506942497",
    ["recharges charge when you deal a critical strike"] = "explicit.stat_2961372685",
    ["with at least 40 intelligence in radius, spark fires projectiles in a nova"] = "explicit.stat_935386993",
    ["chaos damage does not bypass energy shield"] = "explicit.stat_1119465199",
    ["chance to block attack damage while wielding a staff (staves)"] = "explicit.stat_1001829678",
    ["adds to lightning damage to attacks with this weapon per 10 intelligence"] = "explicit.stat_3390848861",
    ["elemental hit deals increased damage"] = "explicit.stat_4109038270",
    ["increased critical strike chance if you have killed recently"] = "explicit.stat_3914638685",
    ["with a murderous eye jewel socketed, intimidate enemies for 4 seconds on hit with attacks"] = "explicit.stat_642457541",
    ["contains the immortalised grandmasters pvp damage scaling in effect"] = "explicit.stat_3787670808",
    ["increased rarity of items found when on low life"] = "explicit.stat_2929867083",
    ["socketed gems are supported by level immolate"] = "explicit.stat_2420410470",
    ["socketed gems are supported by level cold penetration"] = "explicit.stat_1991958615",
    ["with a searching eye jewel socketed, maim enemies for 4 seconds on hit with attacks"] = "explicit.stat_2750004091",
    ["to all maximum resistances"] = "explicit.stat_569299859",
    ["with at least 40 intelligence in radius, increased freezing pulse damage if you've shattered an enemy recently"] = "explicit.stat_2074744008",
    ["minions have increased attack and cast speed if you or your minions have killed recently"] = "explicit.stat_4227567885",
    ["increased cold damage if you have used a fire skill recently"] = "explicit.stat_3612256591",
    ["additional physical damage reduction"] = "explicit.stat_3771516363",
    ["of life regenerated per second while frozen"] = "explicit.stat_2656696317",
    ["adds to cold damage to spells while dual wielding"] = "explicit.stat_3376452528",
    ["with at least 40 strength in radius, ground slam has a increased angle"] = "explicit.stat_156016608",
    ["chance to dodge attack hits per frenzy charge"] = "explicit.stat_172894060",
    ["with at least 40 intelligence in radius, freezing pulse fires an additional projectile"] = "explicit.stat_2098320128",
    ["increased fire damage if you have used a cold skill recently"] = "explicit.stat_4167600809",
    ["conduit"] = "explicit.stat_1994392904",
    ["grants level aspect of the crab skill"] = "explicit.stat_4102318278",
    ["area becomes fatal after some time"] = "explicit.stat_2378288719",
    ["reduced freeze duration on you"] = "explicit.stat_2160282525",
    ["minions have to armour"] = "explicit.stat_2048970144",
    ["adds to fire damage to spells while holding a shield"] = "explicit.stat_44182350",
    ["with at least 40 intelligence in radius, magma orb fires an additional projectile"] = "explicit.stat_2542542825",
    ["socketed gems have blood magic"] = "explicit.stat_1104246401",
    ["can have up to additional trap placed at a time"] = "explicit.stat_2224292784",
    ["chance to gain an endurance charge when you block"] = "explicit.stat_417188801",
    ["adds to lightning damage to spells while dual wielding"] = "explicit.stat_3352373076",
    ["chance to block attack damage during flask effect"] = "explicit.stat_2519106214",
    ["area has patches of shocking ground"] = "explicit.stat_3477720557",
    ["adds to lightning damage to staff attacks"] = "explicit.stat_3212481075",
    ["chance to block spell damage during flask effect"] = "explicit.stat_215754572",
    ["minions have chance to hinder enemies on hit with spells, with 30% reduced movement speed"] = "explicit.stat_2323739383",
    ["increased damage over time during flask effect"] = "explicit.stat_1140739168",
    ["with at least 40 dexterity in radius, ethereal knives fires an additional projectile"] = "explicit.stat_2822821681",
    ["increased endurance charge duration"] = "explicit.stat_1170174456",
    ["with at least 40 dexterity in radius, ethereal knives fires projectiles in a nova"] = "explicit.stat_2511280084",
    ["with at least 40 dexterity in radius, barrage fires an additional projectile simultaneously on the first and final attacks"] = "explicit.stat_630867098",
    ["grants level despair curse aura during flask effect"] = "explicit.stat_1604995720",
    ["with at least 40 intelligence in radius, magma orb has increased area of effect per chain"] = "explicit.stat_160933750",
    ["increased movement speed while on full energy shield"] = "explicit.stat_2825197711",
    ["increased damage while leeching"] = "explicit.stat_310246444",
    ["increased attack speed per frenzy charge"] = "explicit.stat_3548561213",
    ["traps and mines deal to additional physical damage"] = "explicit.stat_3391324703",
    ["gain a power charge on non-critical strike"] = "explicit.stat_1592029809",
    ["reduced frenzy charge duration per frenzy charge"] = "explicit.stat_2543931078",
    ["socketed gems are supported by level faster projectiles"] = "explicit.stat_99089516",
    ["unique boss drops additional rare #"] = "explicit.stat_2343216207",
    ["traps and mines have a chance to poison on hit"] = "explicit.stat_3192135716",
    ["cannot leech when on low life"] = "explicit.stat_3279535558",
    ["lose all power charges on critical strike"] = "explicit.stat_2735889191",
    ["increased energy shield recovery rate"] = "explicit.stat_988575597",
    ["increased fire damage taken"] = "explicit.stat_3743301799",
    ["adds to fire damage to spells while dual wielding"] = "explicit.stat_662691280",
    ["adds to physical damage to spells while holding a shield"] = "explicit.stat_3954157711",
    ["energy shield gained on kill"] = "explicit.stat_2528955616",
    ["with at least 40 strength in radius, heavy strike has a  chance to deal double damage"] = "explicit.stat_1025503586",
    ["gain of non-chaos damage as extra chaos damage"] = "explicit.stat_2063695047",
    ["socketed gems are supported by level spell cascade"] = "explicit.stat_503990161",
    ["socketed gems are supported by level ice bite"] = "explicit.stat_1384629003",
    ["triggers level death walk when equipped"] = "explicit.stat_651875072",
    ["increased damage while ignited"] = "explicit.stat_1686122637",
    ["increased damage for each type of abyss jewel affecting you"] = "explicit.stat_154272030",
    ["can't use other rings"] = "explicit.stat_64726306",
    ["with at least 40 strength in radius, cleave has increased area of effect per nearby enemy"] = "explicit.stat_2401616582",
    ["chance to freeze, shock and ignite"] = "explicit.stat_800141891",
    ["with at least 40 dexterity in radius, ice shot has increased area of effect"] = "explicit.stat_3442130499",
    ["with at least 40 dexterity in radius, ice shot pierces an additional target"] = "explicit.stat_3103494675",
    ["increased attack speed when on full life"] = "explicit.stat_4268321763",
    ["area contains no monsters"] = "explicit.stat_1626998468",
    ["gain an endurance charge when you take a critical strike"] = "explicit.stat_2609824731",
    ["minions have chance to taunt on hit with attacks"] = "explicit.stat_2911442053",
    ["curse enemies with level assassin's mark on hit"] = "explicit.stat_3382957283",
    ["adds to cold damage to staff attacks"] = "explicit.stat_1261958804",
    ["socketed gems are supported by level item rarity"] = "explicit.stat_3587013273",
    ["with at least 40 strength in radius, cleave grants fortify on hit"] = "explicit.stat_1248507170",
    ["chests have increased item rarity"] = "explicit.stat_3457143479",
    ["share endurance charges with nearby party members"] = "explicit.stat_1881314095",
    ["with at least 40 dexterity in radius, frost blades has increased projectile speed"] = "explicit.stat_2092708508",
    ["attacks with this weapon maim on hit"] = "explicit.stat_3418949024",
    ["instant recovery when on low life"] = "explicit.stat_3812107348",
    ["chance to trigger level 8 summon raging spirit on kill"] = "explicit.stat_3751996449",
    ["chance to avoid bleeding"] = "explicit.stat_1618589784",
    ["with at least 40 dexterity in radius, viper strike deals increased damage with hits and poison for each poison on the enemy"] = "explicit.stat_695031402",
    ["socketed gems are supported by level lesser poison"] = "explicit.stat_228165595",
    ["with at least 40 strength in radius, ground slam has a chance to grant an endurance charge when you stun an enemy"] = "explicit.stat_1559361866",
    ["of attack damage leeched as mana against poisoned enemies"] = "explicit.stat_3067409450",
    ["minions have chance to blind on hit with attacks"] = "explicit.stat_2431643207",
    ["increased damage over time while dual wielding"] = "explicit.stat_214001793",
    ["increased rarity of items found from slain unique enemies"] = "explicit.stat_121185030",
    ["with at least 40 dexterity in radius, melee damage dealt by frost blades penetrates cold resistance"] = "explicit.stat_2412100590",
    ["increased damage while you have no frenzy charges"] = "explicit.stat_3905661226",
    ["increased damage over time while holding a shield"] = "explicit.stat_1244360317",
    ["increased critical strike chance against enemies on full life"] = "explicit.stat_47954913",
    ["of attack damage leeched as life on critical strike"] = "explicit.stat_2100196861",
    ["increased effect of flasks on you"] = "explicit.stat_114734841",
    ["adds to physical damage to spells while dual wielding"] = "explicit.stat_4255924189",
    ["skills chain times"] = "explicit.stat_1787073323",
    ["arrows deal increased damage with hits and ailments to targets they pierce"] = "explicit.stat_1019891080",
    ["can summon up to additional golem at a time"] = "explicit.stat_2821079699",
    ["of attack damage leeched as life against maimed enemies"] = "explicit.stat_447636597",
    ["your spells have culling strike"] = "explicit.stat_3238189103",
    ["with at least 40 intelligence in radius, frostbolt fires an additional projectile"] = "explicit.stat_3790108551",
    ["monsters are hexproof"] = "explicit.stat_4154059009",
    ["with at least 40 intelligence in radius, frostbolt projectiles gain increased projectile speed per second"] = "explicit.stat_2727977666",
    ["to level of socketed strength gems"] = "explicit.stat_916797432",
    ["to level of socketed movement gems"] = "explicit.stat_3852526385",
    ["adds to fire damage to staff attacks"] = "explicit.stat_3220927448",
    ["adds to physical damage to sword attacks"] = "explicit.stat_1040189894",
    ["reduced mana cost of skills when on low life"] = "explicit.stat_73272763",
    ["to all elemental resistances while on low life"] = "explicit.stat_1637928656",
    ["socketed gems reserve no mana"] = "explicit.stat_1237038225",
    ["with at least 40 dexterity in radius, shrapnel shot's cone has a chance to deal double damage"] = "explicit.stat_1009030716",
    ["increased damage per curse on you"] = "explicit.stat_1019020209",
    ["an additional curse can be applied to you"] = "explicit.stat_3112863846",
    ["with at least 40 intelligence in radius, fireball projectiles gain radius as they travel farther, up to radius"] = "explicit.stat_1351893427",
    ["increased global defences"] = "explicit.stat_1389153006",
    ["your hits can only kill frozen enemies"] = "explicit.stat_2740359895",
    ["increased quantity of items found during flask effect"] = "explicit.stat_3736953565",
    ["adds to cold damage to spells while wielding a two handed weapon"] = "explicit.stat_2464689927",
    ["increased rarity of items found during flask effect"] = "explicit.stat_1740200922",
    ["chance to cause monster to flee on block"] = "explicit.stat_3212461220",
    ["adds to physical damage to claw attacks"] = "explicit.stat_3303015",
    ["with at least 40 dexterity in radius, shrapnel shot has increased area of effect"] = "explicit.stat_3945934607",
    ["can't use chest armour"] = "explicit.stat_4007482102",
    ["attacks chain an additional time when in main hand"] = "explicit.stat_2466604008",
    ["with at least 40 dexterity in radius, dual strike has a chance to deal double damage with the main-hand weapon"] = "explicit.stat_3765671129",
    ["cannot evade enemy attacks"] = "explicit.stat_474452755",
    ["with at least 40 dexterity in radius, dual strike deals off-hand splash damage to surrounding targets"] = "explicit.stat_3603019813",
    ["chance to gain onslaught for 10 seconds on kill"] = "explicit.stat_2453026567",
    ["reduced reflected elemental damage taken"] = "explicit.stat_248838155",
    ["of physical damage from hits taken as chaos damage"] = "explicit.stat_4129825612",
    ["increased light radius during flask effect"] = "explicit.stat_2745936267",
    ["attacks fire an additional projectile when in off hand"] = "explicit.stat_2105048696",
    ["chance to gain unholy might for 10 seconds on kill"] = "explicit.stat_3991482957",
    ["adds to physical damage to wand attacks"] = "explicit.stat_133683091",
    ["curse reflection"] = "explicit.stat_1731672673",
    ["adds to lightning damage to spells while wielding a two handed weapon"] = "explicit.stat_2398198236",
    ["chance to avoid being poisoned"] = "explicit.stat_4053951709",
    ["chance to avoid being chilled during onslaught"] = "explicit.stat_2872105818",
    ["to zombie maximum life"] = "explicit.stat_4116579804",
    ["reduced number of zombies allowed"] = "explicit.stat_4041805509",
    ["increased zombie resistances"] = "explicit.stat_3150000576",
    ["increased effect of your curses"] = "explicit.stat_2353576063",
    ["you gain onslaught for seconds on culling strike"] = "explicit.stat_3818161429",
    ["increased zombie size"] = "explicit.stat_3563667308",
    ["zombies deal more physical damage"] = "explicit.stat_568070507",
    ["increased cast speed if a minion has been killed recently"] = "explicit.stat_3110907148",
    ["of attack damage leeched as life against bleeding enemies"] = "explicit.stat_1625933063",
    ["with at least 40 intelligence in radius, enemies hindered by blight take increased chaos damage"] = "explicit.stat_263138730",
    ["increased physical damage with ranged weapons"] = "explicit.stat_766615564",
    ["increased accuracy rating if you haven't killed recently"] = "explicit.stat_2806435316",
    ["with at least 40 intelligence in radius, blight has increased hinder duration"] = "explicit.stat_2181499453",
    ["enemies killed by zombies explode dealing fire damage"] = "explicit.stat_2857427872",
    ["socketed gems are supported by level added chaos damage"] = "explicit.stat_411460446",
    ["socketed gems have chance to cause enemies to flee on hit"] = "explicit.stat_3418772",
    ["during flask effect, damage penetrates resistance of each element for which your uncapped elemental resistance is highest"] = "explicit.stat_2444301311",
    ["gain life when you lose an endurance charge"] = "explicit.stat_3915702459",
    ["far shot"] = "explicit.stat_2483362276",
    ["increased attack damage"] = "explicit.stat_2843214518",
    ["of cold damage leeched as life"] = "explicit.stat_3999401129",
    ["increased life recovered"] = "explicit.stat_1261982764",
    ["increased accuracy rating when on low life"] = "explicit.stat_347697569",
    ["cannot be frozen if dexterity is higher than intelligence"] = "explicit.stat_3881126302",
    ["socketed gems are supported by level vile toxins"] = "explicit.stat_1002855537",
    ["increased attack speed when on low life"] = "explicit.stat_1921572790",
    ["increased claw physical damage when on low life"] = "explicit.stat_1081444608",
    ["cannot be shocked if intelligence is higher than strength"] = "explicit.stat_3024242403",
    ["cannot be ignited if strength is higher than dexterity"] = "explicit.stat_676883595",
    ["of life regenerated per second if you have been hit recently"] = "explicit.stat_2201614328",
    ["increased attack and cast speed if you've used a movement skill recently"] = "explicit.stat_2831922878",
    ["increased damage per 5 of your lowest attribute"] = "explicit.stat_35476451",
    ["blood magic"] = "explicit.stat_2801937280",
    ["iron grip"] = "explicit.stat_573347393",
    ["with at least 40 dexterity in radius, burning arrow can inflict an additional ignite on an enemy"] = "explicit.stat_2443713073",
    ["socketed gems are supported by level trap and mine damage"] = "explicit.stat_3814066599",
    ["attacks with this weapon deal #-added chaos damage against enemies affected by at least 5 poisons"] = "explicit.stat_3829706447",
    ["reflects fire damage to melee attackers"] = "explicit.stat_1757945818",
    ["increased recovery when on low life"] = "explicit.stat_886931978",
    ["increased melee damage when on full life"] = "explicit.stat_3579807004",
    ["socketed gems are supported by level cast on death"] = "explicit.stat_3878987051",
    ["gain a frenzy charge on critical strike"] = "explicit.stat_398702949",
    ["unaffected by chilled ground"] = "explicit.stat_3653191834",
    ["adds to fire damage to spells while wielding a two handed weapon"] = "explicit.stat_2135335407",
    ["adds to chaos damage to spells while holding a shield"] = "explicit.stat_1181129483",
    ["cannot block attacks"] = "explicit.stat_3162258068",
    ["during flask effect, reduced damage taken of each element for which your uncapped elemental resistance is lowest"] = "explicit.stat_1869678332",
    ["with at least 40 strength in radius, glacial hammer deals cold-only splash damage to surrounding targets"] = "explicit.stat_3565558422",
    ["more damage"] = "explicit.stat_412462523",
    ["attacks with this weapon have increased elemental damage"] = "explicit.stat_17526298",
    ["of damage you reflect to enemies is gained as life"] = "explicit.stat_743992531",
    ["enemies cannot leech mana from you"] = "explicit.stat_4293245253",
    ["adds to physical damage to spells while wielding a two handed weapon"] = "explicit.stat_2921084940",
    ["to evasion rating while on full life"] = "explicit.stat_4082111882",
    ["with at least 40 strength in radius, of glacial hammer physical damage converted to cold damage"] = "explicit.stat_3738331820",
    ["to spectre maximum life"] = "explicit.stat_3111456397",
    ["chance to block projectile attack damage"] = "explicit.stat_3416410609",
    ["increased area of effect of curse skills"] = "explicit.stat_153777645",
    ["chance to hinder enemies on hit with spells, with 30% reduced movement speed"] = "explicit.stat_3002506763",
    ["increased rarity of items dropped by frozen enemies"] = "explicit.stat_2138434718",
    ["of fire damage leeched as life"] = "explicit.stat_3848282610",
    ["culling strike against burning enemies"] = "explicit.stat_1777334641",
    ["gain a frenzy charge if an attack ignites an enemy"] = "explicit.stat_3598983877",
    ["increased spell damage during any flask effect"] = "explicit.stat_2080171093",
    ["adds to chaos damage to spells and attacks during any flask effect"] = "explicit.stat_3519268108",
    ["socketed gems are supported by level added cold damage"] = "explicit.stat_4020144606",
    ["increased cold damage with attack skills"] = "explicit.stat_860668586",
    ["increased quantity of items dropped by slain normal enemies"] = "explicit.stat_1342790450",
    ["increased herald of ice damage"] = "explicit.stat_3910961021",
    ["adds to physical damage to axe attacks"] = "explicit.stat_311030839",
    ["increased spell damage per 10 intelligence"] = "explicit.stat_2818518881",
    ["socketed gems are supported by level ranged attack totem"] = "explicit.stat_3030692053",
    ["socketed gems are supported by level reduced mana"] = "explicit.stat_749770518",
    ["minions regenerate life per second"] = "explicit.stat_3062329212",
    ["increased rarity of items dropped by slain magic enemies"] = "explicit.stat_3433676080",
    ["adds to chaos damage to spells while dual wielding"] = "explicit.stat_1865428306",
    ["to level of socketed elemental gems"] = "explicit.stat_3571342795",
    ["increased critical strike chance against blinded enemies"] = "explicit.stat_1939202111",
    ["socketed gems are supported by level fire penetration"] = "explicit.stat_3265951306",
    ["increased power charge duration"] = "explicit.stat_3872306017",
    ["increased physical damage per endurance charge"] = "explicit.stat_2481358827",
    ["chance to cause poison on critical strike"] = "explicit.stat_374737750",
    ["enemies cannot leech life from you"] = "explicit.stat_4293455942",
    ["with at least 40 dexterity in radius, viper strike has a chance per poison on enemy to grant unholy might for 4 seconds on hit"] = "explicit.stat_235847153",
    ["curse enemies with level flammability on hit"] = "explicit.stat_338121249",
    ["increased attack speed with movement skills"] = "explicit.stat_3683134121",
    ["to maximum lightning resistance"] = "explicit.stat_1011760251",
    ["flask charges recovered every 3 seconds"] = "explicit.stat_3228973398",
    ["grants level icestorm skill"] = "explicit.stat_2103009393",
    ["golems have increased attack and cast speed"] = "explicit.stat_56225773",
    ["increased effect of buffs granted by your golems"] = "explicit.stat_2109043683",
    ["curses on slain enemies are transferred to a nearby enemy"] = "explicit.stat_426503793",
    ["golems have to armour"] = "explicit.stat_1020786773",
    ["damage with weapons penetrates elemental resistance"] = "explicit.stat_1736172673",
    ["reduced mana cost per endurance charge"] = "explicit.stat_1774881905",
    ["gain rampage while at maximum endurance charges"] = "explicit.stat_1643796079",
    ["has 1 socket"] = "explicit.stat_4077843608",
    ["chance to gain unholy might for 3 seconds on kill"] = "explicit.stat_3562211447",
    ["of lightning damage leeched as life"] = "explicit.stat_80079005",
    ["lose all endurance charges when rampage ends"] = "explicit.stat_2881426199",
    ["increased damage against ignited enemies"] = "explicit.stat_485151258",
    ["adds to physical damage to dagger attacks"] = "explicit.stat_1298238534",
    ["your maximum resistances are #%"] = "explicit.stat_798767971",
    ["increased global critical strike chance when in main hand"] = "explicit.stat_3404168630",
    ["to global critical strike multiplier per green socket"] = "explicit.stat_35810390",
    ["of physical damage from hits taken as cold damage"] = "explicit.stat_1871056256",
    ["chance to block attack damage while not cursed"] = "explicit.stat_3619054484",
    ["of physical attack damage leeched as life per red socket"] = "explicit.stat_3025389409",
    ["you cannot be shocked while at maximum endurance charges"] = "explicit.stat_798111687",
    ["increased stun duration on you"] = "explicit.stat_1067429236",
    ["increased melee damage per endurance charge"] = "explicit.stat_1275066948",
    ["cannot be stunned by attacks if your other ring is an elder item"] = "explicit.stat_2926399803",
    ["increased global defences per white socket"] = "explicit.stat_967108924",
    ["chance to trigger level 20 tentacle whip on kill"] = "explicit.stat_1350938937",
    ["you are shocked during flask effect, causing 50% increased damage taken"] = "explicit.stat_1187803783",
    ["shocks nearby enemies during flask effect, causing 10% increased damage taken"] = "explicit.stat_3446170049",
    ["increased cooldown recovery speed"] = "explicit.stat_1004011302",
    ["of lightning damage leeched as life during flask effect"] = "explicit.stat_2687254633",
    ["never deal critical strikes"] = "explicit.stat_3638599682",
    ["chance to trigger level 16 molten burst on melee hit"] = "explicit.stat_4125471110",
    ["chance to block attack damage when in off hand"] = "explicit.stat_2040585053",
    ["chance to block spell damage while cursed"] = "explicit.stat_3218891195",
    ["minions have to chaos resistance"] = "explicit.stat_3837707023",
    ["increased attack speed if you've killed recently"] = "explicit.stat_1507059769",
    ["socketed gems are supported by level cold to fire"] = "explicit.stat_550444281",
    ["increased damage with hits and ailments per curse on enemy"] = "explicit.stat_1818773442",
    ["unaffected by shocked ground"] = "explicit.stat_2234049899",
    ["to armour while frozen"] = "explicit.stat_504366827",
    ["lose all frenzy, endurance, and power charges when you move"] = "explicit.stat_31415336",
    ["increased attack damage if your other ring is a shaper item"] = "explicit.stat_1555962658",
    ["manifested dancing dervish disables both weapon slots"] = "explicit.stat_1756125633",
    ["triggers level manifest dancing dervish on rampage"] = "explicit.stat_974757096",
    ["manifested dancing dervish dies when rampage ends"] = "explicit.stat_422591144",
    ["gain a frenzy, endurance, or power charge once per second while you are stationary"] = "explicit.stat_1438403666",
    ["attacks have chance to poison while at maximum frenzy charges"] = "explicit.stat_3654074125",
    ["minions leech of damage as life"] = "explicit.stat_2770782267",
    ["chance to steal power, frenzy, and endurance charges on hit"] = "explicit.stat_875143443",
    ["unaffected by burning ground"] = "explicit.stat_1643688236",
    ["chance to block attack damage if you have blocked spell damage recently"] = "explicit.stat_647983250",
    ["increased elemental damage per frenzy charge"] = "explicit.stat_1586440250",
    ["chance to block spell damage if you have blocked attack damage recently"] = "explicit.stat_1214153650",
    ["socketed gems deal to additional fire damage"] = "explicit.stat_1289910726",
    ["enemies killed explode dealing of their life as fire damage"] = "explicit.stat_3457687358",
    ["minions' attacks deal to additional physical damage"] = "explicit.stat_797833282",
    ["adds to chaos damage to spells while wielding a two handed weapon"] = "explicit.stat_1743759111",
    ["increased spell damage per 5% chance to block attack damage"] = "explicit.stat_2449668043",
    ["adds to physical damage to mace attacks"] = "explicit.stat_3882662078",
    ["chance to curse non-cursed enemies with enfeeble on hit"] = "explicit.stat_3804297142",
    ["increased damage with poison if you have at least 300 dexterity"] = "explicit.stat_256730087",
    ["chance to taunt enemies on hit with attacks"] = "explicit.stat_280213220",
    ["to level of socketed active skill gems"] = "explicit.stat_4215039317",
    ["increased poison duration if you have at least 150 intelligence"] = "explicit.stat_2771181375",
    ["grants level summon stone golem"] = "explicit.stat_3056188914",
    ["strength from passives in radius is transformed to intelligence"] = "explicit.stat_3771273420",
    ["attack skills have to maximum number of summoned totems"] = "explicit.stat_3266394681",
    ["of melee physical damage taken reflected to attacker"] = "explicit.stat_1092987622",
    ["chance to avoid interruption from stuns while casting"] = "explicit.stat_1916706958",
    ["intelligence from passives in radius is transformed to dexterity"] = "explicit.stat_1608425196",
    ["reduced shock duration on you"] = "explicit.stat_99927264",
    ["of life regenerated per second per frenzy charge"] = "explicit.stat_2828673491",
    ["physical damage taken from projectile attacks"] = "explicit.stat_3612407781",
    ["intelligence requirement"] = "explicit.stat_2153364323",
    ["chance to create desecrated ground when you block"] = "explicit.stat_3685028559",
    ["minions deal increased damage against abyssal monsters"] = "explicit.stat_1086057912",
    ["chance to create consecrated ground when you block"] = "explicit.stat_573884683",
    ["increased damage per frenzy charge with hits against enemies on low life"] = "explicit.stat_1696792323",
    ["trigger level abyssal cry on hit"] = "explicit.stat_1795756125",
    ["reflects chaos damage to melee attackers"] = "explicit.stat_189451991",
    ["chance to gain fortify when you stun an enemy with melee damage"] = "explicit.stat_3206381437",
    ["reduced attack and cast speed per frenzy charge"] = "explicit.stat_269590092",
    ["less critical strike chance"] = "explicit.stat_4181057577",
    ["of damage is taken from mana before life per power charge"] = "explicit.stat_1325047894",
    ["to maximum life per elder item equipped"] = "explicit.stat_3849523464",
    ["critical strikes have culling strike"] = "explicit.stat_2996445420",
    ["socketed gems are supported by level advanced traps"] = "explicit.stat_3839163699",
    ["increased effect of non-damaging ailments per elder item equipped"] = "explicit.stat_4133552694",
    ["increased accuracy rating (local)"] = "explicit.stat_3647521724",
    ["increased damage with ailments per elder item equipped"] = "explicit.stat_2418574586",
    ["chance to avoid being frozen or chilled if you have used a fire skill recently"] = "explicit.stat_3706656107",
    ["strength from passives in radius is transformed to dexterity"] = "explicit.stat_2237528173",
    ["chance to trigger level 18 summon spectral wolf on kill"] = "explicit.stat_1785942004",
    ["increased mana regeneration rate per power charge"] = "explicit.stat_2847548062",
    ["reduced critical strike chance per power charge"] = "explicit.stat_2102212273",
    ["adds to lightning damage against shocked enemies"] = "explicit.stat_90012347",
    ["socketed gems are supported by level controlled destruction"] = "explicit.stat_3718597497",
    ["chance to dodge attack hits while your off hand is empty"] = "explicit.stat_3345724391",
    ["grants summon harbinger of the arcane skill"] = "explicit.stat_3872739249",
    ["socketed gems are supported by level ruthless"] = "explicit.stat_3796013729",
    ["increased cooldown recovery speed for throwing traps"] = "explicit.stat_3417757416",
    ["golems regenerate of their maximum life per second"] = "explicit.stat_2235163762",
    ["increased golem damage for each type of golem you have summoned"] = "explicit.stat_2114157293",
    ["increased cold damage while your off hand is empty"] = "explicit.stat_3520048646",
    ["area is inhabited by the vaal"] = "explicit.stat_2609768284",
    ["counts as dual wielding"] = "explicit.stat_2797075304",
    ["adds to chaos damage in off hand"] = "explicit.stat_3758293500",
    ["you and nearby allies gain increased damage"] = "explicit.stat_637766438",
    ["dexterity from passives in radius is transformed to strength"] = "explicit.stat_4097174922",
    ["adds to cold damage against chilled or frozen enemies"] = "explicit.stat_2233361223",
    ["socketed gems are supported by level brutality"] = "explicit.stat_715256302",
    ["more damage with arrow hits at close range"] = "explicit.stat_2749166636",
    ["golem skills have increased cooldown recovery speed"] = "explicit.stat_729180395",
    ["bow knockback at close range"] = "explicit.stat_3261557635",
    ["remove an ailment when you use a flask if all equipped items are elder items"] = "explicit.stat_2917587077",
    ["golems have increased cooldown recovery speed"] = "explicit.stat_3246099900",
    ["adds to lightning damage"] = "explicit.stat_1334060246",
    ["chance to grant a frenzy charge to nearby allies on hit"] = "explicit.stat_991168463",
    ["chance to grant a power charge to nearby allies on kill"] = "explicit.stat_2367680009",
    ["increased chaos damage per 10 intelligence from allocated passives in radius"] = "explicit.stat_2582360791",
    ["gain of physical attack damage as extra fire damage"] = "explicit.stat_273476097",
    ["to level of socketed dexterity gems"] = "explicit.stat_2718698372",
    ["of life regenerated per second with at least 400 strength"] = "explicit.stat_1173027373",
    ["nearby enemies are blinded"] = "explicit.stat_2826979740",
    ["adds to cold damage"] = "explicit.stat_2387423236",
    ["chance to avoid projectiles while phasing"] = "explicit.stat_3635120731",
    ["socketed curse gems are supported by level blasphemy"] = "explicit.stat_539747809",
    ["increases and reductions to life in radius are transformed to apply to energy shield"] = "explicit.stat_3194864913",
    ["celestial footprints"] = "explicit.stat_50381303",
    ["an enemy writhing worms escape the flask when used writhing worms are destroyed when hit"] = "explicit.stat_2434293916",
    ["you have phasing if you've killed recently"] = "explicit.stat_3489372920",
    ["reduced chaos damage taken over time"] = "explicit.stat_3762784591",
    ["to critical strike multiplier if you haven't dealt a critical strike recently"] = "explicit.stat_1478247313",
    ["strength requirement"] = "explicit.stat_2833226514",
    ["socketed spells have to critical strike chance"] = "explicit.stat_135378852",
    ["increased endurance, frenzy and power charge duration"] = "explicit.stat_2839036860",
    ["and nearby allies regenerate 200 life per second"] = "explicit.stat_1168603868",
    ["on killing a poisoned enemy, nearby enemies are poisoned"] = "explicit.stat_456916387",
    ["socketed gems fire projectiles in a nova"] = "explicit.stat_967556848",
    ["grants level purity of elements skill"] = "explicit.stat_105466375",
    ["cannot leech life from critical strikes"] = "explicit.stat_3243534964",
    ["summon an additional skeleton warrior with summon skeleton"] = "explicit.stat_1589090910",
    ["life gained on kill per frenzy charge"] = "explicit.stat_1269609669",
    ["increased melee damage against bleeding enemies"] = "explicit.stat_1282978314",
    ["increased spell damage while no mana is reserved"] = "explicit.stat_3779823630",
    ["gain a power charge after spending a total of 200 mana"] = "explicit.stat_3269060224",
    ["increased lightning damage per frenzy charge"] = "explicit.stat_3693130674",
    ["of lightning damage converted to chaos damage"] = "explicit.stat_4238266823",
    ["second to summon skeleton cooldown"] = "explicit.stat_3013430129",
    ["ignited enemies burn slower"] = "explicit.stat_1619549198",
    ["increased damage taken per frenzy charge"] = "explicit.stat_1625103793",
    ["you take chaos damage per second for seconds on kill"] = "explicit.stat_4031081471",
    ["with at least 40 intelligence in radius, raised spectres have a chance to gain soul eater for 30 seconds on kill"] = "explicit.stat_2390273715",
    ["your chaos damage can shock"] = "explicit.stat_2418601510",
    ["removes of maximum life on kill"] = "explicit.stat_751813227",
    ["removes of maximum energy shield on kill"] = "explicit.stat_1699499433",
    ["increased area of effect while unarmed"] = "explicit.stat_2216127021",
    ["of maximum mana gained on kill"] = "explicit.stat_1604736568",
    ["grants level frostbite skill"] = "explicit.stat_1169502663",
    ["curse enemies with level temporal chains on hit"] = "explicit.stat_3433724931",
    ["chance to gain a frenzy charge when your trap is triggered by an enemy"] = "explicit.stat_3738335639",
    ["you can inflict an additional ignite on an enemy"] = "explicit.stat_2837603657",
    ["recover life when your trap is triggered by an enemy"] = "explicit.stat_3952196842",
    ["chance to gain phasing for 3 seconds when your trap is triggered by an enemy"] = "explicit.stat_144887967",
    ["recover energy shield when your trap is triggered by an enemy"] = "explicit.stat_1073384532",
    ["adds to fire damage"] = "explicit.stat_321077055",
    ["chance to blind enemies on critical strike"] = "explicit.stat_3983981705",
    ["gain to critical strike chance for 2 seconds after spending a total of 800 mana"] = "explicit.stat_2864779809",
    ["reflects to lightning damage to melee attackers"] = "explicit.stat_1243237244",
    ["spells have to critical strike chance "] = "explicit.stat_791835907",
    ["chance to trigger level 20 summon volatile anomaly on kill"] = "explicit.stat_2143990571",
    ["adds to cold damage in off hand"] = "explicit.stat_2109066258",
    ["chance to ignite when in main hand"] = "explicit.stat_2919089822",
    ["chance to gain a frenzy charge when you stun an enemy"] = "explicit.stat_1695720239",
    ["arrows pierce all targets"] = "explicit.stat_1829238593",
    ["adds 1 maximum lightning damage to attacks per dexterity allocated in radius"] = "explicit.stat_778050954",
    ["chaos damage taken"] = "explicit.stat_496011033",
    ["attacks have to critical strike chance"] = "explicit.stat_2572042788",
    ["cannot be stunned by spells if your other ring is a shaper item"] = "explicit.stat_2312817839",
    ["increased damage with ignite inflicted on chilled enemies"] = "explicit.stat_1891782369",
    ["socketed spells have to critical strike multiplier"] = "explicit.stat_2828710986",
    ["you lose all endurance charges when hit"] = "explicit.stat_2994477068",
    ["you gain onslaught for second per endurance charge when hit"] = "explicit.stat_3714207489",
    ["you gain an endurance charge on kill"] = "explicit.stat_2064503808",
    ["increases and reductions to minion damage also affect you"] = "explicit.stat_1631928082",
    ["increases and reductions to physical damage in radius are transformed to apply to cold damage"] = "explicit.stat_738100799",
    ["increased effect of auras on you"] = "explicit.stat_34194642",
    ["increases and reductions to cold damage in radius are transformed to apply to physical damage"] = "explicit.stat_3772485866",
    ["nearby enemies have increased effect of curses on them"] = "explicit.stat_443525707",
    ["intelligence from passives in radius is transformed to strength"] = "explicit.stat_1285587221",
    ["stun threshold is based on energy shield instead of life"] = "explicit.stat_2562665460",
    ["adds to physical damage to staff attacks"] = "explicit.stat_69898010",
    ["nearby allies gain increased damage"] = "explicit.stat_3175679225",
    ["increased effect of auras on your minions"] = "explicit.stat_1224319074",
    ["increased life recovery rate"] = "explicit.stat_3240073117",
    ["immune to freeze, chill, curses and stuns during flask effect"] = "explicit.stat_803730540",
    ["increased warcry cooldown recovery speed"] = "explicit.stat_4159248054",
    ["with at least 40 dexterity in radius, each spectral throw projectile gains increased damage each time it hits"] = "explicit.stat_811386429",
    ["area contains an extra harbinger"] = "explicit.stat_504850499",
    ["1% increased evasion rating per dexterity allocated in radius"] = "explicit.stat_4113852051",
    ["increased spell damage if your other ring is an elder item"] = "explicit.stat_2921373173",
    ["take physical damage when hit by attacks"] = "explicit.stat_1569463444",
    ["pain attunement"] = "explicit.stat_98977150",
    ["1% increased claw physical damage per dexterity allocated in radius"] = "explicit.stat_1619923327",
    ["grants of life recovery to minions"] = "explicit.stat_2416869319",
    ["increased minion damage if you have hit recently"] = "explicit.stat_2337295272",
    ["spreads tar when you take a critical strike"] = "explicit.stat_927458676",
    ["increased mana leeched per second"] = "explicit.stat_690135178",
    ["gain of physical damage as extra damage of a random element"] = "explicit.stat_3753703249",
    ["1% increased melee physical damage with unarmed attacks per dexterity allocated in radius"] = "explicit.stat_915233352",
    ["gain life from leech instantly from hits with this weapon"] = "explicit.stat_1765389199",
    ["your energy shield starts at zero"] = "explicit.stat_2342431054",
    ["adds to physical damage to attacks with this weapon per 3 player levels"] = "explicit.stat_1454603936",
    ["socketed gems are supported by level life leech"] = "explicit.stat_891277550",
    ["increased poison duration per power charge"] = "explicit.stat_3491499175",
    ["1 to level of socketed active skill gems per player levels"] = "explicit.stat_1435838855",
    ["chance to gain a frenzy charge on killing a frozen enemy"] = "explicit.stat_2230931659",
    ["increased damage with poison per frenzy charge"] = "explicit.stat_1221011086",
    ["skills chain an additional time while at maximum frenzy charges"] = "explicit.stat_285624304",
    ["projectiles pierce an additional target while you have phasing"] = "explicit.stat_97250660",
    ["increased totem life per 10 strength allocated in radius"] = "explicit.stat_747037697",
    ["critical strikes do not always freeze"] = "explicit.stat_3979476531",
    ["minions gain unholy might for seconds on kill"] = "explicit.stat_3835570161",
    ["increased attack speed per 25 dexterity"] = "explicit.stat_2241560081",
    ["chance to trigger a socketed spell when you attack"] = "explicit.stat_209056835",
    ["chance to gain a frenzy charge on killing an enemy affected by at least 5 poisons"] = "explicit.stat_496822696",
    ["chance to gain a power charge on killing an enemy affected by fewer than 5 poisons"] = "explicit.stat_352612932",
    ["totems cannot be stunned"] = "explicit.stat_335735137",
    ["of physical damage leeched as life"] = "explicit.stat_3764265320",
    ["raging spirits' hits always ignite"] = "explicit.stat_3954637034",
    ["socketed gems are supported by level added lightning damage"] = "explicit.stat_1647529598",
    ["reduced maximum number of summoned raging spirits"] = "explicit.stat_1186934478",
    ["increased trap trigger area of effect"] = "explicit.stat_497716276",
    ["raging spirits refresh their duration when they kill an ignited enemy"] = "explicit.stat_2761732967",
    ["socketed curse gems have reduced mana reservation"] = "explicit.stat_1471600638",
    ["unaffected by desecrated ground"] = "explicit.stat_4004298002",
    ["to all maximum elemental resistances during flask effect"] = "explicit.stat_4026156644",
    ["increased movement speed if you have used a vaal skill recently"] = "explicit.stat_1285172810",
    ["of lightning damage converted to cold damage"] = "explicit.stat_2158060122",
    ["chance to gain a power charge on critical strike"] = "explicit.stat_3814876985",
    ["raging spirits have increased damage"] = "explicit.stat_2085855914",
    ["armour if you've blocked recently"] = "explicit.stat_4091848539",
    ["uses both hand slots"] = "explicit.stat_2846730569",
    ["your spells have chance to shock against frozen enemies"] = "explicit.stat_288651645",
    ["of elemental damage leeched as life"] = "explicit.stat_720395808",
    ["grants level death aura skill"] = "explicit.stat_825352061",
    ["recover life when you ignite an enemy"] = "explicit.stat_4045269075",
    ["chance to gain a power charge when you use a vaal skill"] = "explicit.stat_2383388829",
    ["gems can be socketed in this item ignoring socket colour"] = "explicit.stat_899329924",
    ["minions recover of their maximum life when they block"] = "explicit.stat_676967140",
    ["grants level lightning warp skill"] = "explicit.stat_243713911",
    ["socketed gems have reduced elemental equilibrium effect"] = "explicit.stat_1408019802",
    ["has no attribute requirements"] = "explicit.stat_2739148464",
    ["life gained for each enemy hit if you have used a vaal skill recently"] = "explicit.stat_3285021988",
    ["gems socketed in blue sockets gain increased experience"] = "explicit.stat_2236460050",
    ["adds to physical damage to attacks per level"] = "explicit.stat_3821472155",
    ["with at least 40 intelligence in radius, summon skeleton can summon up to skeleton mages"] = "explicit.stat_3088991881",
    ["increased minion duration per zombie you own"] = "explicit.stat_777246604",
    ["increased minion attack and cast speed per skeleton you own"] = "explicit.stat_729367217",
    ["increased minion damage per spectre you own"] = "explicit.stat_3191537057",
    ["socketed gems are supported by level additional accuracy"] = "explicit.stat_1567462963",
    ["you take reduced extra damage from critical strikes while you have no power charges"] = "explicit.stat_3544527742",
    ["1% increased rarity of items found per rampage kills"] = "explicit.stat_4260403588",
    ["gems socketed in green sockets have to quality"] = "explicit.stat_3799930101",
    ["with at least 40 strength in radius, increased rarity of items dropped by enemies shattered by glacial hammer"] = "explicit.stat_1250317014",
    ["gain of physical damage as extra chaos damage while at maximum power charges"] = "explicit.stat_3492297134",
    ["lose souls gained from soul eater when you use a flask"] = "explicit.stat_3577316952",
    ["gain soul eater during any flask effect"] = "explicit.stat_3968454273",
    ["increased herald of thunder buff effect"] = "explicit.stat_3814686091",
    ["gems socketed in red sockets have to level"] = "explicit.stat_2886998024",
    ["increased skeleton attack speed"] = "explicit.stat_3413085237",
    ["grants perfect agony during flask effect"] = "explicit.stat_3741365813",
    ["socketed gems are supported by level spell echo"] = "explicit.stat_913919528",
    ["take chaos damage per second during flask effect"] = "explicit.stat_308618188",
    ["socketed gems have reduced mana cost"] = "explicit.stat_2816901897",
    ["siege ballista has to maximum number of summoned totems per 200 dexterity"] = "explicit.stat_2125178364",
    ["adds to physical damage to attacks per 25 dexterity"] = "explicit.stat_2066426995",
    ["with at least 40 dexterity in radius, animate weapon can animate up to ranged weapons"] = "explicit.stat_3585572043",
    ["life regenerated per second per endurance charge"] = "explicit.stat_1898967950",
    ["socketed attacks have to critical strike chance"] = "explicit.stat_2867348718",
    ["increased duration of poisons you inflict during flask effect"] = "explicit.stat_510304734",
    ["spectres have a base duration of seconds spectres do not travel between areas"] = "explicit.stat_1210937073",
    ["spectres have increased critical strike chance"] = "explicit.stat_1862097882",
    ["you grant frenzy charges to allies on death"] = "explicit.stat_2105456174",
    ["strength per 1 strength on allocated passives in radius"] = "explicit.stat_552705983",
    ["to critical strike multiplier per 10 strength on unallocated passives in radius"] = "explicit.stat_1154827254",
    ["chance to poison on hit during flask effect"] = "explicit.stat_2777278657",
    ["you cannot be chilled for second after being chilled"] = "explicit.stat_2306924373",
    ["your critical strikes do not deal extra damage during flask effect"] = "explicit.stat_2893557981",
    ["curses in this item are reflected back to you"] = "explicit.stat_32859524",
    ["to level of socketed golem gems"] = "explicit.stat_3448743676",
    ["you cannot be ignited for second after being ignited"] = "explicit.stat_947072590",
    ["reduced mana cost of raise spectre"] = "explicit.stat_262301496",
    ["chance to gain a power charge on throwing a trap"] = "explicit.stat_1936544447",
    ["removes of life recovered from mana when used"] = "explicit.stat_648019518",
    ["chill enemies for second on hit with this weapon when in off hand"] = "explicit.stat_1488891279",
    ["adds to fire damage to attacks with this weapon per 10 strength"] = "explicit.stat_1060540099",
    ["with at least 40 intelligence in radius, cold snap grants power charges instead of frenzy charges when enemies die in its area with at least 40 intelligence in radius, cold snap's cooldown can be bypassed by power charges instead of frenzy charges"] = "explicit.stat_2560038623",
    ["grants level bear trap skill"] = "explicit.stat_3541114083",
    ["you cannot be shocked for second after being shocked"] = "explicit.stat_215346464",
    ["you cannot be frozen for second after being frozen"] = "explicit.stat_3612464552",
    ["bleeding enemies you kill explode, dealing of their maximum life as physical damage"] = "explicit.stat_3133323410",
    ["intelligence per 1 intelligence on allocated passives in radius"] = "explicit.stat_1070347065",
    ["gain maddening presence for 10 seconds when you kill a rare or unique enemy"] = "explicit.stat_3442107889",
    ["1 to maximum number of zombies per strength"] = "explicit.stat_4056985119",
    ["chance to block spell damage while on low life"] = "explicit.stat_2253286128",
    ["half of your strength is added to your minions"] = "explicit.stat_2195137717",
    ["with at least 1000 strength, of damage dealt by your zombies is leeched to you as life"] = "explicit.stat_2802263253",
    ["adds minimum cold damage to spells per power charge"] = "explicit.stat_3408048164",
    ["totems fire additional projectile"] = "explicit.stat_736847554",
    ["increased damage while shocked"] = "explicit.stat_529432426",
    ["deal no physical damage"] = "explicit.stat_3900877792",
    ["reduced chance to block attack and spell damage"] = "explicit.stat_4147897060",
    ["chance to gain a power charge on killing a frozen enemy"] = "explicit.stat_3607154250",
    ["increased movement speed while shocked"] = "explicit.stat_542923416",
    ["to accuracy rating per 10 intelligence on unallocated passives in radius"] = "explicit.stat_3996149330",
    ["shocks you cause are reflected back to you"] = "explicit.stat_807955413",
    ["enemies ignited by an attack burn faster"] = "explicit.stat_1420236871",
    ["chance to block attack damage"] = "explicit.stat_1702195217",
    ["of attack damage leeched as life against chilled enemies"] = "explicit.stat_748813744",
    ["additional chance to receive a critical strike"] = "explicit.stat_1437192935",
    ["cannot leech life"] = "explicit.stat_3769854701",
    ["increased duration of elemental ailments on enemies"] = "explicit.stat_2604619892",
    ["cannot gain power charges"] = "explicit.stat_2503253050",
    ["increased fire damage with hits and ailments against blinded enemies"] = "explicit.stat_1601181226",
    ["summoned skeletons take of their maximum life per second as fire damage"] = "explicit.stat_2912438397",
    ["you gain onslaught for seconds on kill"] = "explicit.stat_1195849808",
    ["1% increased armour per strength when in off hand"] = "explicit.stat_2192181096",
    ["reduced spell damage taken from blinded enemies"] = "explicit.stat_1165847826",
    ["grants level herald of thunder skill"] = "explicit.stat_1665492921",
    ["socketed gems are supported by level iron will"] = "explicit.stat_906997920",
    ["no chance to block"] = "explicit.stat_1023752508",
    ["1% increased damage per strength when in main hand"] = "explicit.stat_679194784",
    ["increases and reductions to other damage types in radius are transformed to apply to fire damage"] = "explicit.stat_3446950357",
    ["summoned skeletons have avatar of fire"] = "explicit.stat_1958210928",
    ["attacks with this weapon deal double damage to chilled enemies"] = "explicit.stat_625037258",
    ["your skills have no mana cost during flask effect"] = "explicit.stat_1669220541",
    ["increased mana recovery rate"] = "explicit.stat_3513180117",
    ["nearby allies recover of your maximum life when you die"] = "explicit.stat_3484267929",
    ["increased elemental damage if you've used a warcry recently"] = "explicit.stat_2803182108",
    ["increased movement speed if you've used a warcry recently"] = "explicit.stat_2546417825",
    ["increased effect of buffs on you"] = "explicit.stat_306104305",
    ["your aura buffs do not affect allies"] = "explicit.stat_4196775867",
    ["skills which place mines place up to 1 additional mine if you have at least 500 dexterity"] = "explicit.stat_1917661185",
    ["allies' aura buffs do not affect you"] = "explicit.stat_1489905076",
    ["warcries knock enemies back in an area"] = "explicit.stat_519622288",
    ["removes all but one life on use removed life is regenerated as energy shield over seconds"] = "explicit.stat_4120779321",
    ["skills which place mines place up to 1 additional mine if you have at least 500 intelligence"] = "explicit.stat_5955083",
    ["chance to create chilled ground when you freeze an enemy"] = "explicit.stat_2901262227",
    ["summoned skeletons have a chance to cover enemies in ash on hit"] = "explicit.stat_3074608753",
    ["chance to create consecrated ground when you shatter an enemy"] = "explicit.stat_4148932984",
    ["chaos damage does not bypass energy shield during effect"] = "explicit.stat_2229840047",
    ["grants level herald of ice skill"] = "explicit.stat_3846248551",
    ["increased duration of shrine effects on you"] = "explicit.stat_1877661946",
    ["increased effect of shrine buffs on you"] = "explicit.stat_1939175721",
    ["increased area of effect per 20 intelligence"] = "explicit.stat_1307972622",
    ["grants level decoy totem skill"] = "explicit.stat_3566242751",
    ["dexterity per 1 dexterity on allocated passives in radius"] = "explicit.stat_172076472",
    ["increased attack speed per 10 dexterity"] = "explicit.stat_889691035",
    ["increased physical weapon damage per 10 strength"] = "explicit.stat_2594215131",
    ["increased mine arming speed"] = "explicit.stat_3362665206",
    ["to maximum mana per 10 dexterity on unallocated passives in radius"] = "explicit.stat_1276712564",
    ["less mine damage"] = "explicit.stat_3298440988",
    ["increased cast speed per power charge"] = "explicit.stat_1604393896",
    ["mines can be detonated an additional time"] = "explicit.stat_325437053",
    ["mana regenerated per second per power charge"] = "explicit.stat_4084763463",
    ["curse enemies with level warlord's mark on hit"] = "explicit.stat_2021420128",
    ["reduced reflected physical damage taken"] = "explicit.stat_3158958938",
    ["sockets cannot be modified"] = "explicit.stat_3192592092",
    ["of damage is taken from mana before life"] = "explicit.stat_458438597",
    ["increased chaos damage per level"] = "explicit.stat_4084331136",
    ["lose all power charges on reaching maximum power charges"] = "explicit.stat_2135899247",
    ["projectiles gain of non-chaos damage as extra chaos damage per chain"] = "explicit.stat_1924041432",
    ["area is inhabited by animals"] = "explicit.stat_4198346809",
    ["increased damage if you have shocked an enemy recently"] = "explicit.stat_908650225",
    ["unaffected by shock"] = "explicit.stat_1473289174",
    ["to critical strike multiplier per power charge"] = "explicit.stat_4164870816",
    ["adds 1 to maximum life per intelligence allocated in radius"] = "explicit.stat_2865989731",
    ["adds to lightning damage to spells per power charge"] = "explicit.stat_4085417083",
    ["shocked enemies you kill explode, dealing of their maximum life as lightning damage which cannot shock"] = "explicit.stat_2706994884",
    ["critical strike chance per power charge"] = "explicit.stat_1818900806",
    ["consumes socketed support gems when they reach maximum level can consume support gem has not consumed any gems"] = "explicit.stat_3221550523",
    ["grants level abyssal cry skill"] = "explicit.stat_1271338211",
    ["area is inhabited by undead"] = "explicit.stat_808491979",
    ["lightning damage taken per second per power charge if your skills have dealt a critical strike recently"] = "explicit.stat_1964333391",
    ["with at least 40 intelligence in radius, of damage taken gained as mana over 4 seconds when hit during rallying cry for you and allies"] = "explicit.stat_847575654",
    ["area is inhabited by ranged monsters"] = "explicit.stat_645841425",
    ["socketed gems are supported by level lightning penetration"] = "explicit.stat_3354027870",
    ["area is inhabited by demons"] = "explicit.stat_3916182167",
    ["chance to shock attackers for 4 seconds on block"] = "explicit.stat_575111651",
    ["chance to block spell damage per power charge"] = "explicit.stat_816458107",
    ["reduced enemy stun threshold during any flask effect"] = "explicit.stat_4228951304",
    ["area is inhabited by humanoids"] = "explicit.stat_2651141461",
    ["increased attack damage per 450 evasion rating"] = "explicit.stat_93696421",
    ["area is inhabited by goatmen"] = "explicit.stat_1813544255",
    ["1% increased attack damage per 300 of the lowest of armour and evasion rating"] = "explicit.stat_1358422215",
    ["with at least 40 dexterity in radius, burning arrow has a chance to spread tar if it does not ignite an enemy"] = "explicit.stat_968694760",
    ["place an additional mine"] = "explicit.stat_2395088636",
    ["reflects lightning damage to attackers on block"] = "explicit.stat_1810011556",
    ["increased minion movement speed per 50 dexterity"] = "explicit.stat_4017879067",
    ["with 40 intelligence in radius, of glacial cascade physical damage converted to cold damage"] = "explicit.stat_1478305007",
    ["increased damage for each magic item equipped"] = "explicit.stat_886366428",
    ["socketed gems are supported by level less duration"] = "explicit.stat_2487643588",
    ["with at least 40 dexterity in radius, burning arrow has a chance to spread burning ground if it ignites an enemy"] = "explicit.stat_2222938936",
    ["with 40 intelligence in radius, glacial cascade has an additional burst"] = "explicit.stat_1367987042",
    ["increased minion attack speed per 50 dexterity"] = "explicit.stat_4047895119",
    ["minions' hits can only kill ignited enemies"] = "explicit.stat_1736403946",
    ["elemental resistances are zero"] = "explicit.stat_85576425",
    ["you have onslaught while you have fortify"] = "explicit.stat_1493590317",
    ["all attack damage chills when you stun"] = "explicit.stat_2437193018",
    ["with at least 40 strength in radius, vigilant strike fortifies you and nearby allies for seconds"] = "explicit.stat_530280833",
    ["increased effect of chilled ground"] = "explicit.stat_2134166669",
    ["you have no armour or maximum energy shield"] = "explicit.stat_3591359751",
    ["to all maximum resistances while you have no endurance charges"] = "explicit.stat_3635566977",
    ["cannot knock enemies back"] = "explicit.stat_2095084973",
    ["socketed gems are supported by level generosity"] = "explicit.stat_2593773031",
    ["you have onslaught while at maximum endurance charges"] = "explicit.stat_3101915418",
    ["area is inhabited by sea witches and their spawn"] = "explicit.stat_25085466",
    ["chance to trigger level 1 create lesser shrine when you kill an enemy"] = "explicit.stat_1010340836",
    ["chance to chill attackers for 4 seconds on block"] = "explicit.stat_864879045",
    ["increases and reductions to spell damage also apply to attacks"] = "explicit.stat_3811649872",
    ["recover of maximum life when you use a mana flask"] = "explicit.stat_1926816773",
    ["chance to freeze during any flask effect"] = "explicit.stat_2332726055",
    ["culling strike against enemies cursed with poacher's mark"] = "explicit.stat_2114080270",
    ["chance to trigger a socketed warcry skill when you lose endurance charges"] = "explicit.stat_1112135314",
    ["non-instant mana recovery from flasks is also recovered as life"] = "explicit.stat_2262007777",
    ["take physical damage when you use a movement skill"] = "explicit.stat_2590715472",
    ["socketed gems are supported by level pierce"] = "explicit.stat_254728692",
    ["enemy projectiles pierce you"] = "explicit.stat_1457679290",
    ["socketed gems are supported by level cast on critical strike"] = "explicit.stat_2325632050",
    ["to level of socketed herald gems"] = "explicit.stat_1344805487",
    ["light radius is based on energy shield instead of life"] = "explicit.stat_3836017971",
    ["mana reservation of herald skills is always 45%"] = "explicit.stat_262773569",
    ["you lose all endurance charges at maximum endurance charges"] = "explicit.stat_3590104875",
    ["trigger level fog of war when your trap is triggered"] = "explicit.stat_208447205",
    ["of elemental damage from hits taken as chaos damage"] = "explicit.stat_1175213674",
    ["increased mana cost of skills for each 200 total mana you have spent recently"] = "explicit.stat_2650053239",
    ["35% chance to avoid being stunned for each herald skill affecting you"] = "explicit.stat_1493090598",
    ["curse enemies with level poacher's mark on hit, which can apply to hexproof enemies"] = "explicit.stat_364728407",
    ["cannot block"] = "explicit.stat_4127720801",
    ["area is inhabited by abominations"] = "explicit.stat_2961018200",
    ["increased area of effect per 25 rampage kills"] = "explicit.stat_4119032338",
    ["increased movement speed while phasing"] = "explicit.stat_3684879618",
    ["increased intelligence for each unique item equipped"] = "explicit.stat_4207939995",
    ["reserves of life"] = "explicit.stat_2492660287",
    ["cannot be used with chaos inoculation"] = "explicit.stat_623651254",
    ["chance to shock during any flask effect"] = "explicit.stat_796406325",
    ["adds to lightning damage for each shocked enemy you've killed recently"] = "explicit.stat_4222857095",
    ["you lose of energy shield per second"] = "explicit.stat_2350411833",
    ["you cannot recharge energy shield"] = "explicit.stat_4164247992",
    ["you cannot regenerate energy shield"] = "explicit.stat_1052583507",
    ["of damage leeched as life against shocked enemies"] = "explicit.stat_2614321687",
    ["gain of maximum life as extra maximum energy shield"] = "explicit.stat_67280387",
    ["increased spell damage for each 200 total mana you have spent recently, up to 2000%"] = "explicit.stat_347220474",
    ["shock reflection"] = "explicit.stat_3291999509",
    ["life leech is applied to energy shield instead while on full life"] = "explicit.stat_990335387",
    ["increased attack critical strike chance per 200 accuracy rating"] = "explicit.stat_2196695640",
    ["gain a frenzy charge on every 50th rampage kill"] = "explicit.stat_637690626",
    ["additional chance for slain monsters to drop scrolls of wisdom"] = "explicit.stat_2920230984",
    ["chance to gain an endurance charge on kill"] = "explicit.stat_1054322244",
    ["with 40 total intelligence and dexterity in radius, elemental hit deals 50% less fire damage"] = "explicit.stat_1813069390",
    ["with 40 total intelligence and dexterity in radius, elemental hit cannot choose fire"] = "explicit.stat_63111803",
    ["increased quantity of items dropped by slain frozen enemies"] = "explicit.stat_3304763863",
    ["global critical strike multiplier while you have no frenzy charges"] = "explicit.stat_3062763405",
    ["lightning damage from enemies hitting you is lucky"] = "explicit.stat_4224965099",
    ["increased area of effect for attacks"] = "explicit.stat_1840985759",
    ["increased rarity of items dropped by slain shocked enemies"] = "explicit.stat_3188291252",
    ["to accuracy rating while at maximum frenzy charges"] = "explicit.stat_3213407110",
    ["enemies frozen by you take 20% increased damage"] = "explicit.stat_849085925",
    ["chance to avoid being shocked while chilled"] = "explicit.stat_3981960937",
    ["socketed gems are supported by level increased duration"] = "explicit.stat_407317553",
    ["chance to ignite during any flask effect"] = "explicit.stat_3888064854",
    ["chance to block attack damage if there are at least 5 nearby enemies"] = "explicit.stat_1214532298",
    ["knockback direction is reversed"] = "explicit.stat_281201999",
    ["area is inhabited by lunaris fanatics"] = "explicit.stat_3134632618",
    ["nearby allies' damage with hits is lucky"] = "explicit.stat_655871604",
    ["to elemental resistances during flask effect"] = "explicit.stat_3110554274",
    ["grants level blight skill"] = "explicit.stat_1198418726",
    ["area is inhabited by ghosts"] = "explicit.stat_3516340048",
    ["blight has increased hinder duration"] = "explicit.stat_4170725899",
    ["attacks with this weapon penetrate elemental resistances"] = "explicit.stat_4064396395",
    ["area is inhabited by solaris fanatics"] = "explicit.stat_2457517302",
    ["bleeding you inflict is reflected to you"] = "explicit.stat_2658399404",
    ["grants level scorching ray skill"] = "explicit.stat_1540840",
    ["increased scorching ray beam length"] = "explicit.stat_702909553",
    ["cannot be blinded"] = "explicit.stat_1436284579",
    ["increased melee damage during any flask effect"] = "explicit.stat_4091369450",
    ["you cannot be hindered"] = "explicit.stat_721014846",
    ["to chaos resistance per poison on you"] = "explicit.stat_175362265",
    ["increased bleeding duration per 12 intelligence"] = "explicit.stat_1030835421",
    ["chance to cause bleeding enemies to flee on hit"] = "explicit.stat_2072206041",
    ["increased physical damage over time per 10 dexterity"] = "explicit.stat_555311393",
    ["chance for traps to trigger an additional time"] = "explicit.stat_1087710344",
    ["socketed gems are supported by level knockback"] = "explicit.stat_4066711249",
    ["poison you inflict is reflected to you"] = "explicit.stat_2374357674",
    ["adds to fire attack damage per buff on you"] = "explicit.stat_761505024",
    ["recover of your maximum life at the end of the flask effect"] = "explicit.stat_4078194486",
    ["increased armour while bleeding"] = "explicit.stat_2466912132",
    ["you gain onslaught for seconds on using a vaal skill"] = "explicit.stat_2654043939",
    ["socketed gems are supported by level efficacy"] = "explicit.stat_3924539382",
    ["to level of socketed vaal gems"] = "explicit.stat_1170386874",
    ["adds to fire spell damage per buff on you"] = "explicit.stat_3434279150",
    ["increased projectile attack damage during any flask effect"] = "explicit.stat_2771016039",
    ["chance to shock chilled enemies"] = "explicit.stat_4069101408",
    ["with 40 total dexterity and strength in radius, elemental hit cannot choose lightning"] = "explicit.stat_637033100",
    ["with 40 total dexterity and strength in radius, elemental hit deals 50% less lightning damage"] = "explicit.stat_2053992416",
    ["gain of physical attack damage as extra lightning damage"] = "explicit.stat_1096897481",
    ["area is inhabited by cultists of kitava"] = "explicit.stat_4252630904",
    ["your curses can apply to hexproof enemies"] = "explicit.stat_1367119630",
    ["of damage leeched as mana against frozen enemies"] = "explicit.stat_2908111053",
    ["increased projectile damage per power charge"] = "explicit.stat_3816512110",
    ["increased projectile speed per frenzy charge"] = "explicit.stat_3159161267",
    ["your hits can't be evaded"] = "explicit.stat_1165023334",
    ["adds to cold damage to counterattacks"] = "explicit.stat_1109700751",
    ["increased projectile attack damage"] = "explicit.stat_2162876159",
    ["increased damage with hits and ailments against hindered enemies"] = "explicit.stat_528422616",
    ["chance to avoid being frozen during flask effect"] = "explicit.stat_2872815301",
    ["iron will"] = "explicit.stat_4092697134",
    ["of physical damage from hits taken as cold damage during flask effect"] = "explicit.stat_625682777",
    ["nearby enemies are hindered, with reduced movement speed"] = "explicit.stat_607839150",
    ["zealot's oath"] = "explicit.stat_632761194",
    ["gain of physical damage as extra cold damage during effect"] = "explicit.stat_2661163721",
    ["chance to avoid being chilled during flask effect"] = "explicit.stat_1053326368",
    ["increased critical strike chance with arrows that fork"] = "explicit.stat_4169623196",
    ["increased burning damage if you've ignited an enemy recently"] = "explicit.stat_3919557483",
    ["maximum energy shield per 5 strength"] = "explicit.stat_3788706881",
    ["mana gained on killing a frozen enemy"] = "explicit.stat_3304801725",
    ["increased melee physical damage against ignited enemies"] = "explicit.stat_1332534089",
    ["with 40 total strength and intelligence in radius, elemental hit cannot choose cold"] = "explicit.stat_2864618930",
    ["mind over matter"] = "explicit.stat_373964381",
    ["chance to block spell damage while on low life"] = "explicit.stat_4070519133",
    ["with 40 total strength and intelligence in radius, elemental hit deals 50% less cold damage"] = "explicit.stat_3286480398",
    ["increased duration of ailments on enemies"] = "explicit.stat_2419712247",
    ["passives in radius can be allocated without being connected to your tree"] = "explicit.stat_4077035099",
    ["energy shield gained on killing a shocked enemy"] = "explicit.stat_347328113",
    ["adds to lightning damage to unarmed attacks"] = "explicit.stat_458002333",
    ["adds to lightning damage to spells while unarmed"] = "explicit.stat_3597806437",
    ["recover of maximum life when you ignite an enemy"] = "explicit.stat_3112776239",
    ["your chaos damage has chance to poison enemies"] = "explicit.stat_2894297982",
    ["monsters gain endurance charge every 20 seconds"] = "explicit.stat_622678123",
    ["skills which throw traps throw up to 1 additional trap"] = "explicit.stat_1220800126",
    ["attacks have blood magic"] = "explicit.stat_3358745905",
    ["increased elemental damage per grand spectrum"] = "explicit.stat_3163738488",
    ["grants level blood offering skill"] = "explicit.stat_3985468650",
    ["chance to block attack damage while dual wielding claws"] = "explicit.stat_2538694749",
    ["monsters gain power charge every 20 seconds"] = "explicit.stat_70389693",
    ["socketed attacks have to critical strike multiplier"] = "explicit.stat_356456977",
    ["dexterity and intelligence from passives in radius count towards strength melee damage bonus"] = "explicit.stat_842363566",
    ["trigger socketed spells when you spend at least mana to use a skill"] = "explicit.stat_723388324",
    ["your critical strikes do not deal extra damage"] = "explicit.stat_4058681894",
    ["life leech is applied to energy shield instead"] = "explicit.stat_3346092312",
    ["gain armour equal to your reserved mana"] = "explicit.stat_3451369192",
    ["gain unholy might for 2 seconds on critical strike"] = "explicit.stat_2763710567",
    ["chance to gain a power charge when you stun"] = "explicit.stat_3470535775",
    ["socketed movement skills have no mana cost"] = "explicit.stat_3263216405",
    ["skills fire an additional projectile during flask effect"] = "explicit.stat_323705912",
    ["increased cast speed during any flask effect"] = "explicit.stat_252194507",
    ["cannot leech mana"] = "explicit.stat_1759630226",
    ["melee and melee weapon type modifiers in radius are transformed to bow modifiers"] = "explicit.stat_854030602",
    ["insufficient mana doesn't prevent your melee attacks"] = "explicit.stat_1852317988",
    ["gain unholy might for second on rampage"] = "explicit.stat_757315075",
    ["gain an endurance, frenzy or power charge when you block"] = "explicit.stat_2199099676",
    ["increased area of effect during flask effect"] = "explicit.stat_215882879",
    ["increased damage with hits and ailments against blinded enemies"] = "explicit.stat_3503466234",
    ["chance to create a smoke cloud when hit"] = "explicit.stat_953314356",
    ["creates a smoke cloud on rampage"] = "explicit.stat_3321583955",
    ["increased lightning damage per 10 intelligence"] = "explicit.stat_990219738",
    ["adds to cold damage to attacks with this weapon per 10 dexterity"] = "explicit.stat_149574107",
    ["shocks you when you reach maximum power charges"] = "explicit.stat_4256314560",
    ["chance to gain a power charge on hit"] = "explicit.stat_1453197917",
    ["to cold damage per frenzy charge"] = "explicit.stat_3648858570",
    ["increased intelligence requirement"] = "explicit.stat_18234720",
    ["increased projectile attack damage per 200 accuracy rating"] = "explicit.stat_4157767905",
    ["evasion rating is increased by uncapped cold resistance"] = "explicit.stat_3521117619",
    ["mana gained for each enemy hit by your spells"] = "explicit.stat_2474196346",
    ["socketed gems are supported by level onslaught"] = "explicit.stat_3237923082",
    ["socketed gems are supported by level volley"] = "explicit.stat_2696557965",
    ["increased maximum life if no equipped items are corrupted"] = "explicit.stat_2217962305",
    ["regenerate life per second if no equipped items are corrupted"] = "explicit.stat_2497198283",
    ["chance to be inflicted with bleeding when hit by an attack"] = "explicit.stat_2155467472",
    ["recover of your maximum life when you block"] = "explicit.stat_2442647190",
    ["your physical damage can chill"] = "explicit.stat_2227042420",
    ["while at maximum frenzy charges, attacks poison enemies"] = "explicit.stat_413362507",
    ["chill effect and freeze duration on you are based on of energy shield"] = "explicit.stat_1194648995",
    ["to chaos resistance per endurance charge"] = "explicit.stat_4210011075",
    ["recover of your maximum life on rampage"] = "explicit.stat_2737492258",
    ["chance to poison on hit against cursed enemies"] = "explicit.stat_2208857094",
    ["your elemental damage can shock"] = "explicit.stat_2933625540",
    ["increased movement speed while bleeding"] = "explicit.stat_696659555",
    ["increased damage per power charge"] = "explicit.stat_2034658008",
    ["chance to curse enemies with socketed curse gem on hit"] = "explicit.stat_1352418057",
    ["adds to lightning damage to hits against ignited enemies"] = "explicit.stat_2870108850",
    ["attacks have chance to maim on hit"] = "explicit.stat_1510714129",
    ["applies level 15 temporal chains on blocking a projectile attack, ignoring curse limit"] = "explicit.stat_541329769",
    ["fire damage taken per second per endurance charge if you've been hit recently"] = "explicit.stat_1920234902",
    ["increased burning damage for each time you have shocked a non-shocked enemy recently"] = "explicit.stat_1607849541",
    ["of attack damage leeched as mana per power charge"] = "explicit.stat_2628721358",
    ["reduced elemental damage taken when hit per endurance charge"] = "explicit.stat_1686913105",
    ["adds to physical damage per endurance charge"] = "explicit.stat_173438493",
    ["your lightning damage can ignite"] = "explicit.stat_3121133045",
    ["applies level 15 punishment on blocking a melee attack, ignoring curse limit"] = "explicit.stat_2922377850",
    ["chance to gain an additional vaal soul on kill"] = "explicit.stat_1962922582",
    ["applies level 15 elemental weakness on blocking a spell, ignoring curse limit"] = "explicit.stat_2048643052",
    ["increased damage if you summoned a golem in the past 8 seconds"] = "explicit.stat_3384291300",
    ["your golems are aggressive"] = "explicit.stat_3630426972",
    ["to armour per endurance charge"] = "explicit.stat_513221334",
    ["of lightning damage leeched as mana during flask effect"] = "explicit.stat_1454377049",
    ["golems have increased maximum life"] = "explicit.stat_1750735210",
    ["your chaos damage poisons enemies"] = "explicit.stat_3549040753",
    ["increased rarity of items dropped by enemies killed with a critical strike"] = "explicit.stat_21824003",
    ["golems summoned in the past 8 seconds deal increased damage"] = "explicit.stat_2869193493",
    ["armour is increased by uncapped fire resistance"] = "explicit.stat_713266390",
    ["socketed gems are supported by level cast when damage taken"] = "explicit.stat_3036440332",
    ["to quality of socketed support gems"] = "explicit.stat_1328548975",
    ["grants last breath when you use a skill during flask effect, for of mana cost"] = "explicit.stat_3686711832",
    ["you gain onslaught for seconds on critical strike"] = "explicit.stat_1055188639",
    ["reduced ignite duration on you"] = "explicit.stat_986397080",
    ["you gain phasing for seconds on using a vaal skill"] = "explicit.stat_4089413281",
    ["point blank"] = "explicit.stat_2896346114",
    ["skills fire an additional projectile if you've been hit recently"] = "explicit.stat_988207959",
    ["increased armour while stationary"] = "explicit.stat_3184053924",
    ["increased flask charges gained during any flask effect"] = "explicit.stat_662803072",
    ["recover of energy shield when you block"] = "explicit.stat_1606263610",
    ["iron reflexes while stationary"] = "explicit.stat_187998220",
    ["take fire damage when you ignite an enemy"] = "explicit.stat_2518598473",
    ["increased elemental damage per sextant affecting the area"] = "explicit.stat_1669135888",
    ["adds to fire damage against ignited enemies"] = "explicit.stat_794830148",
    ["of life regenerated per second on chilled ground"] = "explicit.stat_710105516",
    ["increased damage on burning ground"] = "explicit.stat_3098087057",
    ["increased movement speed on shocked ground"] = "explicit.stat_3678841229",
    ["increased damage per 1% chance to block attack damage"] = "explicit.stat_3400437584",
    ["deals chaos damage per second to nearby enemies"] = "explicit.stat_2280313599",
    ["socketed gems are supported by level lesser multiple projectiles"] = "explicit.stat_584144941",
    ["cold damage taken per second per frenzy charge while moving"] = "explicit.stat_1528823952",
    ["of attack damage leeched as life per frenzy charge"] = "explicit.stat_3243062554",
    ["chance to avoid elemental damage when hit per frenzy charge"] = "explicit.stat_1649883131",
    ["chance to avoid projectiles"] = "explicit.stat_3452269808",
    ["gain mana per grand spectrum"] = "explicit.stat_2592799343",
    ["armour while you do not have avatar of fire"] = "explicit.stat_4078952782",
    ["of physical damage converted to fire while you have avatar of fire"] = "explicit.stat_2052379536",
    ["every 8 seconds, gain avatar of fire for 4 seconds"] = "explicit.stat_3345955207",
    ["grants malachai's endurance, frenzy and power for 6 seconds each, in sequence"] = "explicit.stat_2918150296",
    ["increased area of effect per enemy killed recently, up to 50%"] = "explicit.stat_4070157876",
    ["increased critical strike chance while you have avatar of fire"] = "explicit.stat_2815652613",
    ["you have zealot's oath if you haven't been hit recently"] = "explicit.stat_2391255504",
    ["recover of your maximum mana when you block"] = "explicit.stat_3041288981",
    ["to maximum energy shield per 5 armour on equipped shield"] = "explicit.stat_3636098185",
    ["to armour per 5 evasion rating on equipped shield"] = "explicit.stat_3088183606",
    ["to level of socketed warcry gems"] = "explicit.stat_1672793731",
    ["grants level doryani's touch skill"] = "explicit.stat_2498303876",
    ["to evasion rating per 5 maximum energy shield on equipped shield"] = "explicit.stat_1115914670",
    ["of spell damage leeched as life if equipped shield has at least 30% chance to block"] = "explicit.stat_3893109186",
    ["trigger socketed minion spells on kill with this weapon"] = "explicit.stat_2816098341",
    ["your physical damage can shock"] = "explicit.stat_3848047105",
    ["increased rarity of items found with a normal item equipped"] = "explicit.stat_4151190513",
    ["deal no elemental damage"] = "explicit.stat_2998305364",
    ["increased quantity of items found with a magic item equipped"] = "explicit.stat_1498954300",
    ["strength's damage bonus instead grants 3% increased melee physical damage per 10 strength"] = "explicit.stat_1531241759",
    ["enemies you shock have reduced movement speed"] = "explicit.stat_3134790305",
    ["enemies you shock have reduced cast speed"] = "explicit.stat_4107150355",
    ["minions deal increased damage per 10 dexterity"] = "explicit.stat_2238471448",
    ["increased vaal skill critical strike chance"] = "explicit.stat_3165492062",
    ["take no extra damage from critical strikes"] = "explicit.stat_4294267596",
    ["gain armour per grand spectrum"] = "explicit.stat_1166487805",
    ["chance for energy shield recharge to start when you use a skill"] = "explicit.stat_3853996752",
    ["trigger level feast of flesh every 5 seconds"] = "explicit.stat_1024189516",
    ["socketed melee gems have increased area of effect"] = "explicit.stat_2462976337",
    ["socketed red gems get physical damage as extra fire damage"] = "explicit.stat_2629366488",
    ["enemies ignited by you during flask effect take increased damage"] = "explicit.stat_3477833022",
    ["increased lightning damage with attack skills"] = "explicit.stat_4208907162",
    ["recover of energy shield when you kill an enemy during flask effect"] = "explicit.stat_2347201221",
    ["recover of mana when you kill an enemy during flask effect"] = "explicit.stat_3247931236",
    ["chance to evade attacks"] = "explicit.stat_2021058489",
    ["traps trigger at the end of their duration"] = "explicit.stat_2292445516",
    ["of fire damage leeched as life while ignited"] = "explicit.stat_3633399302",
    ["with 4 notables allocated in radius, when you kill a rare monster, you gain of its modifiers for 20 seconds"] = "explicit.stat_3807518091",
    ["recharges charge when you consume an ignited corpse"] = "explicit.stat_2557247391",
    ["your skills deal you of mana spent on skill mana costs as physical damage"] = "explicit.stat_99487834",
    ["critical strike chance is increased by lightning resistance"] = "explicit.stat_2155513095",
    ["recover of life when you kill an enemy during flask effect"] = "explicit.stat_1217476473",
    ["trigger level lightning bolt when you deal a critical strike"] = "explicit.stat_3241494164",
    ["eldritch battery"] = "explicit.stat_2262736444",
    ["trigger a socketed lightning spell on hit socketed lightning spells deal 100% increased spell damage if triggered"] = "explicit.stat_654971543",
    ["skills fire an additional projectile if you've used a movement skill recently"] = "explicit.stat_2809802678",
    ["damage penetrates cold resistance"] = "explicit.stat_3417711605",
    ["cannot block spells"] = "explicit.stat_4076910393",
    ["chance to gain a frenzy charge when you block"] = "explicit.stat_3769211656",
    ["chance to block attack damage while on consecrated ground"] = "explicit.stat_3865999868",
    ["increased damage while on consecrated ground"] = "explicit.stat_1704905020",
    ["trigger level consecrate when you deal a critical strike"] = "explicit.stat_899293871",
    ["increased movement speed if you haven't been hit recently"] = "explicit.stat_308396001",
    ["chaos skills have increased skill effect duration"] = "explicit.stat_289885185",
    ["increased critical strike chance against shocked enemies"] = "explicit.stat_276103140",
    ["chance to trigger level 20 animate guardian's weapon when animated guardian kills an enemy"] = "explicit.stat_3682009780",
    ["animated minions' melee attacks deal less damage to surrounding targets"] = "explicit.stat_478698670",
    ["animated minions' melee attacks deal splash damage to surrounding targets"] = "explicit.stat_91242932",
    ["kills grant an additional vaal soul if you have rampaged recently"] = "explicit.stat_3271016161",
    ["animated guardian deals increased damage per animated weapon"] = "explicit.stat_759294825",
    ["you cannot have non-animated minions"] = "explicit.stat_1220105149",
    ["chance to trigger level 18 animate guardian's weapon when animated weapon kills an enemy"] = "explicit.stat_919960234",
    ["chance to dodge attack hits if you have blocked recently"] = "explicit.stat_811582994",
    ["with at least 40 intelligence in radius, fireball projectiles gain area as they travel farther, up to increased area of effect"] = "explicit.stat_24977021",
    ["increased evasion rating if you have been hit recently"] = "explicit.stat_1073310669",
    ["increased critical strike chance against chilled enemies"] = "explicit.stat_3699490848",
    ["trigger a socketed cold spell on melee critical strike"] = "explicit.stat_2295303426",
    ["adds to cold damage against chilled enemies"] = "explicit.stat_3734640451",
    ["less damage taken if you have not been hit recently"] = "explicit.stat_67637087",
    ["increased movement speed during any flask effect"] = "explicit.stat_304970526",
    ["socketed gems are supported by level blood magic"] = "explicit.stat_3922006600",
    ["enemies you attack reflect physical damage to you"] = "explicit.stat_2006370586",
    ["socketed gems are supported by level elemental focus"] = "explicit.stat_1169422227",
    ["players are cursed with flammability"] = "explicit.stat_989228672",
    ["socketed gems are supported by level fire penetration"] = "explicit.stat_1979658770",
    ["players are cursed with frostbite"] = "explicit.stat_3442976749",
    ["maximum void charges"] = "explicit.stat_1209237645",
    ["adds to physical damage against bleeding enemies"] = "explicit.stat_1244003614",
    ["socketed gems are supported by level endurance charge on melee stun"] = "explicit.stat_3375208082",
    ["increased skeleton cast speed"] = "explicit.stat_2725259389",
    ["gain a void charge every second"] = "explicit.stat_3712145967",
    ["consumes a void charge to trigger level void shot when you fire arrows"] = "explicit.stat_3262369040",
    ["every 16 seconds you gain elemental overload for 8 seconds"] = "explicit.stat_708913352",
    ["curse enemies with level poacher's mark on hit"] = "explicit.stat_2659463225",
    ["socketed gems have more attack and cast speed"] = "explicit.stat_346351023",
    ["increased skeleton movement speed"] = "explicit.stat_3295031203",
    ["while your passive skill tree connects to a class' starting location, you gain: marauder: melee skills have increased area of effect duelist: of attack damage leeched as life ranger: increased movement speed shadow: to critical strike chance witch: of maximum mana regenerated per second templar: damage penetrates elemental resistances scion: to all attributes"] = "explicit.stat_769192511",
    ["gain of maximum mana as extra maximum energy shield"] = "explicit.stat_2663376056",
    ["triggers level fire aegis when equipped"] = "explicit.stat_1128763150",
    ["you have resolute technique while you do not have elemental overload"] = "explicit.stat_2905429068",
    ["melee attacks have chance to cause bleeding"] = "explicit.stat_1285056331",
    ["enemies you inflict bleeding on grant increased flask charges"] = "explicit.stat_2671550669",
    ["melee attacks have chance to poison on hit"] = "explicit.stat_33065250",
    ["increased area of effect for skills used by totems"] = "explicit.stat_869436347",
    ["chance to inflict bleeding on critical strike with attacks"] = "explicit.stat_2054257693",
    ["chance to cover enemies in ash when they hit you"] = "explicit.stat_3748879662",
    ["socketed gems are supported by level power charge on critical strike"] = "explicit.stat_4015918489",
    ["projectile attack skills have increased critical strike chance"] = "explicit.stat_4095169720",
    ["chance to maim enemies on critical strike with attacks"] = "explicit.stat_996483959",
    ["of physical damage converted to lightning during flask effect"] = "explicit.stat_660386148",
    ["gain of weapon physical damage as extra damage of each element"] = "explicit.stat_3913265126",
    ["chance to gain an additional vaal soul per enemy shattered"] = "explicit.stat_1633381214",
    ["to evasion rating and energy shield"] = "explicit.stat_1549868759",
    ["triggers level cold aegis when equipped"] = "explicit.stat_3918947537",
    ["increased armour against projectiles"] = "explicit.stat_706246936",
    ["skills used by traps have increased area of effect"] = "explicit.stat_4050593908",
    ["shared suffering"] = "explicit.stat_956038713",
    ["grants level 20 summon bestial rhoa skill"] = "explicit.stat_2878779644",
    ["replenishes energy shield by of armour when you block"] = "explicit.stat_3681057026",
    ["ignites your skills cause spread to other enemies within a radius of #"] = "explicit.stat_3281591194",
    ["socketed gems are supported by level vicious projectiles"] = "explicit.stat_2513293614",
    ["increased fire damage with hits and ailments against bleeding enemies"] = "explicit.stat_3703926412",
    ["increased physical damage with hits and ailments against ignited enemies"] = "explicit.stat_3375415245",
    ["socketed gems are supported by level cast when stunned"] = "explicit.stat_1079148723",
    ["adds to lightning damage to attacks during flask effect"] = "explicit.stat_4292531291",
    ["increased warcry buff effect"] = "explicit.stat_3037553757",
    ["bleeding cannot be inflicted on you"] = "explicit.stat_1901158930",
    ["gain onslaught for seconds when you warcry"] = "explicit.stat_3049436415",
    ["to added fire damage against burning enemies"] = "explicit.stat_165402179",
    ["of damage dealt by your totems is leeched to you as life"] = "explicit.stat_3812562802",
    ["increased attack damage for each map item modifier affecting the area"] = "explicit.stat_698336758",
    ["enemies chilled by you take increased burning damage"] = "explicit.stat_2050904614",
    ["chance that if you would gain power charges, you instead gain up to your maximum number of power charges"] = "explicit.stat_1232004574",
    ["increased attack speed for each map item modifier affecting the area"] = "explicit.stat_2025297472",
    ["chance to trigger level 20 arcane wake after spending a total of 200 mana"] = "explicit.stat_3344568504",
    ["attacks with this weapon deal double damage"] = "explicit.stat_1506185293",
    ["grants level enduring cry skill"] = "explicit.stat_1031644844",
    ["chance to be shocked"] = "explicit.stat_3206652215",
    ["of lightning damage is taken from mana before life when hit"] = "explicit.stat_2477735984",
    ["adds to lightning damage to spells during flask effect"] = "explicit.stat_4108305628",
    ["poisonous hit"] = "explicit.stat_4075957192",
    ["monster lightning resistance"] = "explicit.stat_162742068",
    ["monster mana leech resistance"] = "explicit.stat_918170065",
    ["chance to trigger level 20 shade form when you use a socketed skill"] = "explicit.stat_3308936917",
    ["increased maximum life per abyss jewel affecting you"] = "explicit.stat_3185671537",
    ["cannot leech life from monsters"] = "explicit.stat_526251910",
    ["counts as all one handed melee weapon types"] = "explicit.stat_1524882321",
    ["arrows that pierce have to critical strike multiplier"] = "explicit.stat_1064778484",
    ["of maximum life regenerated per second per endurance charge"] = "explicit.stat_989800292",
    ["increased maximum mana per abyss jewel affecting you"] = "explicit.stat_2135370196",
    ["recover of maximum mana when you shock an enemy"] = "explicit.stat_2524029637",
    ["arrows pierce all targets after forking"] = "explicit.stat_2138799639",
    ["grants level rallying cry skill"] = "explicit.stat_2007746338",
    ["increased vaal skill effect duration"] = "explicit.stat_547412107",
    ["socketed gems are supported by level elemental penetration"] = "explicit.stat_1994143317",
    ["grants level herald of ash skill"] = "explicit.stat_3880462354",
    ["chance to gain an endurance charge on critical strike"] = "explicit.stat_2542650946",
    ["increased attack speed during any flask effect"] = "explicit.stat_1365052901",
    ["minions have chance to poison enemies on hit"] = "explicit.stat_1974445926",
    ["chance to gain arcane surge when you deal a critical strike"] = "explicit.stat_446027070",
    ["your raised spectres also gain arcane surge when you do"] = "explicit.stat_3462113315",
    ["hits with this weapon have culling strike against bleeding enemies"] = "explicit.stat_2558253923",
    ["spectres have increased maximum life"] = "explicit.stat_3035514623",
    ["of maximum life converted to energy shield"] = "explicit.stat_2458962764",
    ["removes of mana recovered from life when used"] = "explicit.stat_959641748",
    ["increased damage with hits and ailments against chilled enemies"] = "explicit.stat_3747189159",
    ["gain power charges when you warcry"] = "explicit.stat_4118945608",
    ["increased mana recovered"] = "explicit.stat_1811130680",
    ["additional physical damage reduction while moving"] = "explicit.stat_2713357573",
    ["focus has increased cooldown recovery speed"] = "explicit.stat_3610263531",
    ["gain an endurance charge every 4 seconds while stationary"] = "explicit.stat_2156210979",
    ["dexterity requirement"] = "explicit.stat_1133453872",
    ["projectiles deal increased damage for each enemy pierced"] = "explicit.stat_883169830",
    ["increased critical strike chance for spells per raised spectre"] = "explicit.stat_495095219",
    ["grants level petrification statue skill"] = "explicit.stat_1904419785",
    ["socketed gems are supported by level cast while channelling"] = "explicit.stat_1316646496",
    ["grants level discipline skill"] = "explicit.stat_2341269061",
    ["reduced elemental damage taken while stationary"] = "explicit.stat_983989924",
    ["maximum mana per level"] = "explicit.stat_2563691316",
    ["grants level haste skill"] = "explicit.stat_1188846263",
    ["chill nearby enemies when you focus, causing 30% reduced action speed"] = "explicit.stat_2384145996",
    ["increased damage per 15 intelligence"] = "explicit.stat_3801128794",
    ["maximum energy shield per level"] = "explicit.stat_3864993324",
    ["chance to gain a power charge if you knock an enemy back with melee damage"] = "explicit.stat_2179619644",
    ["minions gain of physical damage as extra cold damage"] = "explicit.stat_1236638414",
    ["golems have less life"] = "explicit.stat_3730242558",
    ["golems have increased movement speed"] = "explicit.stat_186383409",
    ["reduced golem size"] = "explicit.stat_2576412389",
    ["reduced elemental ailment duration on you"] = "explicit.stat_1745952865",
    ["minions have to cold resistance"] = "explicit.stat_2200407711",
    ["golems deal less damage"] = "explicit.stat_2861397339",
    ["increased taunt duration"] = "explicit.stat_3651611160",
    ["maximum life per level"] = "explicit.stat_1982144275",
    ["damage penetrates lightning resistance during flask effect"] = "explicit.stat_4164990693",
    ["avatar of fire"] = "explicit.stat_346029096",
    ["you cannot have non-golem minions"] = "explicit.stat_1826605755",
    ["increased item quantity per white socket"] = "explicit.stat_2340173293",
    ["to maximum life per red socket"] = "explicit.stat_4210076836",
    ["with at least 40 intelligence in radius, cold snap has a chance to grant a power charge on killing blow"] = "explicit.stat_602486112",
    ["to maximum mana per green socket"] = "explicit.stat_896299992",
    ["socketed gems are supported by level cast on melee kill"] = "explicit.stat_3312593243",
    ["chance to block attack damage per endurance charge"] = "explicit.stat_3039589351",
    ["to maximum energy shield per blue socket"] = "explicit.stat_2906522048",
    ["chance to gain a siphoning charge when you use a skill"] = "explicit.stat_2922737717",
    ["socketed gems deal more elemental damage"] = "explicit.stat_3835899275",
    ["of damage leeched as life per siphoning charge"] = "explicit.stat_1587137379",
    ["arrows that pierce have 50% chance to inflict bleeding"] = "explicit.stat_1812251528",
    ["arrows pierce all targets after chaining"] = "explicit.stat_1997151732",
    ["socketed golem skills have increased attack and cast speed"] = "explicit.stat_706212417",
    ["additional physical damage reduction from hits per siphoning charge"] = "explicit.stat_3837366401",
    ["adds to physical damage to attacks and spells per siphoning charge"] = "explicit.stat_3368671817",
    ["gain onslaught for seconds when you cast socketed golem skill"] = "explicit.stat_1693676706",
    ["take physical damage per second per siphoning charge if you've used a skill recently"] = "explicit.stat_2440172920",
    ["monster cold resistance"] = "explicit.stat_1430380429",
    ["mana regenerated per second while you have avian's flight"] = "explicit.stat_1495376076",
    ["fire damage taken when hit"] = "explicit.stat_614758785",
    ["increased physical damage while you have resolute technique"] = "explicit.stat_1258679667",
    ["monster fire resistance"] = "explicit.stat_2319127046",
    ["socketed gems are supported by level unbound ailments"] = "explicit.stat_3699494172",
    ["to maximum siphoning charges per elder or shaper item equipped"] = "explicit.stat_1872128565",
    ["life regenerated per second while you have avian's flight"] = "explicit.stat_2589482056",
    ["increased mana regeneration rate during any flask effect"] = "explicit.stat_2993091567",
    ["seconds to avian's flight duration"] = "explicit.stat_1251731548",
    ["you are cursed with level vulnerability"] = "explicit.stat_694123963",
    ["gain an endurance charge when you lose a power charge"] = "explicit.stat_1791875585",
    ["to critical strike multiplier against enemies that are on full life"] = "explicit.stat_2355615476",
    ["gain of non-chaos damage as extra chaos damage per siphoning charge"] = "explicit.stat_3296019532",
    ["grants level grace skill"] = "explicit.stat_2867050084",
    ["grants level clarity skill"] = "explicit.stat_3511815065",
    ["monsters gain frenzy charge every 20 seconds"] = "explicit.stat_3580556037",
    ["reduced arctic armour mana reservation"] = "explicit.stat_2233726619",
    ["hits with this weapon always ignite, freeze, and shock"] = "explicit.stat_2451774989",
    ["cannot gain energy shield"] = "explicit.stat_206243615",
    ["phase acrobatics"] = "explicit.stat_2776975640",
    ["increased arctic armour buff effect"] = "explicit.stat_3995612171",
    ["of attack damage leeched as life against taunted enemies"] = "explicit.stat_3750917270",
    ["of physical damage from hits with this weapon is converted to a random element"] = "explicit.stat_1431238626",
    ["you have onslaught while not on low mana"] = "explicit.stat_1959256242",
    ["increased damage with hits against frozen enemies"] = "explicit.stat_1196902248",
    ["reflects to physical damage to melee attackers"] = "explicit.stat_2970307386",
    ["deal no non-elemental damage"] = "explicit.stat_4031851097",
    ["grants level vitality skill"] = "explicit.stat_2410613176",
    ["of mana regenerated per second"] = "explicit.stat_3188455409",
    ["of maximum life per second to maximum life leech rate"] = "explicit.stat_2291332709",
    ["nearby enemies have to fire resistance"] = "explicit.stat_3914021960",
    ["adds knockback during flask effect"] = "explicit.stat_2313449458",
    ["grants level determination skill"] = "explicit.stat_4265392510",
    ["poisons on you expire slower"] = "explicit.stat_2443132097",
    ["chance to be poisoned"] = "explicit.stat_4250009622",
    ["enemies take increased damage for each type of ailment you have inflicted on them"] = "explicit.stat_1217730254",
    ["attacks have 25% chance to inflict bleeding when hitting cursed enemies"] = "explicit.stat_2591028853",
    ["increased cast speed if you've killed recently"] = "explicit.stat_2072625596",
    ["increased damage per 15 dexterity"] = "explicit.stat_2062174346",
    ["increased cold damage per frenzy charge"] = "explicit.stat_329974315",
    ["chance to dodge attack hits while phasing"] = "explicit.stat_679632038",
    ["to all maximum resistances while poisoned"] = "explicit.stat_1030987123",
    ["minions recover of maximum life on killing a poisoned enemy"] = "explicit.stat_2602664175",
    ["you have phasing if energy shield recharge has started recently"] = "explicit.stat_2632954025",
    ["increased effect of buffs granted by socketed golem skills"] = "explicit.stat_2813516522",
    ["socketed golem skills gain of maximum life as extra maximum energy shield"] = "explicit.stat_1199118714",
    ["increased aspect of the avian buff effect"] = "explicit.stat_1746347097",
    ["increased energy shield from body armour"] = "explicit.stat_1195319608",
    ["gain a frenzy charge on reaching maximum power charges"] = "explicit.stat_2732344760",
    ["socketed gems are supported by level arcane surge"] = "explicit.stat_2287264161",
    ["spells fire an additional projectile"] = "explicit.stat_1011373762",
    ["aspect of the avian also grants avian's might and avian's flight to nearby allies"] = "explicit.stat_2544408546",
    ["socketed golem skills have chance to taunt on hit"] = "explicit.stat_178057093",
    ["socketed golem skills have life regenerated per second"] = "explicit.stat_693460617",
    ["socketed gems are supported by level iron grip"] = "explicit.stat_251446805",
    ["less poison duration"] = "explicit.stat_1237693206",
    ["weapons you animate create an additional copy"] = "explicit.stat_1266553505",
    ["less animate weapon duration"] = "explicit.stat_414991155",
    ["damage from enemies hitting you is unlucky while you are cursed with vulnerability"] = "explicit.stat_2758554648",
    ["increased spell damage per 16 intelligence"] = "explicit.stat_3961014595",
    ["conductivity has reduced mana reservation"] = "explicit.stat_622203853",
    ["increased experience gain for corrupted gems"] = "explicit.stat_47271484",
    ["nearby enemies have to cold resistance"] = "explicit.stat_2674336304",
    ["flasks do not apply to you"] = "explicit.stat_3003321700",
    ["flasks apply to your zombies and spectres"] = "explicit.stat_3127641775",
    ["life regenerated per second if you have at least 1500 maximum energy shield"] = "explicit.stat_3227159962",
    ["modifiers to claw critical strike chance also apply to unarmed attack critical strike chance"] = "explicit.stat_520731232",
    ["modifiers to claw damage also apply to unarmed attack damage"] = "explicit.stat_505678789",
    ["modifiers to claw attack speed also apply to unarmed attack speed"] = "explicit.stat_2951564010",
    ["chance to trigger level 20 animate weapon on kill"] = "explicit.stat_1973890509",
    ["life regenerated per second if you have at least 1000 maximum energy shield"] = "explicit.stat_1704843611",
    ["to unarmed attack critical strike chance"] = "explicit.stat_512074347",
    ["life regenerated per second if you have at least 500 maximum energy shield"] = "explicit.stat_1103902353",
    ["grants level hatred skill"] = "explicit.stat_2429546158",
    ["when you kill an ignited enemy, inflict an equivalent ignite on each nearby enemy"] = "explicit.stat_2638352064",
    ["area is inhabited by solaris fanatics"] = "explicit.stat_1934713036",
    ["area is inhabited by lunaris fanatics"] = "explicit.stat_3408601861",
    ["trigger level summon phantasm skill when you consume a corpse"] = "explicit.stat_3252082366",
    ["energy shield regenerated per second per poison on you, up to 250 per second"] = "explicit.stat_948687156",
    ["if you consumed a corpse recently, you and nearby allies regenerate of life per second"] = "explicit.stat_4089969970",
    ["lose mana per second"] = "explicit.stat_2589042711",
    ["adds to physical damage"] = "explicit.stat_960081730",
    ["frostbite has reduced mana reservation"] = "explicit.stat_4272260340",
    ["adds to cold damage while you have avian's might"] = "explicit.stat_3485231932",
    ["adds to lightning damage while you have avian's might"] = "explicit.stat_855634301",
    ["seconds to avian's might duration"] = "explicit.stat_1251945210",
    ["increased area of effect if you have stunned an enemy recently"] = "explicit.stat_430248187",
    ["grants level summon doedre's effigy skill socketed curse skills are triggered by doedre's effigy when summoned socketed curse skills ignore curse limit"] = "explicit.stat_1517357911",
    ["increases and reductions to cast speed also apply to trap throwing speed"] = "explicit.stat_3520223758",
    ["grants level wrath skill"] = "explicit.stat_2265307453",
    ["grants level anger skill"] = "explicit.stat_484879947",
    ["chance to avoid fire damage when hit"] = "explicit.stat_42242677",
    ["trigger level void gaze when you use a skill"] = "explicit.stat_1869144397",
    ["increased elemental damage with attack skills per power charge"] = "explicit.stat_4116409626",
    ["gain a spirit charge every second"] = "explicit.stat_328131617",
    ["debuffs on you expire faster"] = "explicit.stat_1238227257",
    ["you lose all spirit charges when taking a savage hit"] = "explicit.stat_2663792764",
    ["gain her embrace for seconds when you ignite an enemy"] = "explicit.stat_608963131",
    ["while in her embrace, take of your total maximum life and energy shield as fire damage per second per level"] = "explicit.stat_2442112158",
    ["recover of energy shield when you lose a spirit charge"] = "explicit.stat_1996775727",
    ["notable passive skills in radius grant nothing"] = "explicit.stat_2627243269",
    ["cannot leech"] = "explicit.stat_1336164384",
    ["curse enemies with temporal chains on hit"] = "explicit.stat_4139135963",
    ["to maximum number of crab barriers"] = "explicit.stat_2894704558",
    ["remove chill and freeze when you use a flask"] = "explicit.stat_3296873305",
    ["increased effect of non-keystone passive skills in radius"] = "explicit.stat_607548408",
    ["gain a frenzy charge on hit while bleeding"] = "explicit.stat_2977774856",
    ["additional physical damage reduction while stationary"] = "explicit.stat_2181129193",
    ["of life leech applies to enemies as chaos damage"] = "explicit.stat_768537671",
    ["remove shock when you use a flask"] = "explicit.stat_561861132",
    ["chance to block attack damage while you have at least 5 crab barriers"] = "explicit.stat_1354504703",
    ["chance to block attack damage while you have at least 10 crab barriers"] = "explicit.stat_653107703",
    ["cannot lose crab barriers if you have lost crab barriers recently"] = "explicit.stat_241251790",
    ["when you kill a rare monster, chance to gain one of its modifiers for 10 seconds"] = "explicit.stat_2736829661",
    ["increased effect of shocked ground on you"] = "explicit.stat_2413483202",
    ["vulnerability has reduced mana reservation"] = "explicit.stat_1798031916",
    ["adds to lightning damage to attacks per 10 intelligence"] = "explicit.stat_3168149399",
    ["armour per active totem"] = "explicit.stat_1429385513",
    ["adds to cold damage to attacks per 10 dexterity"] = "explicit.stat_769783486",
    ["to total mana cost of skills for each corrupted item equipped"] = "explicit.stat_3750572810",
    ["reduced mana cost of totem skills that cast an aura"] = "explicit.stat_2701327257",
    ["all attacks with this weapon are critical strikes"] = "explicit.stat_3978164317",
    ["life regenerated per second for each uncorrupted item equipped"] = "explicit.stat_405941409",
    ["adds to fire damage to attacks per 10 strength"] = "explicit.stat_68673913",
    ["chill enemy for second when hit, reducing their action speed by 30%"] = "explicit.stat_2459809121",
    ["damage penetrates cold resistance against chilled enemies"] = "explicit.stat_1477032229",
    ["your spells are disabled"] = "explicit.stat_1981749265",
    ["spell skills deal no damage"] = "explicit.stat_291644318",
    ["trigger level storm cascade when you attack"] = "explicit.stat_818329660",
    ["blind chilled enemies on hit"] = "explicit.stat_3450276548",
    ["curse enemies with flammability on hit"] = "explicit.stat_654274615",
    ["burning hoofprints"] = "explicit.stat_3576153145",
    ["increased fire damage per 20 strength"] = "explicit.stat_2241902512",
    ["triggers level abberath's fury when equipped"] = "explicit.stat_3250579936",
    ["socketed gems deal more damage over time"] = "explicit.stat_3846088475",
    ["non-critical strikes deal damage"] = "explicit.stat_1711683262",
    ["gain of physical damage as extra lightning damage while affected by wrath"] = "explicit.stat_2255914633",
    ["your cold damage can ignite"] = "explicit.stat_3573591118",
    ["sacrifice of life to gain that much energy shield when you cast a spell"] = "explicit.stat_613752285",
    ["increased damage per crab barrier"] = "explicit.stat_1019038967",
    ["increased chill duration on enemies when in off hand"] = "explicit.stat_4199402748",
    ["chaos damage does not bypass energy shield while not on low life or low mana"] = "explicit.stat_3799299052",
    ["reflect shocks applied to you to all nearby enemies"] = "explicit.stat_615884286",
    ["increased movement speed if you've hit an enemy recently"] = "explicit.stat_3178542354",
    ["of physical damage converted to lightning damage while affected by wrath"] = "explicit.stat_2106756686",
    ["you have no life regeneration"] = "explicit.stat_854225133",
    ["cannot be stunned if you have at least 10 crab barriers"] = "explicit.stat_877233648",
    ["increased damage during any flask effect"] = "explicit.stat_2947215268",
    ["increased armour, evasion and energy shield"] = "explicit.stat_3523867985",
    ["stun threshold is based on of your mana instead of life"] = "explicit.stat_2280488002",
    ["chance that if you would gain a crab barrier, you instead gain up to your maximum number of crab barriers"] = "explicit.stat_1829869055",
    ["to critical strike multiplier if you have blocked recently"] = "explicit.stat_3527458221",
    ["to critical strike multiplier while affected by anger"] = "explicit.stat_3627458291",
    ["enemies have reduced evasion if you have hit them recently"] = "explicit.stat_1773891268",
    ["you only lose crab barriers when you take physical damage from a hit"] = "explicit.stat_455217103",
    ["projectiles fork"] = "explicit.stat_942938211",
    ["increased damage with hits against rare monsters"] = "explicit.stat_2137878565",
    ["of damage taken from mana before life while affected by clarity"] = "explicit.stat_2383304564",
    ["when you kill a rare monster, you gain its modifiers for seconds"] = "explicit.stat_2913235441",
    ["of fire damage from hits taken as cold damage"] = "explicit.stat_2522672898",
    ["of physical damage from hits taken as lightning damage while affected by purity of elements"] = "explicit.stat_873224517",
    ["curse enemies with level frostbite on hit"] = "explicit.stat_426847518",
    ["players are cursed with conductivity"] = "explicit.stat_376158712",
    ["chance to scorch enemies"] = "explicit.stat_606940191",
    ["enemies you hit are destroyed on kill"] = "explicit.stat_2970902024",
    ["gain a flask charge when you deal a critical strike"] = "explicit.stat_1546046884",
    ["increased global critical strike chance per level"] = "explicit.stat_3081076859",
    ["cannot inflict ignite"] = "explicit.stat_4198497576",
    ["chance to trigger level 20 tornado when you gain avian's might or avian's flight"] = "explicit.stat_2554328719",
    ["of physical damage converted to fire damage while affected by anger"] = "explicit.stat_3624529132",
    ["unique boss drops divination cards"] = "explicit.stat_2170294665",
    ["damage penetrates cold resistance while affected by hatred"] = "explicit.stat_1222888897",
    ["of damage leeched as life on critical strike"] = "explicit.stat_958088871",
    ["chance to dodge spell hits while affected by haste"] = "explicit.stat_1345136012",
    ["players are cursed with projectile weakness"] = "explicit.stat_2116087952",
    ["chance to sap enemies"] = "explicit.stat_532324017",
    ["projectiles from spells cannot pierce"] = "explicit.stat_3826125995",
    ["right ring slot: projectiles from spells chain +times"] = "explicit.stat_1555918911",
    ["increased damage with hits and ailments against enemies affected by 3 spider's webs"] = "explicit.stat_103928310",
    ["of physical damage from hits taken as fire damage while affected by purity of elements"] = "explicit.stat_1722775216",
    ["of physical damage from hits taken as lightning damage while affected by purity of lightning"] = "explicit.stat_254131992",
    ["nearby enemies have to lightning resistance"] = "explicit.stat_1849749435",
    ["adds to chaos damage for each spider's web on the enemy"] = "explicit.stat_982177653",
    ["cannot gain power charges"] = "explicit.stat_1791497458",
    ["cannot inflict freeze or chill"] = "explicit.stat_612223930",
    ["cannot inflict shock"] = "explicit.stat_990377349",
    ["left ring slot: projectiles from spells fork"] = "explicit.stat_2437476305",
    ["right ring slot: projectiles from spells cannot fork"] = "explicit.stat_2933024469",
    ["your offerings have increased effect on you"] = "explicit.stat_2071120096",
    ["damage penetrates of fire resistance if you have blocked recently"] = "explicit.stat_2341811700",
    ["left ring slot: projectiles from spells cannot chain"] = "explicit.stat_3647242059",
    ["grants level vengeance skill"] = "explicit.stat_4122367945",
    ["trigger level bone offering, flesh offering or spirit offering every 5 seconds offering skills triggered this way also affect you"] = "explicit.stat_1663239249",
    ["of physical damage from hits taken as cold damage while affected by purity of ice"] = "explicit.stat_1779027621",
    ["unaffected by shocked ground while affected by purity of lightning"] = "explicit.stat_2567659895",
    ["of physical damage from hits taken as fire damage while affected by purity of fire"] = "explicit.stat_1798459983",
    ["immune to freeze and chill while ignited"] = "explicit.stat_1512695141",
    ["curse enemies with level despair on hit"] = "explicit.stat_2764915899",
    ["players have no life or mana regeneration"] = "explicit.stat_1890969167",
    ["of physical damage from hits taken as cold damage while affected by purity of elements"] = "explicit.stat_1710207583",
    ["chance to inflict brittle"] = "explicit.stat_2238174408",
    ["increased damage with channelling skills"] = "explicit.stat_2733285506",
    ["unaffected by flammability while affected by purity of fire"] = "explicit.stat_1173690938",
    ["of maximum energy shield regenerated per second while affected by discipline"] = "explicit.stat_991194404",
    ["projectiles pierce all targets while you have phasing"] = "explicit.stat_2636403786",
    ["additional physical damage reduction while affected by determination"] = "explicit.stat_1873457881",
    ["chance to recover 10% of maximum mana when you use a skill while affected by clarity"] = "explicit.stat_1699077932",
    ["unaffected by frostbite while affected by purity of ice"] = "explicit.stat_4012281889",
    ["chance to block spell damage while affected by discipline"] = "explicit.stat_1313498929",
    ["chance to block attack damage while affected by determination"] = "explicit.stat_3692646597",
    ["poison cursed enemies on hit"] = "explicit.stat_4266201818",
    ["unaffected by elemental weakness while affected by purity of elements"] = "explicit.stat_3223142064",
    ["reduced reflected physical damage taken while affected by determination"] = "explicit.stat_2457540491",
    ["increased damage per 15 strength"] = "explicit.stat_3948776386",
    ["with corrupted items equipped: life leech recovers based on your chaos damage instead"] = "explicit.stat_4192058279",
    ["to level of socketed trap gems"] = "explicit.stat_407139870",
    ["unaffected by burning ground while affected by purity of fire"] = "explicit.stat_3308185931",
    ["reduced reflected elemental damage taken while affected by purity of elements"] = "explicit.stat_65331133",
    ["increased energy shield recovery rate while affected by discipline"] = "explicit.stat_80470845",
    ["unaffected by enfeeble while affected by grace"] = "explicit.stat_2365917222",
    ["temporal chains has reduced mana reservation"] = "explicit.stat_3779771090",
    ["unaffected by chilled ground while affected by purity of ice"] = "explicit.stat_2647344903",
    ["increased mana recovery rate while affected by clarity"] = "explicit.stat_556659145",
    ["cannot be poisoned"] = "explicit.stat_3835551335",
    ["increased cooldown recovery speed of movement skills used while affected by haste"] = "explicit.stat_3332055899",
    ["with corrupted items equipped: 50% of chaos damage does not bypass energy shield, and 50% of physical damage bypasses energy shield"] = "explicit.stat_3225265684",
    ["debuffs on you expire faster while affected by haste"] = "explicit.stat_207635700",
    ["increased damage with poison per power charge"] = "explicit.stat_4230767876",
    ["chance to gain a power charge on hitting an enemy affected by a spider's web"] = "explicit.stat_273206351",
    ["you gain onslaught for seconds on kill while affected by haste"] = "explicit.stat_1424006185",
    ["chance to poison per power charge"] = "explicit.stat_2992087211",
    ["chance to curse enemies with level 10 vulnerability on hit"] = "explicit.stat_2213584313",
    ["melee movement skills have chance to fortify on hit"] = "explicit.stat_59547568",
    ["increased cold damage while affected by hatred"] = "explicit.stat_1413864591",
    ["of damage leeched as life while affected by vitality"] = "explicit.stat_3656959867",
    ["chance to dodge attack hits while affected by grace"] = "explicit.stat_2218252147",
    ["increased life recovery from flasks while affected by vitality"] = "explicit.stat_362838683",
    ["you take reduced extra damage from critical strikes while affected by determination"] = "explicit.stat_68410701",
    ["unaffected by vulnerability while affected by determination"] = "explicit.stat_3207781478",
    ["tormented spirits drop 1 additional rare item"] = "explicit.stat_4268822436",
    ["to armour while affected by determination"] = "explicit.stat_3742808908",
    ["increased critical strike chance against poisoned enemies"] = "explicit.stat_1345659139",
    ["gain unholy might during flask effect"] = "explicit.stat_207573834",
    ["life regenerated per second while affected by vitality"] = "explicit.stat_3489570622",
    ["despair has reduced mana reservation"] = "explicit.stat_2562564343",
    ["aspect of the spider inflicts spider's webs and hinder every seconds instead"] = "explicit.stat_3832130495",
    ["chance for energy shield recharge to start when you block"] = "explicit.stat_762154651",
    ["immune to shock while affected by purity of lightning"] = "explicit.stat_281949611",
    ["gain of lightning damage as extra chaos damage"] = "explicit.stat_2402136583",
    ["passives granting lightning resistance or all elemental resistances in radius also grant an equal chance to gain a power charge on kill"] = "explicit.stat_926444104",
    ["chance to blind enemies which hit you while affected by grace"] = "explicit.stat_2548097895",
    ["chance to poison on hit with attacks"] = "explicit.stat_3954735777",
    ["unaffected by conductivity while affected by purity of lightning"] = "explicit.stat_1567542124",
    ["immune to freeze while affected by purity of ice"] = "explicit.stat_2720072724",
    ["chance for your flasks to not consume charges"] = "explicit.stat_311641062",
    ["immune to ignite while affected by purity of fire"] = "explicit.stat_371612541",
    ["of damage taken gained as mana over 4 seconds when hit while affected by clarity"] = "explicit.stat_380220671",
    ["chance to evade attacks while affected by grace"] = "explicit.stat_969576725",
    ["increased onslaught effect"] = "explicit.stat_3151397056",
    ["less minimum physical attack damage"] = "explicit.stat_1715495976",
    ["socketed gems are supported by level greater volley"] = "explicit.stat_2223565123",
    ["more maximum physical attack damage"] = "explicit.stat_3029185248",
    ["increased area of effect per 50 strength"] = "explicit.stat_2611023406",
    ["aspect of the spider can inflict spider's web on enemies an additional time"] = "explicit.stat_1509532587",
    ["gain energy shield for each enemy you hit which is affected by a spider's web"] = "explicit.stat_549215295",
    ["increased aspect of the spider debuff duration"] = "explicit.stat_332854027",
    ["gain of physical damage as extra fire damage while affected by anger"] = "explicit.stat_4245204226",
    ["you always ignite while burning"] = "explicit.stat_2636728487",
    ["acrobatics"] = "explicit.stat_383557755",
    ["gain life when you stun an enemy"] = "explicit.stat_2968301430",
    ["adds to cold damage while affected by hatred"] = "explicit.stat_2643562209",
    ["gain shaper's presence for 10 seconds when you kill a rare or unique enemy"] = "explicit.stat_1091613629",
    ["unaffected by temporal chains while affected by haste"] = "explicit.stat_2806391472",
    ["to critical strike chance while affected by hatred"] = "explicit.stat_2753985507",
    ["projectiles from attacks have chance to maim on hit while you have a bestial minion"] = "explicit.stat_1753916791",
    ["critical strikes have chance to blind enemies while you have cat's stealth"] = "explicit.stat_843854434",
    ["increased minion duration"] = "explicit.stat_999511066",
    ["increased attack and movement speed while you have a bestial minion"] = "explicit.stat_3597737983",
    ["increased damage with hits and ailments against blinded enemies"] = "explicit.stat_3565956680",
    ["minions cannot be blinded"] = "explicit.stat_2684385509",
    ["socketed minion gems are supported by level life leech"] = "explicit.stat_4006301249",
    ["minions have chance to blind enemies on hit"] = "explicit.stat_2939409392",
    ["found magic items drop identified"] = "explicit.stat_3020069394",
    ["to critical strike chance while affected by aspect of the cat"] = "explicit.stat_3992636701",
    ["to total mana cost of skills while affected by clarity"] = "explicit.stat_2445618239",
    ["to critical strike multiplier if you've dealt a non-critical strike recently"] = "explicit.stat_1626712767",
    ["to critical strike multiplier per 1% chance to block attack damage"] = "explicit.stat_956384511",
    ["chance to gain an endurance charge when you taunt an enemy"] = "explicit.stat_1657549833",
    ["grants level purity of fire skill"] = "explicit.stat_3970432307",
    ["to chaos resistance while affected by purity of elements"] = "explicit.stat_1138813382",
    ["chance when hit for double armour effect"] = "explicit.stat_327253797",
    ["of physical damage converted to cold damage while affected by hatred"] = "explicit.stat_664849247",
    ["you and nearby allies have increased attack, cast and movement speed if you've warcried recently"] = "explicit.stat_1464115829",
    ["damage penetrates fire resistance while affected by anger "] = "explicit.stat_3111519953",
    ["projectiles from attacks have chance to poison on hit while you have a bestial minion"] = "explicit.stat_1114411822",
    ["chance to gain an endurance charge when you hit a bleeding enemy"] = "explicit.stat_1536266147",
    ["adds #-physical damage to attacks while you have a bestial minion"] = "explicit.stat_242822230",
    ["gain of maximum mana as extra maximum energy shield while affected by clarity"] = "explicit.stat_2831391506",
    ["gain souls for vaal skills on rampage"] = "explicit.stat_1601542157",
    ["life gained for each blinded enemy hit by this weapon"] = "explicit.stat_1649099067",
    ["grants level reckoning skill"] = "explicit.stat_2434330144",
    ["projectiles from attacks have chance to inflict bleeding on hit while you have a bestial minion"] = "explicit.stat_4058504226",
    ["rhoa feather lure"] = "explicit.stat_3360430812",
    ["curse enemies with level conductivity on hit"] = "explicit.stat_710372469",
    ["adds #-chaos damage to attacks while you have a bestial minion"] = "explicit.stat_2152491486",
    ["recover life when you block"] = "explicit.stat_1678831767",
    ["triggers level elemental aegis when equipped"] = "explicit.stat_2602585351",
    ["increased fire damage while affected by anger"] = "explicit.stat_3337107517",
    ["chance to gain unholy might on block for 3 seconds"] = "explicit.stat_3184880507",
    ["trigger level bone nova when you kill a bleeding enemy"] = "explicit.stat_2634885412",
    ["with a hypnotic eye jewel socketed, gain arcane surge on hit with spells"] = "explicit.stat_3153744598",
    ["you cannot be shocked while frozen"] = "explicit.stat_798853218",
    ["with a ghastly eye jewel socketed, minions have +to accuracy rating"] = "explicit.stat_2388362438",
    ["right ring slot: you cannot regenerate mana"] = "explicit.stat_783864527",
    ["left ring slot: you cannot recharge or regenerate energy shield"] = "explicit.stat_4263540840",
    ["increased quantity of fish caught"] = "explicit.stat_3802667447",
    ["right ring slot: of energy shield regenerated per second"] = "explicit.stat_3676958605",
    ["increased effect of chilled ground on you"] = "explicit.stat_3641300286",
    ["monsters from beyond have more quantity and rarity of dropped items"] = "explicit.stat_3422445312",
    ["increased damage with hits and ailments per freeze, shock and ignite on enemy"] = "explicit.stat_4229711086",
    ["increased effect of burning ground on you"] = "explicit.stat_3569976476",
    ["increased life recovery rate while affected by vitality"] = "explicit.stat_2690790844",
    ["grants level envy skill"] = "explicit.stat_52953650",
    ["flammability has reduced mana reservation"] = "explicit.stat_3152149523",
    ["increased mana regeneration rate while stationary"] = "explicit.stat_3308030688",
    ["increased area of effect per endurance charge"] = "explicit.stat_2448279015",
    ["armour while stationary"] = "explicit.stat_2551779822",
    ["increased global physical damage while frozen"] = "explicit.stat_2614654450",
    ["chance to create chilled ground when hit with an attack"] = "explicit.stat_358040686",
    ["attacks with this weapon have chance to inflict bleeding against ignited enemies"] = "explicit.stat_3148418088",
    ["attacks with this weapon deal to added fire damage to bleeding enemies"] = "explicit.stat_2453554491",
    ["attacks with this weapon deal to added physical damage to ignited enemies"] = "explicit.stat_2202639361",
    ["traps from socketed skills create a smoke cloud when triggered"] = "explicit.stat_1263384098",
    ["grants level gluttony of elements skill"] = "explicit.stat_3321235265",
    ["damage penetrates lightning resistance while affected by wrath"] = "explicit.stat_1077131949",
    ["increased movement speed while affected by grace"] = "explicit.stat_3329402420",
    ["increased lightning damage while affected by wrath"] = "explicit.stat_418293304",
    ["faster start of energy shield recharge while affected by discipline"] = "explicit.stat_1016185292",
    ["increased damage if you've frozen an enemy recently"] = "explicit.stat_1064477264",
    ["enemies affected by your spider's webs have to all resistances"] = "explicit.stat_785655723",
    ["increased critical strike chance while affected by wrath"] = "explicit.stat_3357049845",
    ["area contains additional animated weapon packs"] = "explicit.stat_550012797",
    ["talismans found in this area are rare"] = "explicit.stat_1401233515",
    ["enemies affected by your spider's webs deal reduced damage"] = "explicit.stat_3231424461",
    ["trigger level intimidating cry when you lose cat's stealth"] = "explicit.stat_3892608176",
    ["you have phasing while affected by haste"] = "explicit.stat_1346311588",
    ["energy shield regenerated per second"] = "explicit.stat_1330109706",
    ["increased aspect of the spider area of effect"] = "explicit.stat_3686780108",
    ["immune to burning ground, shocked ground and chilled ground"] = "explicit.stat_3705740723",
    ["area is inhabited by redblade warbands"] = "explicit.stat_3560379096",
    ["to accuracy against bleeding enemies"] = "explicit.stat_2269396414",
    ["increased movement speed while you have cat's stealth"] = "explicit.stat_673704994",
    ["attacks always inflict bleeding while you have cat's stealth"] = "explicit.stat_2059771038",
    ["you have crimson dance while you have cat's stealth"] = "explicit.stat_3492797685",
    ["chance to trigger level 1 raise spiders on kill"] = "explicit.stat_3844016207",
    ["increased damage with hits and ailments against bleeding enemies"] = "explicit.stat_1790172543",
    ["to maximum life per 10 dexterity"] = "explicit.stat_3806100539",
    ["manifest dancing dervish also manifests a copy of dancing dervish"] = "explicit.stat_1820083363",
    ["your hits inflict decay, dealing 500 chaos damage per second for 8 seconds"] = "explicit.stat_3322709337",
    ["life regenerated per second while moving"] = "explicit.stat_2841027131",
    ["remove ignite and burning when you use a flask"] = "explicit.stat_1162425204",
    ["socketed skills deal more spell damage"] = "explicit.stat_2964800094",
    ["cold skills have chance to poison on hit"] = "explicit.stat_2373079502",
    ["to maximum number of summoned golems if you have 3 primordial items socketed or equipped"] = "explicit.stat_920385757",
    ["your cold damage can poison"] = "explicit.stat_1917124426",
    ["area contains additional rare monsters"] = "explicit.stat_2810286377",
    ["gain of fire damage as extra chaos damage"] = "explicit.stat_1599775597",
    ["passives granting fire resistance or all elemental resistances in radius also grant an equal chance to gain an endurance charge on kill"] = "explicit.stat_1645524575",
    ["mana gained on kill per level"] = "explicit.stat_1064067689",
    ["removes bleeding when you use a warcry"] = "explicit.stat_3936926420",
    ["energy shield gained on kill per level"] = "explicit.stat_294153754",
    ["of fire damage leeched as life while affected by anger"] = "explicit.stat_2312747856",
    ["life gained for each enemy hit while affected by vitality"] = "explicit.stat_4259701244",
    ["rogue exiles deal increased damage"] = "explicit.stat_1080855680",
    ["rogue exiles have increased attack, cast and movement speed"] = "explicit.stat_399295164",
    ["rogue exiles have more rarity of items dropped"] = "explicit.stat_2008953542",
    ["socketed attacks have to total mana cost"] = "explicit.stat_2264586521",
    ["increased effect of desecrated ground on you"] = "explicit.stat_1768963274",
    ["passives granting cold resistance or all elemental resistances in radius also grant an equal chance to gain a frenzy charge on kill"] = "explicit.stat_509677462",
    ["gain of cold damage as extra chaos damage"] = "explicit.stat_2915373966",
    ["nearby enemies have to chaos resistance"] = "explicit.stat_1902595112",
    ["critical strikes deal no damage"] = "explicit.stat_3245481061",
    ["warbands have more rarity of items dropped"] = "explicit.stat_751847284",
    ["warbands have more quantity of items dropped"] = "explicit.stat_121093551",
    ["of lightning damage is leeched as mana while affected by wrath"] = "explicit.stat_2889601846",
    ["increased elemental damage per level"] = "explicit.stat_2094646950",
    ["life gained on kill per level"] = "explicit.stat_4228691877",
    ["chance to trigger commandment of inferno on critical strike"] = "explicit.stat_3251948367",
    ["increased damage with ailments"] = "explicit.stat_690707482",
    ["of damage leeched as life against cursed enemies"] = "explicit.stat_3861913659",
    ["your lightning damage can poison"] = "explicit.stat_1604984482",
    ["increased global armour while you have no energy shield"] = "explicit.stat_3827349913",
    ["grants level purity of ice skill"] = "explicit.stat_4193390599",
    ["grants level purity of lightning skill"] = "explicit.stat_3822878124",
    ["lightning skills have chance to poison on hit"] = "explicit.stat_949718413",
    ["you can only socket corrupted gems in this item"] = "explicit.stat_608438307",
    ["damage penetrates elemental resistances during any flask effect"] = "explicit.stat_3392890360",
    ["to melee weapon range if you have killed recently"] = "explicit.stat_3255961830",
    ["socketed gems have +3.5% critical strike chance"] = "explicit.stat_1681904129",
    ["creates consecrated ground on critical strike"] = "explicit.stat_3195625581",
    ["players have a chance when they kill a rare monster to gain 1 of its modifiers for 20 seconds"] = "explicit.stat_3941376120",
    ["increased projectile attack damage while you have at least 200 dexterity"] = "explicit.stat_1822142649",
    ["socketed skills deal more attack damage"] = "explicit.stat_1970781345",
    ["area has a chance to contain cadiro perandus"] = "explicit.stat_3788235244",
    ["strongboxes each contain an additional random rare item"] = "explicit.stat_3089506271",
    ["energy shield gained for each enemy hit while affected by discipline"] = "explicit.stat_3765507527",
    ["minions leech of damage as life against poisoned enemies"] = "explicit.stat_548721233",
    ["area contains additional magic monsters"] = "explicit.stat_581013336",
    ["chance to double stun duration"] = "explicit.stat_2622251413",
    ["monsters imprisoned around essences in area are magic"] = "explicit.stat_1335713735",
    ["right ring slot: to maximum mana"] = "explicit.stat_417509375",
    ["left ring slot: to maximum energy shield"] = "explicit.stat_1497601437",
    ["auras from your skills grant increased damage to you and allies"] = "explicit.stat_3729445224",
    ["left ring slot: mana regenerated per second"] = "explicit.stat_3241234878",
    ["chance to intimidate enemies for 4 seconds on hit"] = "explicit.stat_78985352",
    ["monsters initially carrying a talisman drop an additional rare item"] = "explicit.stat_1819739544",
    ["monsters with silver coins drop an additional silver coin"] = "explicit.stat_3679287686",
    ["increased critical strike chance while you have at least 200 intelligence"] = "explicit.stat_578121324",
    ["you can only deal damage with this weapon and ignite"] = "explicit.stat_3128318472",
    ["increased damage when on full life"] = "explicit.stat_592020238",
    ["fire skills have chance to poison on hit"] = "explicit.stat_2424717327",
    ["ignited enemies burn faster"] = "explicit.stat_2443492284",
    ["your fire damage can poison"] = "explicit.stat_1985969957",
    ["chance to gain a power charge when you block"] = "explicit.stat_3945147290",
    ["players have increased attack, cast and movement speed while they have onslaught"] = "explicit.stat_1061545609",
    ["socketed gems are supported by level reduced mana"] = "explicit.stat_1866911844",
    ["permanently intimidate enemies on block"] = "explicit.stat_2930706364",
    ["a monster in this area will summon a unique monster from beyond when slain"] = "explicit.stat_4077883829",
    ["damage penetrates fire resistance against blinded enemies"] = "explicit.stat_1748657990",
    ["reduced cold damage taken"] = "explicit.stat_3303114033",
    ["your hits can't be evaded by blinded enemies"] = "explicit.stat_90597215",
    ["invasion bosses have more quantity and rarity of dropped items"] = "explicit.stat_1984366275",
    ["you have onslaught while on low life"] = "explicit.stat_1871938116",
    ["monsters have increased chance to spawn a beyond portal"] = "explicit.stat_3051860083",
    ["damage from enemies hitting you is unlucky while you are on full life"] = "explicit.stat_3629143471",
    ["increased spell damage per 16 dexterity"] = "explicit.stat_2612056840",
    ["glows while in an area containing a unique fish"] = "explicit.stat_931560398",
    ["increased spell damage per 16 strength"] = "explicit.stat_4249521944",
    ["socketed gems are supported by level cluster trap"] = "explicit.stat_2854183975",
    ["removes elemental ailments on rampage"] = "explicit.stat_627889781",
    ["gain immunity to physical damage for second on rampage"] = "explicit.stat_3100457893",
    ["increased damage with hits against shocked enemies"] = "explicit.stat_4194900521",
    ["monsters guarding shrines are magic"] = "explicit.stat_3738127245",
    ["chance to curse non-cursed enemies with a random curse on hit"] = "explicit.stat_1726444796",
    ["unique monsters from beyond have a chance to summon another unique monster from beyond when slain"] = "explicit.stat_531937370",
    ["talismans found in this area are 1 tier higher"] = "explicit.stat_2800333900",
    ["chance for poisons inflicted with this weapon to deal 100% more damage"] = "explicit.stat_2523146878",
    ["imprisoned monsters have an additional essence"] = "explicit.stat_679682964",
    ["unaffected by temporal chains"] = "explicit.stat_4212372504",
    ["area contains a stone circle"] = "explicit.stat_3005800306",
    ["curse enemies with level vulnerability on hit"] = "explicit.stat_3967845372",
    ["increased spell damage if you've dealt a critical strike recently"] = "explicit.stat_1550015622",
    ["invasion bosses are guarded by a magic pack"] = "explicit.stat_3209835461",
    ["rare breach monsters drop an additional splinter"] = "explicit.stat_3097206473",
    ["rare monsters from breaches have a chance to drop a breach ring"] = "explicit.stat_4157714333",
    ["area contains a voidspawn of abaxoth bloodline pack"] = "explicit.stat_2978408106",
    ["increased rampage streak duration"] = "explicit.stat_1406039617",
    ["increases and reductions to light radius also apply to accuracy"] = "explicit.stat_411986876",
    ["breaches have increased monster density"] = "explicit.stat_1210760818",
    ["players with at least 50 rampage kills take reduced damage"] = "explicit.stat_3045094957",
    ["gain up to your maximum number of frenzy and power charges when you gain cat's stealth"] = "explicit.stat_2446580062",
    ["adds to fire damage to hits with this weapon against blinded enemies"] = "explicit.stat_3977907993",
    ["seconds to cat's stealth duration"] = "explicit.stat_387596329",
    ["triggers level blinding aura when equipped"] = "explicit.stat_125312907",
    ["tormented spirits have increased duration"] = "explicit.stat_663610248",
    ["you cannot be cursed with silence"] = "explicit.stat_1654414582",
    ["grants level illusory warp skill"] = "explicit.stat_3279574030",
    ["the effect of chill on you is reversed"] = "explicit.stat_2955966707",
    ["strongboxes are magic"] = "explicit.stat_1037449707",
    ["gain life and mana from leech instantly on critical strike"] = "explicit.stat_3389184522",
    ["adds to cold damage to spells while no life is reserved"] = "explicit.stat_897996059",
    ["adds to lightning damage to spells while no life is reserved"] = "explicit.stat_985999215",
    ["adds to fire damage to spells while no life is reserved"] = "explicit.stat_833719670",
    ["an additional currency item drops when the first invasion boss is slain"] = "explicit.stat_2962051214",
    ["life regenerated per second while ignited"] = "explicit.stat_952897668",
    ["warbands in this area have an additional member"] = "explicit.stat_4072582319",
    ["every 16 seconds you gain iron reflexes for 8 seconds"] = "explicit.stat_2200114771",
    ["trigger level shock ground when hit"] = "explicit.stat_2668070396",
    ["aspect of the cat reserves no mana"] = "explicit.stat_3850409117",
    ["you have phasing while you have cat's stealth"] = "explicit.stat_1834455446",
    ["increased spell damage if you've dealt a critical strike in the past 8 seconds"] = "explicit.stat_467806158",
    ["reduced soul cost of vaal skills"] = "explicit.stat_678245679",
    ["increased attack, cast and movement speed while you do not have iron reflexes"] = "explicit.stat_3476327198",
    ["perandus chests have more rarity of items dropped"] = "explicit.stat_3535403838",
    ["perandus chests have more quantity of items dropped"] = "explicit.stat_1532770406",
    ["area contains an additional perandus coffer"] = "explicit.stat_2299389484",
    ["players take reduced damage from monsters from beyond"] = "explicit.stat_3045897926",
    ["area contains a bearers of the guardian bloodline pack"] = "explicit.stat_3387914367",
    ["increased fire damage if you have been hit recently"] = "explicit.stat_1271128334",
    ["you count as on low life while you are cursed with vulnerability"] = "explicit.stat_2304300603",
    ["players have blood magic"] = "explicit.stat_86122490",
    ["you have far shot while you do not have iron reflexes"] = "explicit.stat_3284029342",
    ["more damage with arrow hits at close range while you have iron reflexes"] = "explicit.stat_304032021",
    ["players have onslaught while using flasks"] = "explicit.stat_2576546039",
    ["when you kill a shocked enemy, inflict an equivalent shock on each nearby enemy"] = "explicit.stat_3462132936",
    ["rogue exiles drop additional currency items"] = "explicit.stat_600723636",
    ["nearby allies have culling strike"] = "explicit.stat_1560540713",
    ["nearby allies have increased item rarity"] = "explicit.stat_1722463112",
    ["rogue exiles each have a rogue exile ally"] = "explicit.stat_2653164718",
    ["players have chance to dodge spell hits"] = "explicit.stat_1282689888",
    ["increased maximum life for each corrupted item equipped"] = "explicit.stat_4169430079",
    ["to all resistances for each corrupted item equipped"] = "explicit.stat_3100523498",
    ["nearby enemies take increased physical damage"] = "explicit.stat_415837237",
    ["players have a chance to gain onslaught on kill for 4 seconds"] = "explicit.stat_3563824294",
    ["has an additional implicit mod"] = "explicit.stat_2489070122",
    ["chance to dodge attack and spell hits per 500 maximum mana, up to 20%"] = "explicit.stat_2367560235",
    ["increased rarity of fish caught"] = "explicit.stat_3310914132",
    ["rogue exiles drop an additional jewel"] = "explicit.stat_4143730600",
    ["increased maximum energy shield for each corrupted item equipped"] = "explicit.stat_3916980068",
    ["of life regenerated per second per 500 maximum energy shield"] = "explicit.stat_1960833438",
    ["gain mana when you hit a taunted enemy"] = "explicit.stat_1834588299",
    ["strength provides no bonus to maximum life"] = "explicit.stat_2290031712",
    ["players have increased movement speed"] = "explicit.stat_1416455556",
    ["intelligence provides no bonus to maximum mana"] = "explicit.stat_2546599258",
    ["area contains an uul-netol breach"] = "explicit.stat_2130441002",
    ["to maximum life per 2 intelligence"] = "explicit.stat_4284915962",
    ["lose of maximum mana per second"] = "explicit.stat_2936435999",
    ["monsters have chance to avoid being shocked"] = "explicit.stat_3757930834",
    ["hits with this weapon deal increased damage to frozen enemies"] = "explicit.stat_196313911",
    ["hits with this weapon deal increased damage to shocked enemies"] = "explicit.stat_1470894892",
    ["trigger level icicle burst when you kill a frozen enemy"] = "explicit.stat_2812925691",
    ["hits with this weapon deal increased damage to ignited enemies"] = "explicit.stat_3095345438",
    ["chance to avoid lightning damage when hit"] = "explicit.stat_2889664727",
    ["you gain onslaught for seconds on killing taunted enemies"] = "explicit.stat_2580101523",
    ["increased quantity of items found when on low life"] = "explicit.stat_760855772",
    ["to maximum number of summoned holy relics"] = "explicit.stat_2056575682",
    ["summoned holy relics have reduced cooldown recovery speed"] = "explicit.stat_1583498502",
    ["number of perandus coins dropped in this area is doubled"] = "explicit.stat_1271391587",
    ["you have vaal pact if you've dealt a critical strike recently"] = "explicit.stat_1032751668",
    ["players have increased rarity of items found per 15 rampage kills"] = "explicit.stat_1489997462",
    ["socketed gems are supported by level minion speed"] = "explicit.stat_995332031",
    ["you have crimson dance if you have dealt a critical strike recently"] = "explicit.stat_1756017808",
    ["you take chaos damage instead of physical damage from bleeding"] = "explicit.stat_1623397857",
    ["chance for bleeding inflicted with this weapon to deal 100% more damage"] = "explicit.stat_1560880986",
    ["slower start of energy shield recharge during any flask effect"] = "explicit.stat_1912660783",
    ["increased energy shield recharge rate during any flask effect"] = "explicit.stat_1827657795",
    ["if this area contains any unique monsters, one is possessed"] = "explicit.stat_1945607273",
    ["unique boss is augmented by player choices"] = "explicit.stat_338643834",
    ["passives granting fire resistance or all elemental resistances in radius also grant chance to block attack damage at of its value"] = "explicit.stat_3931143552",
    ["increased fishing line strength"] = "explicit.stat_1842038569",
    ["left ring slot: increased mana regeneration rate"] = "explicit.stat_195090426",
    ["shrines drop a currency item when used"] = "explicit.stat_2305944553",
    ["perandus monsters have a chance to drop perandus coins"] = "explicit.stat_3689836025",
    ["gain life when you taunt an enemy"] = "explicit.stat_3726536628",
    ["socketed skills have increased cast speed"] = "explicit.stat_3425934849",
    ["chance to avoid cold damage when hit"] = "explicit.stat_3743375737",
    ["chance to gain an endurance, frenzy or power charge when any of your traps are triggered by an enemy"] = "explicit.stat_710805027",
    ["skills which throw traps have blood magic"] = "explicit.stat_2420786978",
    ["area contains a rare monster carrying a tier 2 talisman"] = "explicit.stat_2589977608",
    ["life gained for each ignited enemy hit by your attacks"] = "explicit.stat_120895749",
    ["when a bloodline pack is slain, it drops a currency item"] = "explicit.stat_200299748",
    ["the first strongbox opened in this area is guarded by an additional rare monster"] = "explicit.stat_648923098",
    ["shrines grant a random additional shrine effect"] = "explicit.stat_1594755360",
    ["increased damage when you have no energy shield"] = "explicit.stat_414379784",
    ["trigger level elemental warding when you hit an enemy while cursed"] = "explicit.stat_810166817",
    ["reduced fishing pool consumption"] = "explicit.stat_1550221644",
    ["chance to trigger a socketed spell when you attack with a bow"] = "explicit.stat_3302736916",
    ["socketed spells have reduced mana cost"] = "explicit.stat_1688834903",
    ["perandus chests are guarded by additional rare monsters"] = "explicit.stat_2156472123",
    ["increased movement speed per 10 dexterity on allocated passives in radius"] = "explicit.stat_1795365307",
    ["more quantity of items dropped by imprisoned monsters"] = "explicit.stat_1436593527",
    ["monsters with silver coins drop an additional rare item"] = "explicit.stat_3877259945",
    ["regenerate mana per second if all equipped items are corrupted"] = "explicit.stat_2760138143",
    ["regenerate energy shield per second if all equipped items are corrupted"] = "explicit.stat_4156715241",
    ["chance to gain onslaught when you use a flask"] = "explicit.stat_1324450398",
    ["area contains yama the white"] = "explicit.stat_482341163",
    ["hits ignore enemy monster fire resistance while you are ignited"] = "explicit.stat_4040152475",
    ["more rarity of items dropped by imprisoned monsters"] = "explicit.stat_3130378100",
    ["10% chance to trigger level 18 summon spectral wolf on kill"] = "explicit.stat_1468606528",
    ["chance for kills to count twice for rampage"] = "explicit.stat_438351187",
    ["socketed gems gain of physical damage as extra lightning damage"] = "explicit.stat_1859937391",
    ["items dropped by rogue exiles are fully linked"] = "explicit.stat_898094766",
    ["additional physical damage reduction per 10 strength on allocated passives in radius"] = "explicit.stat_2519848087",
    ["area contains a gemcutter's strongbox"] = "explicit.stat_49998574",
    ["monsters fracture"] = "explicit.stat_637101875",
    ["chance to cast level 20 fire burst on hit"] = "explicit.stat_1621470436",
    ["the first time a player reaches rampage kills in this area, they will encounter a powerful monster"] = "explicit.stat_329336318",
    ["imprisoned monsters have reduced action speed"] = "explicit.stat_712621072",
    ["imprisoned monsters take increased damage"] = "explicit.stat_4003821677",
    ["increased attack and cast speed if you've hit an enemy recently"] = "explicit.stat_1483753325",
    ["nearby enemies have an additional chance to receive a critical strike"] = "explicit.stat_2371194429",
    ["increased damage per frenzy charge"] = "explicit.stat_902747843",
    ["you and nearby allies have to added fire damage per red socket"] = "explicit.stat_1666896662",
    ["you and nearby allies have to added chaos damage per white socket"] = "explicit.stat_3232695173",
    ["you and nearby allies have to added cold damage per green socket"] = "explicit.stat_2665149933",
    ["increased evasion rating per frenzy charge"] = "explicit.stat_660404777",
    ["you and nearby allies have to added lightning damage per blue socket"] = "explicit.stat_3726585224",
    ["rare monsters have chance to drop a rare prismatic ring"] = "explicit.stat_3266549586",
    ["nearby enemies have to all resistances"] = "explicit.stat_668145148",
    ["strongboxes in area have chance to contain an additional vaal orb"] = "explicit.stat_607308532",
    ["of energy shield regenerated per second for every 10 intelligence on allocated passives in radius"] = "explicit.stat_615595418",
    ["increased fishing range"] = "explicit.stat_170497091",
    ["players deal increased damage with hits to breach monsters"] = "explicit.stat_2908391015",
    ["players take reduced damage from breach monsters"] = "explicit.stat_1755438602",
    ["increased spell damage per 10 strength"] = "explicit.stat_1073314277",
    ["karui stone hook"] = "explicit.stat_2054162825",
    ["players take chaos damage per second"] = "explicit.stat_3031766225",
    ["chance to block spell damage is unlucky"] = "explicit.stat_3551025193",
    ["monsters with silver coins drop an additional currency item"] = "explicit.stat_1183247801",
    ["chance to block attack damage per 50 strength"] = "explicit.stat_1061631617",
    ["to fire damage per endurance charge"] = "explicit.stat_1073447019",
    ["increased movement speed per power charge"] = "explicit.stat_3774108776",
    ["to lightning damage per power charge"] = "explicit.stat_1917107159",
    ["cannot gain life during effect"] = "explicit.stat_1731620212",
    ["socketed skills have increased attack speed"] = "explicit.stat_2881124988",
    ["increased attack and cast speed per power charge"] = "explicit.stat_987588151",
    ["reduced chill duration on you"] = "explicit.stat_1874553720",
    ["adds to physical damage to attacks against frozen enemies"] = "explicit.stat_3856468419",
    ["gain life and mana from leech instantly during flask effect"] = "explicit.stat_1102362593",
    ["when a bloodline pack is slain, it drops a rare item"] = "explicit.stat_2309624770",
    ["players gain onslaught for seconds when they kill a rare monster"] = "explicit.stat_1260064327",
    ["of energy shield regenerated per second while on low life"] = "explicit.stat_115109959",
    ["rare monsters drop an additional rare item"] = "explicit.stat_3190223614",
    ["allocated small passive skills in radius grant nothing"] = "explicit.stat_325204898",
    ["items dropped by rogue exiles are mirrored"] = "explicit.stat_2047177714",
    ["monsters near shrines are chilled"] = "explicit.stat_2473016979",
    ["nearby enemies have reduced stun and block recovery"] = "explicit.stat_3169825297",
    ["rogue exiles each drop a skill gem with quality"] = "explicit.stat_3795004497",
    ["of physical attack damage leeched as mana per power charge"] = "explicit.stat_604298782",
    ["increased energy shield per power charge"] = "explicit.stat_2189382346",
    ["passives granting lightning resistance or all elemental resistances in radius also grant chance to block spell damage at of its value"] = "explicit.stat_1224928411",
    ["grants all bonuses of unallocated small passive skills in radius"] = "explicit.stat_737702863",
    ["chance that if you would gain endurance charges, you instead gain up to your maximum number of endurance charges"] = "explicit.stat_2713233613",
    ["increased movement speed per endurance charge"] = "explicit.stat_2116250000",
    ["increased armour per endurance charge"] = "explicit.stat_1447080724",
    ["increased attack and cast speed per endurance charge"] = "explicit.stat_3618888098",
    ["area contains a tormented embezzler"] = "explicit.stat_3884309250",
    ["area contains a keepers of the trove bloodline pack"] = "explicit.stat_2471600316",
    ["chaos damage can ignite, chill and shock"] = "explicit.stat_3470457445",
    ["gain soul eater for seconds when you use a vaal skill"] = "explicit.stat_161058250",
    ["chance that if you would gain frenzy charges, you instead gain up to your maximum number of frenzy charges"] = "explicit.stat_2119664154",
    ["passives granting cold resistance or all elemental resistances in radius also grant chance to dodge attack hits at of its value"] = "explicit.stat_1633583023",
    ["monsters possessed by tormented spirits take increased damage"] = "explicit.stat_261224780",
    ["nearby enemies grant increased flask charges"] = "explicit.stat_3547189490",
    ["chaos resistance against damage over time"] = "explicit.stat_2266636761",
    ["increased duration of shrine effects on players"] = "explicit.stat_495713612",
    ["increased damage per endurance charge"] = "explicit.stat_3515686789",
    ["reduced physical damage taken over time"] = "explicit.stat_511024200",
    ["adds to fire damage to attacks against ignited enemies"] = "explicit.stat_627339348",
    ["area contains a tormented vaal cultist"] = "explicit.stat_468681962",
    ["area contains an additional magic pack of wealth"] = "explicit.stat_3900181441",
    ["essences found in this area are a higher level"] = "explicit.stat_2996332612",
    ["gain of sword physical damage as extra fire damage"] = "explicit.stat_754005431",
    ["increased attack and movement speed with her blessing"] = "explicit.stat_2968804751",
    ["magic monsters take increased damage"] = "explicit.stat_3056215807",
    ["magic monsters are maimed"] = "explicit.stat_3879236300",
    ["chance to blind nearby enemies when gaining her blessing"] = "explicit.stat_2327728343",
    ["chance to gain her blessing for 3 seconds when you ignite an enemy"] = "explicit.stat_4203400545",
    ["chance to avoid being frozen, chilled or ignited with her blessing"] = "explicit.stat_1093704472",
    ["triggers level 20 spectral spirits when equipped"] = "explicit.stat_470688636",
    ["area contains an additional perandus jewellery box"] = "explicit.stat_1105638781",
    ["socketed gems have chance to ignite"] = "explicit.stat_3984519770",
    ["area contains a tormented seditionist"] = "explicit.stat_1077576866",
    ["players gain chance to dodge attack hits while under a shrine effect"] = "explicit.stat_3112480888",
    ["vaal skills used during effect do not apply soul gain prevention"] = "explicit.stat_2344590267",
    ["tempest effects have increased area of effect"] = "explicit.stat_3643076184",
    ["increased frequency of tempest effects"] = "explicit.stat_478341845",
    ["players regenerate of maximum life per second per 25 rampage kills"] = "explicit.stat_3072066782",
    ["vaal skills deal more damage during effect"] = "explicit.stat_4147528862",
    ["of damage leeched as life for skills used by totems"] = "explicit.stat_2449723897",
    ["gains no charges during effect of any soul ripper flask"] = "explicit.stat_2748763342",
    ["warbands in the area have an additional support member"] = "explicit.stat_1773553795",
    ["rare monsters are hindered, with reduced movement speed"] = "explicit.stat_3628993863",
    ["you can catch exotic fish"] = "explicit.stat_1471580517",
    ["invasion bosses are duplicated"] = "explicit.stat_442509523",
    ["if you have blocked recently, you and nearby allies regenerate of life per second"] = "explicit.stat_176085824",
    ["spreads tar when you block"] = "explicit.stat_2894567787",
    ["chance to gain a frenzy charge when hit"] = "explicit.stat_881914531",
    ["area contains a chayula breach"] = "explicit.stat_370321141",
    ["unaffected by curses"] = "explicit.stat_3809896400",
    ["corrupted blood cannot be inflicted on you"] = "explicit.stat_1658498488",
    ["a strongbox in this area is corrupted"] = "explicit.stat_2517911661",
    ["to maximum chaos resistance"] = "explicit.stat_1301765461",
    ["physical damage taken"] = "explicit.stat_321765853",
    ["socketed gems chain additional times"] = "explicit.stat_2788729902",
    ["essences found in this area are corrupted"] = "explicit.stat_1384838464",
    ["adds to physical damage against poisoned enemies"] = "explicit.stat_424026624",
    ["of damage against frozen enemies leeched as life"] = "explicit.stat_593279674",
    ["of damage against shocked enemies leeched as mana"] = "explicit.stat_112201073",
    ["area contains 3 additional magic packs which have increased attack, cast and movement speed, and drop more items"] = "explicit.stat_2244724505",
    ["ignore all movement penalties from armour"] = "explicit.stat_1311723478",
    ["area contains an additional fangjaw talisman"] = "explicit.stat_3381731475",
    ["area is controlled by a warband boss"] = "explicit.stat_1415399260",
    ["area contains an additional clutching talisman"] = "explicit.stat_2270693644",
    ["drops burning ground while moving, dealing fire damage per second"] = "explicit.stat_272791075",
    ["cannot be shocked or ignited while moving"] = "explicit.stat_3592330380",
    ["area contains an additional perandus treasury"] = "explicit.stat_3955574239",
    ["area is a maze"] = "explicit.stat_1959271744",
    ["increased critical strike chance per frenzy charge"] = "explicit.stat_707887043",
    ["warbands in the area have an additional elite member"] = "explicit.stat_3628411738",
    ["area is inhabited by an additional invasion boss"] = "explicit.stat_279246355",
    ["gain of lightning damage as extra chaos damage per power charge"] = "explicit.stat_3115319277",
    ["at least one perandus chest is guarded by a unique monster"] = "explicit.stat_341698555",
    ["chance to create shocked ground when hit"] = "explicit.stat_3355479537",
    ["chance to block attack damage per frenzy charge"] = "explicit.stat_2148784747",
    ["gain of fire damage as extra chaos damage per endurance charge"] = "explicit.stat_1109745356",
    ["the first time a player reaches rampage kills in this area, 6 currency items will drop"] = "explicit.stat_4048158159",
    ["to level of socketed intelligence gems"] = "explicit.stat_1719423857",
    ["items dropped by rogue exiles are corrupted"] = "explicit.stat_663447087",
    ["gain of cold damage as extra chaos damage per frenzy charge"] = "explicit.stat_3916799917",
    ["of energy shield regenerated per second if you've hit an enemy recently"] = "explicit.stat_588560583",
    ["chance to block attack damage per power charge"] = "explicit.stat_2856326982",
    ["chance to block attack damage per endurance charge"] = "explicit.stat_2355741828",
    ["additional physical damage reduction per frenzy charge"] = "explicit.stat_1226049915",
    ["clarity reserves no mana"] = "explicit.stat_2250543633",
    ["to evasion rating if hit an enemy recently"] = "explicit.stat_2935548106",
    ["of maximum life regenerated per second per power charge"] = "explicit.stat_3961213398",
    ["chance to recover 10% of maximum mana when you use a skill"] = "explicit.stat_308309328",
    ["increased critical strike chance per endurance charge"] = "explicit.stat_2547511866",
    ["to armour if you've hit an enemy recently"] = "explicit.stat_2368149582",
    ["chance to dodge attack hits per endurance charge"] = "explicit.stat_1893852470",
    ["purity of fire reserves no mana"] = "explicit.stat_2278589942",
    ["area contains an arcanist's strongbox"] = "explicit.stat_571003610",
    ["additional physical damage reduction per power charge"] = "explicit.stat_3986347319",
    ["area is larger"] = "explicit.stat_1012100113",
    ["area contains an essence of hysteria"] = "explicit.stat_445988468",
    ["chance to dodge attack hits per power charge"] = "explicit.stat_2163273007",
    ["players are cursed with warlord's mark"] = "explicit.stat_1877984956",
    ["purity of lightning reserves no mana"] = "explicit.stat_2308225900",
    ["purity of ice reserves no mana"] = "explicit.stat_1622979279",
    ["breaches contain a breachlord's clasped hand"] = "explicit.stat_488900289",
    ["reduced lightning damage taken"] = "explicit.stat_1276918229",
    ["anger reserves no mana"] = "explicit.stat_2189891129",
    ["chance to gain onslaught for 3 seconds when hit"] = "explicit.stat_3049760680",
    ["increased rarity of items found during any flask effect"] = "explicit.stat_301625329",
    ["reduced chaos damage taken"] = "explicit.stat_2960683632",
    ["breaches each contain a breachlord"] = "explicit.stat_1386808918",
    ["discipline reserves no mana"] = "explicit.stat_3708588508",
    ["monsters grant increased experience"] = "explicit.stat_598809739",
    ["monsters have increased attack, cast and movement speed"] = "explicit.stat_3909654181",
    ["hatred reserves no mana"] = "explicit.stat_1391583476",
    ["determination reserves no mana"] = "explicit.stat_1358697130",
    ["grace reserves no mana"] = "explicit.stat_2930404958",
    ["purity of elements reserves no mana"] = "explicit.stat_1826480903",
    ["vitality reserves no mana"] = "explicit.stat_438083873",
    ["items dropped by invasion bosses are fully linked"] = "explicit.stat_2004028089",
    ["items dropped by invasion bosses have an additional socket"] = "explicit.stat_444117960",
    ["minion instability"] = "explicit.stat_433293234",
    ["vaal pact"] = "explicit.stat_2257118425",
    ["of mana regenerated per second if you've hit an enemy recently"] = "explicit.stat_2602865453",
    ["elemental overload"] = "explicit.stat_3574189159",
    ["chance to gain a frenzy charge when you hit a rare or unique enemy"] = "explicit.stat_4179663748",
    ["increased effect of fortify on you"] = "explicit.stat_158779585",
    ["haste reserves no mana"] = "explicit.stat_751322171",
    ["invasion bosses drop an additional vaal orb"] = "explicit.stat_899928542",
    ["arrow dancing"] = "explicit.stat_2606808909",
    ["ghost reaver"] = "explicit.stat_4272248216",
    ["area contains an additional three rat talisman"] = "explicit.stat_2530071726",
    ["wrath reserves no mana"] = "explicit.stat_1865987277",
    ["iron reflexes"] = "explicit.stat_326965591",
    ["socketed gems are supported by level greater multiple projectiles"] = "explicit.stat_359450079",
    ["ancestral bond"] = "explicit.stat_2648570028",
    ["resolute technique"] = "explicit.stat_3943945975",
    ["reduced reflected damage taken"] = "explicit.stat_3846810663",
    ["socketed gems are supported by level swift affliction"] = "explicit.stat_1636220212",
    ["a beyond unique drops when the first unique monster from beyond is slain"] = "explicit.stat_1928796626",
    ["area contains a rare monster with inner treasure"] = "explicit.stat_3057529096",
    ["socketed gems are supported by level void manipulation"] = "explicit.stat_1866583932",
    ["elemental equilibrium"] = "explicit.stat_1263158408",
    ["cannot be chilled or frozen while moving"] = "explicit.stat_628032624",
    ["chance to gain arcane surge on hit with spells while at maximum power charges"] = "explicit.stat_813119588",
    ["grants level vaal impurity of fire skill"] = "explicit.stat_2700934265",
    ["socketed gems are supported by level minion and totem elemental resistance"] = "explicit.stat_514705332",
    ["you cannot be stunned while at maximum endurance charges"] = "explicit.stat_3780437763",
    ["you can apply an additional curse while at maximum power charges"] = "explicit.stat_761598374",
    ["envy reserves no mana"] = "explicit.stat_2503479316",
    ["chance to gain a flask charge when you deal a critical strike while at maximum frenzy charges"] = "explicit.stat_3371432622",
    ["you have vaal pact while at maximum endurance charges"] = "explicit.stat_1314418188",
    ["chance to gain a frenzy charge on hit"] = "explicit.stat_2323242761",
    ["area contains a unique strongbox"] = "explicit.stat_194037675",
    ["chance to gain onslaught for 4 seconds on hit while at maximum frenzy charges"] = "explicit.stat_2408544213",
    ["chance to intimidate enemies for 4 seconds on hit with attacks while at maximum endurance charges"] = "explicit.stat_2877370216",
    ["increased vaal skill damage"] = "explicit.stat_2257141320",
    ["you have iron reflexes while at maximum frenzy charges"] = "explicit.stat_1990354706",
    ["grants level vaal impurity of lightning skill"] = "explicit.stat_2959369472",
    ["perfect agony"] = "explicit.stat_3884934810",
    ["area is inhabited by bandits"] = "explicit.stat_643741006",
    ["you have mind over matter while at maximum power charges"] = "explicit.stat_1876857497",
    ["crimson dance"] = "explicit.stat_300702212",
    ["additional physical damage reduction during any flask effect"] = "explicit.stat_2693266036",
    ["grants level vaal impurity of ice skill"] = "explicit.stat_1300125165",
    ["socketed gems are supported by level culling strike"] = "explicit.stat_1135493957",
    ["gain an endurance charge every second if you've been hit recently"] = "explicit.stat_2894476716",
    ["a monster in this area will summon abaxoth when slain"] = "explicit.stat_1669870438",
    ["socketed gems are supported by level decay"] = "explicit.stat_388696990",
    ["increased fish bite sensitivity"] = "explicit.stat_1296614065",
    ["reduced elemental damage taken while stationary"] = "explicit.stat_3859593448",
    ["increased movement speed while on burning, chilled or shocked ground"] = "explicit.stat_1521863824",
    ["vaal pact"] = "explicit.stat_3204150184",
    ["socketed gems are supported by level empower"] = "explicit.stat_3581578643",
    ["area contains an additional unique talisman"] = "explicit.stat_3956623857",
    ["area contains an additional perandus locker"] = "explicit.stat_411810300",
    ["socketed gems are supported by level combustion"] = "explicit.stat_1828254451",
    ["socketed gems are supported by level damage on full life"] = "explicit.stat_2126431157",
    ["area contains a cartographer's strongbox"] = "explicit.stat_4197398087",
    ["area contains an additional perandus archive"] = "explicit.stat_3294034100",
    ["socketed gems are supported by level physical to lightning"] = "explicit.stat_3327487371",
    ["socketed gems are supported by level summon phantasm on kill"] = "explicit.stat_3155072742",
    ["socketed gems are supported by level pierce"] = "explicit.stat_2433615566",
    ["socketed gems are supported by level multi totem"] = "explicit.stat_807186595",
    ["socketed gems are supported by level enlighten"] = "explicit.stat_2065361612",
    ["socketed gems are supported by level chain"] = "explicit.stat_2643665787",
    ["adds to fire damage if you've blocked recently"] = "explicit.stat_3623716321",
    ["socketed gems are supported by level life gain on hit"] = "explicit.stat_2032386732",
    ["socketed gems are supported by level enhance"] = "explicit.stat_2556436882",
    ["socketed gems are supported by level deadly ailments"] = "explicit.stat_103909236",
    ["socketed gems are supported by level withering touch"] = "explicit.stat_3287477747",
    ["socketed gems are supported by level bonechill"] = "explicit.stat_1859244771",
    ["socketed gems are supported by level ignite proliferation"] = "explicit.stat_3593797653",
    ["socketed gems are supported by level stun"] = "explicit.stat_689720069",
    ["socketed gems are supported by level bloodlust"] = "explicit.stat_804508379",
    ["socketed gems are supported by level curse on hit"] = "explicit.stat_2697741965",
    ["socketed gems are supported by level mirage archer"] = "explicit.stat_3239503729",
    ["socketed gems are supported by level minefield"] = "explicit.stat_2805586447",
    ["socketed gems are supported by level multiple traps"] = "explicit.stat_3016436615",
    ["socketed gems are supported by level fork"] = "explicit.stat_2062753054",
    ["chill nearby enemies when you block"] = "explicit.stat_583277599",
    ["socketed gems are supported by level block chance reduction"] = "explicit.stat_1966051190",
    ["socketed gems are supported by level item quantity"] = "explicit.stat_248646071",
    ["projectiles pierce 2 additional targets"] = "explicit.stat_3640956958",
    ["socketed gems are supported by level storm barrier"] = "explicit.stat_4048257027",
    ["to maximum life"] = "implicit.stat_3299347043",
    ["increased global critical strike chance"] = "implicit.stat_587431675",
    ["increased spell damage"] = "implicit.stat_2974417149",
    ["to strength"] = "implicit.stat_4080418644",
    ["to maximum energy shield"] = "implicit.stat_3489782002",
    ["increased rarity of items found"] = "implicit.stat_3917489142",
    ["increased elemental damage"] = "implicit.stat_3141070085",
    ["to cold and lightning resistances"] = "implicit.stat_4277795662",
    ["to fire and cold resistances"] = "implicit.stat_2915988346",
    ["increased global accuracy rating"] = "implicit.stat_624954515",
    ["to fire and lightning resistances"] = "implicit.stat_3441501978",
    ["to all attributes"] = "implicit.stat_1379411836",
    ["has 1 socket"] = "implicit.stat_4077843608",
    ["increased stun duration on enemies"] = "implicit.stat_2517001139",
    ["increased global physical damage"] = "implicit.stat_1310194496",
    ["adds to physical damage to attacks"] = "implicit.stat_3032590688",
    ["to cold resistance"] = "implicit.stat_4220027924",
    ["to fire resistance"] = "implicit.stat_3372524247",
    ["to strength and intelligence"] = "implicit.stat_1535626285",
    ["has abyssal sockets"] = "implicit.stat_3527617737",
    ["to lightning resistance"] = "implicit.stat_1671376347",
    ["to all elemental resistances"] = "implicit.stat_2901986750",
    ["to global critical strike multiplier"] = "implicit.stat_3556824919",
    ["to dexterity and intelligence"] = "implicit.stat_2300185227",
    ["chance to block attack damage while wielding a staff (staves)"] = "implicit.stat_1001829678",
    ["to intelligence"] = "implicit.stat_328541901",
    ["to dexterity"] = "implicit.stat_3261801346",
    ["life gained for each enemy hit by attacks"] = "implicit.stat_821021828",
    ["to strength and dexterity"] = "implicit.stat_538848803",
    ["increased mana regeneration rate"] = "implicit.stat_789117908",
    ["increased stun and block recovery"] = "implicit.stat_2511217560",
    ["to chaos resistance"] = "implicit.stat_2923486259",
    ["to maximum mana"] = "implicit.stat_1050105434",
    ["increased movement speed"] = "implicit.stat_2250533757",
    ["to accuracy rating (local)"] = "implicit.stat_691932474",
    ["reduced enemy stun threshold"] = "implicit.stat_1443060084",
    ["life regenerated per second"] = "implicit.stat_3325883026",
    ["properties are doubled while in a breach"] = "implicit.stat_202275580",
    ["increased critical strike chance"] = "implicit.stat_2375316951",
    ["increased accuracy rating (local)"] = "implicit.stat_3647521724",
    ["of physical attack damage leeched as life"] = "implicit.stat_3593843976",
    ["creates consecrated ground on use"] = "implicit.stat_2146730404",
    ["increased elemental damage with attack skills"] = "implicit.stat_387439868",
    ["minions deal increased damage"] = "implicit.stat_1589917703",
    ["adds to physical damage to bow attacks"] = "implicit.stat_1760576992",
    ["increased block recovery"] = "implicit.stat_369183568",
    ["of life regenerated per second"] = "implicit.stat_836936635",
    ["increased melee damage"] = "implicit.stat_1002362373",
    ["unique boss has increased area of effect"] = "implicit.stat_3040667106",
    ["arrows pierce an additional target"] = "implicit.stat_3423006863",
    ["creates a smoke cloud on use"] = "implicit.stat_538730182",
    ["unique boss has increased life"] = "implicit.stat_1959158336",
    ["unique boss has increased attack and cast speed"] = "implicit.stat_2109106920",
    ["unique boss deals increased damage"] = "implicit.stat_124877078",
    ["increased projectile attack damage"] = "implicit.stat_2162876159",
    ["increased area of effect"] = "implicit.stat_280731498",
    ["increased cast speed"] = "implicit.stat_2891184298",
    ["chance to dodge attack hits"] = "implicit.stat_2749862839",
    ["chance to dodge spell hits"] = "implicit.stat_696707743",
    ["mana gained for each enemy hit by attacks"] = "implicit.stat_640052854",
    ["adds to fire damage to bow attacks"] = "implicit.stat_3120164895",
    ["increased damage"] = "implicit.stat_2154246560",
    ["increased maximum life"] = "implicit.stat_983749596",
    ["life gained for each enemy hit by your attacks"] = "implicit.stat_2797971005",
    ["to armour and evasion rating"] = "implicit.stat_2316658489",
    ["damage penetrates elemental resistances"] = "implicit.stat_2101383955",
    ["increased strength"] = "implicit.stat_734614379",
    ["increased dexterity"] = "implicit.stat_4139681126",
    ["increased intelligence"] = "implicit.stat_656461285",
    ["you cannot be cursed with silence"] = "implicit.stat_1654414582",
    ["chance to block attack damage"] = "implicit.stat_2530372417",
    ["to level of socketed gems"] = "implicit.stat_2843100721",
    ["to maximum number of zombies"] = "implicit.stat_1652515349",
    ["increased chaos damage"] = "implicit.stat_736967255",
    ["increased lightning damage"] = "implicit.stat_2231156303",
    ["increased effect of non-damaging ailments on enemies"] = "implicit.stat_782230869",
    ["increased fire damage"] = "implicit.stat_3962278098",
    ["increased cold damage"] = "implicit.stat_3291658075",
    ["increased attack speed (local)"] = "implicit.stat_210067635",
    ["you cannot be hindered"] = "implicit.stat_721014846",
    ["increased attack and cast speed"] = "implicit.stat_2672805335",
    ["increased attack damage"] = "implicit.stat_2843214518",
    ["chance to cause bleeding on hit"] = "implicit.stat_1519615863",
    ["increased maximum mana"] = "implicit.stat_2748665614",
    ["to maximum frenzy charges"] = "implicit.stat_4078695",
    ["corrupted blood cannot be inflicted on you"] = "implicit.stat_1658498488",
    ["you cannot be maimed"] = "implicit.stat_1126826428",
    ["creates chilled ground on use"] = "implicit.stat_3311869501",
    ["increased quantity of items found"] = "implicit.stat_884586851",
    ["increased mana reserved"] = "implicit.stat_2227180465",
    ["reflects physical damage to melee attackers"] = "implicit.stat_3767873853",
    ["hatred has increased aura effect"] = "implicit.stat_3742945352",
    ["increased maximum energy shield"] = "implicit.stat_2482852589",
    ["wrath has increased aura effect"] = "implicit.stat_2181791238",
    ["increased attack speed"] = "implicit.stat_681332047",
    ["discipline has increased aura effect"] = "implicit.stat_788317702",
    ["anger has increased aura effect"] = "implicit.stat_1592278124",
    ["increased attributes"] = "implicit.stat_3143208761",
    ["increased global defences"] = "implicit.stat_1389153006",
    ["gain of physical damage as extra damage of a random element"] = "implicit.stat_3753703249",
    ["grace has increased aura effect"] = "implicit.stat_397427740",
    ["chance to freeze, shock and ignite"] = "implicit.stat_800141891",
    ["of fire damage leeched as life"] = "implicit.stat_3848282610",
    ["projectiles pierce an additional target"] = "implicit.stat_2067062068",
    ["of lightning damage leeched as life"] = "implicit.stat_80079005",
    ["of cold damage leeched as life"] = "implicit.stat_3999401129",
    ["determination has increased aura effect"] = "implicit.stat_3653400807",
    ["increased skill effect duration"] = "implicit.stat_3377888098",
    ["area contains a monster possessed by an ancient talisman"] = "implicit.stat_1900164129",
    ["area contains up to 1 monster imprisoned by essences"] = "implicit.stat_1050286373",
    ["you can apply an additional curse"] = "implicit.stat_30642521",
    ["area contains a breach"] = "implicit.stat_392469782",
    ["area contains a rogue exile"] = "implicit.stat_548865797",
    ["slaying enemies close together can attract monsters from beyond this realm"] = "implicit.stat_1837040413",
    ["to level of socketed aoe gems"] = "implicit.stat_2551600084",
    ["area contains a tormented spirit"] = "implicit.stat_2949489150",
    ["to maximum endurance charges"] = "implicit.stat_1515657623",
    ["to level of socketed vaal gems"] = "implicit.stat_1170386874",
    ["to level of socketed duration gems"] = "implicit.stat_2115168758",
    ["area contains at least 1 warband pack"] = "implicit.stat_3907094951",
    ["to level of socketed curse gems"] = "implicit.stat_3691695237",
    ["to level of socketed aura gems"] = "implicit.stat_2452998583",
    ["additional physical damage reduction"] = "implicit.stat_3771516363",
    ["to level of socketed projectile gems"] = "implicit.stat_2176571093",
    ["area contains a strongbox"] = "implicit.stat_2570943032",
    ["adds to chaos damage to attacks"] = "implicit.stat_674553446",
    ["culling strike"] = "implicit.stat_2524254339",
    ["slaying enemies in a kill streak grants rampage bonuses"] = "implicit.stat_452077019",
    ["grants level clarity skill"] = "implicit.stat_3511815065",
    ["curse enemies with level vulnerability on hit"] = "implicit.stat_3967845372",
    ["to level of socketed trap or mine gems"] = "implicit.stat_150668988",
    ["area contains a perandus chest"] = "implicit.stat_49787903",
    ["chance to block spell damage"] = "implicit.stat_561307714",
    ["physical damage taken from attacks"] = "implicit.stat_3441651621",
    ["adds to chaos damage (local)"] = "implicit.stat_2223678961",
    ["area contains up to 1 shrine"] = "implicit.stat_2878321598",
    ["area contains additional magic monsters"] = "implicit.stat_581013336",
    ["magic monster packs each have a bloodline mod"] = "implicit.stat_97115311",
    ["area contains a silver coin"] = "implicit.stat_585159631",
    ["area has a chance to contain cadiro perandus"] = "implicit.stat_3788235244",
    ["to critical strike multiplier during any flask effect"] = "implicit.stat_240289863",
    ["bow attacks fire an additional arrow"] = "implicit.stat_742529963",
    ["curse enemies with level temporal chains on hit"] = "implicit.stat_3433724931",
    ["grants level purity of elements skill"] = "implicit.stat_105466375",
    ["curse enemies with level elemental weakness on hit"] = "implicit.stat_2028847114",
    ["increased critical strike chance during any flask effect"] = "implicit.stat_2898434123",
    ["increased attack speed during any flask effect"] = "implicit.stat_1365052901",
    ["to level of socketed warcry gems"] = "implicit.stat_1672793731",
    ["rare monsters each have a nemesis mod"] = "implicit.stat_2391261970",
    ["area contains additional rare monsters"] = "implicit.stat_2810286377",
    ["area contains an invasion boss"] = "implicit.stat_3849207804",
    ["to all maximum resistances"] = "implicit.stat_569299859",
    ["of damage taken gained as mana over 4 seconds when hit"] = "implicit.stat_472520716",
    ["monsters have onslaught"] = "implicit.stat_1277237365",
    ["chance to gain a frenzy charge on kill"] = "implicit.stat_1826802197",
    ["increased movement speed during any flask effect"] = "implicit.stat_304970526",
    ["increased cast speed during any flask effect"] = "implicit.stat_252194507",
    ["grants level purity of fire skill"] = "implicit.stat_3970432307",
    ["grants level purity of ice skill"] = "implicit.stat_4193390599",
    ["grants level purity of lightning skill"] = "implicit.stat_3822878124",
    ["increased vaal skill damage"] = "implicit.stat_2257141320",
    ["increased endurance, frenzy and power charge duration"] = "implicit.stat_2839036860",
    ["can have up to additional trap placed at a time"] = "implicit.stat_2224292784",
    ["increased life leeched per second for each corrupted item equipped"] = "implicit.stat_3815042054",
    ["curse enemies with level despair on hit"] = "implicit.stat_2764915899",
    ["resolute technique"] = "implicit.stat_3943945975",
    ["increased chaos damage for each corrupted item equipped"] = "implicit.stat_4004011170",
    ["socketed gems are supported by level cast on critical strike"] = "implicit.stat_2325632050",
    ["increased mana leeched per second for each corrupted item equipped"] = "implicit.stat_2679819855",
    ["chance to gain onslaught for 4 seconds on kill"] = "implicit.stat_3023957681",
    ["cannot be knocked back"] = "implicit.stat_4212255859",
    ["chance to gain a power charge on kill"] = "implicit.stat_2483795307",
    ["to weapon range"] = "implicit.stat_350598685",
    ["chance to gain an endurance charge on kill"] = "implicit.stat_1054322244",
    ["attacks have to critical strike chance"] = "implicit.stat_2572042788",
    ["increased physical damage (local)"] = "implicit.stat_1805374733",
    ["chance to gain a power charge on critical strike"] = "implicit.stat_3814876985",
    ["curse enemies with level enfeeble on hit"] = "implicit.stat_1625819882",
    ["spells have to critical strike chance "] = "implicit.stat_791835907",
    ["increased damage while dead"] = "implicit.stat_3582580206",
    ["adds to lightning damage (local)"] = "implicit.stat_3336890334",
    ["reduced chill duration on you"] = "implicit.stat_1874553720",
    ["reduced shock duration on you"] = "implicit.stat_99927264",
    ["grants level haste skill"] = "implicit.stat_1188846263",
    ["reduced freeze duration on you"] = "implicit.stat_2160282525",
    ["reduced ignite duration on you"] = "implicit.stat_986397080",
    ["to maximum power charges"] = "implicit.stat_227523295",
    ["chance to avoid being shocked"] = "implicit.stat_1871765599",
    ["adds to physical damage (local)"] = "implicit.stat_1940865751",
    ["life and mana gained for each enemy hit"] = "implicit.stat_1420170973",
    ["grants fortify on melee hit"] = "implicit.stat_1166417447",
    ["socketed gems are supported by level cast when stunned"] = "implicit.stat_1079148723",
    ["chance to avoid being ignited"] = "implicit.stat_1783006896",
    ["adds to fire damage (local)"] = "implicit.stat_709508406",
    ["projectiles pierce additional targets"] = "implicit.stat_2902845638",
    ["additional chance to receive a critical strike"] = "implicit.stat_1437192935",
    ["socketed skill gems get a mana multiplier"] = "implicit.stat_2865550257",
    ["point blank"] = "implicit.stat_2896346114",
    ["increased character size"] = "implicit.stat_1408638732",
    ["projectiles deal increased damage for each time they have chained"] = "implicit.stat_1923210508",
    ["adds to cold damage (local)"] = "implicit.stat_1037193709",
    ["you take reduced extra damage from critical strikes"] = "implicit.stat_3855016469",
    ["adds to lightning damage to bow attacks"] = "implicit.stat_1040269876",
    ["gain of physical damage as extra lightning damage"] = "implicit.stat_219391121",
    ["grants level assassin's mark skill"] = "implicit.stat_3736925508",
    ["gain of physical damage as extra fire damage"] = "implicit.stat_369494213",
    ["gain of physical damage as extra cold damage"] = "implicit.stat_979246511",
    ["chance to block attack damage while dual wielding"] = "implicit.stat_2166444903",
    ["chance to cause monsters to flee"] = "implicit.stat_3181974858",
    ["of lightning damage from hits taken as fire damage"] = "implicit.stat_3375859421",
    ["projectiles deal increased damage for each enemy pierced"] = "implicit.stat_883169830",
    ["of fire damage from hits taken as lightning damage"] = "implicit.stat_1504091975",
    ["grants level temporal chains skill"] = "implicit.stat_940324562",
    ["adds to cold damage to bow attacks"] = "implicit.stat_215124030",
    ["of cold damage from hits taken as fire damage"] = "implicit.stat_1189760108",
    ["of fire damage from hits taken as cold damage"] = "implicit.stat_2522672898",
    ["of cold damage from hits taken as lightning damage"] = "implicit.stat_1313503107",
    ["of lightning damage from hits taken as cold damage"] = "implicit.stat_1017730114",
    ["grants level vitality skill"] = "implicit.stat_2410613176",
    ["grants level frostbite skill"] = "implicit.stat_1169502663",
    ["chance to avoid being frozen"] = "implicit.stat_1514829491",
    ["adds to lightning damage to spells and attacks"] = "implicit.stat_2885144362",
    ["grants level flammability skill"] = "implicit.stat_2209668839",
    ["socketed gems are supported by level melee splash"] = "implicit.stat_1811422871",
    ["item sells for much more to vendors"] = "implicit.stat_3513534186",
    ["grants level conductivity skill"] = "implicit.stat_461472247",
    ["adds to cold damage to spells and attacks"] = "implicit.stat_1662717006",
    ["adds to fire damage to spells and attacks"] = "implicit.stat_3964634628",
    ["life regenerated per second while moving"] = "implicit.stat_2841027131",
    ["additional physical damage reduction while stationary"] = "implicit.stat_2181129193",
    ["to global evasion rating while moving"] = "implicit.stat_3825877290",
    ["mana gained for each enemy hit by your attacks"] = "implicit.stat_820939409",
    ["socketed gems are supported by level onslaught"] = "implicit.stat_3237923082",
    ["chance to dodge spell hits while moving"] = "implicit.stat_682182849",
    ["chance to gain unholy might for 3 seconds on kill"] = "implicit.stat_3562211447",
    ["chance to dodge attack hits while moving"] = "implicit.stat_845428765",
    ["grants level hatred skill"] = "implicit.stat_2429546158",
    ["grants level anger skill"] = "implicit.stat_484879947",
    ["adds to fire damage to attacks"] = "implicit.stat_1573130764",
    ["increased fire damage taken"] = "implicit.stat_3743301799",
    ["reduced chaos damage taken"] = "implicit.stat_2960683632",
    ["armour while stationary"] = "implicit.stat_2551779822",
    ["reduced cold damage taken"] = "implicit.stat_3303114033",
    ["reduced lightning damage taken"] = "implicit.stat_1276918229",
    ["grants level projectile weakness skill"] = "implicit.stat_3536689603",
    ["grants level wrath skill"] = "implicit.stat_2265307453",
    ["grants level despair skill"] = "implicit.stat_2044547677",
    ["of physical damage converted to fire damage"] = "implicit.stat_1533563525",
    ["of physical damage converted to lightning damage"] = "implicit.stat_3240769289",
    ["to level of socketed fire gems"] = "implicit.stat_339179093",
    ["cannot be poisoned"] = "implicit.stat_3835551335",
    ["to level of socketed lightning gems"] = "implicit.stat_4043416969",
    ["chance to gain an endurance charge when you stun an enemy"] = "implicit.stat_1582887649",
    ["to level of socketed cold gems"] = "implicit.stat_1645459191",
    ["of physical damage converted to cold damage"] = "implicit.stat_2133341901",
    ["increased burning damage"] = "implicit.stat_1175385867",
    ["skills fire an additional projectile"] = "implicit.stat_74338099",
    ["adds to lightning damage to attacks"] = "implicit.stat_1754445556",
    ["socketed gems are supported by level fortify"] = "implicit.stat_107118693",
    ["socketed gems are supported by level multistrike"] = "implicit.stat_2501237765",
    ["adds to cold damage to attacks"] = "implicit.stat_4067062424",
    ["increased effect of shock"] = "implicit.stat_2527686725",
    ["cannot be blinded"] = "implicit.stat_1436284579",
    ["increased effect of chill"] = "implicit.stat_828179689",
    ["socketed gems are supported by level additional accuracy"] = "implicit.stat_1567462963",
    ["of physical damage from hits taken as fire damage"] = "implicit.stat_3342989455",
    ["chance to block spell damage"] = "implicit.stat_2881111359",
    ["of physical damage from hits taken as lightning damage"] = "implicit.stat_425242359",
    ["of damage is taken from mana before life"] = "implicit.stat_458438597",
    ["of physical damage from hits taken as cold damage"] = "implicit.stat_1871056256",
    ["gain a frenzy charge after spending a total of 200 mana"] = "implicit.stat_3868549606",
    ["of physical damage from hits taken as chaos damage"] = "implicit.stat_4129825612",
    ["increased attack damage against bleeding enemies"] = "implicit.stat_3944782785",
    ["socketed gems are supported by level elemental proliferation"] = "implicit.stat_2929101122",
    ["socketed gems are supported by level faster projectiles"] = "implicit.stat_99089516",
    ["grants level elemental weakness skill"] = "implicit.stat_3792821911",
    ["enemies cannot leech life from you"] = "implicit.stat_4293455942",
    ["to maximum chance to block attack damage"] = "implicit.stat_4124805414",
    ["socketed gems are supported by level life leech"] = "implicit.stat_891277550",
    ["socketed gems are supported by level blind"] = "implicit.stat_2223640518",
    ["reduced area damage taken from hits"] = "implicit.stat_3001376862",
    ["socketed gems are supported by level fork"] = "implicit.stat_2062753054",
    ["chance to block (shields)"] = "implicit.stat_4253454700",
    ["reduced damage taken from projectiles"] = "implicit.stat_1425651005",
    ["grants level discipline skill"] = "implicit.stat_2341269061",
    ["grants level determination skill"] = "implicit.stat_4265392510",
    ["grants level grace skill"] = "implicit.stat_2867050084",
    ["increased damage over time"] = "implicit.stat_967627487",
    ["skills chain times"] = "implicit.stat_1787073323",
    ["socketed gems are supported by level reduced mana"] = "implicit.stat_1866911844",
    ["socketed gems are supported by level faster casting"] = "implicit.stat_2169938251",
    ["socketed gems are supported by level life gain on hit"] = "implicit.stat_2032386732",
    ["grants level vulnerability skill"] = "implicit.stat_1447222021",
    ["socketed gems are supported by level blood magic"] = "implicit.stat_3922006600",
    ["socketed gems are supported by level increased critical damage"] = "implicit.stat_1108755349",
    ["increased projectile speed"] = "implicit.stat_3759663284",
    ["socketed gems are supported by level elemental damage with attacks"] = "implicit.stat_2532625478",
    ["socketed gems are supported by level stun"] = "implicit.stat_689720069",
    ["arrows pierce 1 additional target"] = "implicit.stat_3492025235",
    ["socketed gems are supported by level added fire damage"] = "implicit.stat_2572192375",
    ["socketed gems are supported by level increased area of effect"] = "implicit.stat_3720936304",
    ["increased fish bite sensitivity"] = "implicit.stat_1296614065",
    ["bleeding cannot be inflicted on you"] = "implicit.stat_1901158930",
    ["you can catch corrupted fish"] = "implicit.stat_2451060005",
    ["increased rarity of fish caught"] = "implicit.stat_3310914132",
    ["increased quantity of fish caught"] = "implicit.stat_3802667447",
    ["to maximum life"] = "crafted.stat_3299347043",
    ["increased elemental damage with attack skills"] = "crafted.stat_387439868",
    ["to lightning resistance"] = "crafted.stat_1671376347",
    ["to fire resistance"] = "crafted.stat_3372524247",
    ["to cold resistance"] = "crafted.stat_4220027924",
    ["to maximum mana"] = "crafted.stat_1050105434",
    ["increased energy shield"] = "crafted.stat_4015621042",
    ["increased spell damage"] = "crafted.stat_2974417149",
    ["increased movement speed"] = "crafted.stat_2250533757",
    ["increased physical damage (local)"] = "crafted.stat_1805374733",
    ["to all elemental resistances"] = "crafted.stat_2901986750",
    ["increased attack speed (local)"] = "crafted.stat_210067635",
    ["increased global critical strike chance"] = "crafted.stat_587431675",
    ["increased damage"] = "crafted.stat_2154246560",
    ["adds to physical damage (local)"] = "crafted.stat_1940865751",
    ["to maximum energy shield"] = "crafted.stat_3489782002",
    ["increased armour (local)"] = "crafted.stat_1062208444",
    ["to maximum energy shield (local)"] = "crafted.stat_4052037485",
    ["to quality"] = "crafted.stat_2016708976",
    ["can have multiple crafted modifiers"] = "crafted.stat_1859333175",
    ["adds to physical damage to attacks"] = "crafted.stat_3032590688",
    ["to cold and lightning resistances"] = "crafted.stat_4277795662",
    ["to fire and cold resistances"] = "crafted.stat_2915988346",
    ["gain of non-chaos damage as extra chaos damage"] = "crafted.stat_2063695047",
    ["increased evasion rating (local)"] = "crafted.stat_124859000",
    ["to fire and lightning resistances"] = "crafted.stat_3441501978",
    ["increased critical strike chance"] = "crafted.stat_2375316951",
    ["to strength"] = "crafted.stat_4080418644",
    ["adds to lightning damage to attacks"] = "crafted.stat_1754445556",
    ["to dexterity"] = "crafted.stat_3261801346",
    ["increased maximum energy shield"] = "crafted.stat_2482852589",
    ["adds to cold damage"] = "crafted.stat_2387423236",
    ["adds to lightning damage"] = "crafted.stat_1334060246",
    ["to intelligence"] = "crafted.stat_328541901",
    ["to lightning and chaos resistances"] = "crafted.stat_3465022881",
    ["to fire and chaos resistances"] = "crafted.stat_378817135",
    ["to cold and chaos resistances"] = "crafted.stat_3393628375",
    ["increased lightning damage"] = "crafted.stat_2231156303",
    ["increased area of effect"] = "crafted.stat_280731498",
    ["adds to fire damage"] = "crafted.stat_321077055",
    ["increased attack speed"] = "crafted.stat_681332047",
    ["of damage taken gained as mana over 4 seconds when hit"] = "crafted.stat_472520716",
    ["increased maximum life"] = "crafted.stat_983749596",
    ["increased maximum mana"] = "crafted.stat_2748665614",
    ["increased cast speed"] = "crafted.stat_2891184298",
    ["increased armour and evasion"] = "crafted.stat_2451402625",
    ["increased fire damage"] = "crafted.stat_3962278098",
    ["to global critical strike multiplier"] = "crafted.stat_3556824919",
    ["increased armour and energy shield"] = "crafted.stat_3321629045",
    ["increased attack and cast speed"] = "crafted.stat_2672805335",
    ["increased evasion and energy shield"] = "crafted.stat_1999113824",
    ["increased critical strike chance for spells"] = "crafted.stat_737908626",
    ["attacks with this weapon penetrate elemental resistances"] = "crafted.stat_4064396395",
    ["reduced mana cost of skills"] = "crafted.stat_474294393",
    ["increased area damage"] = "crafted.stat_4251717817",
    ["to armour"] = "crafted.stat_809229260",
    ["to strength and dexterity"] = "crafted.stat_538848803",
    ["to strength and intelligence"] = "crafted.stat_1535626285",
    ["increased effect of flasks on you"] = "crafted.stat_114734841",
    ["to dexterity and intelligence"] = "crafted.stat_2300185227",
    ["adds to fire damage to attacks"] = "crafted.stat_1573130764",
    ["increased cold damage"] = "crafted.stat_3291658075",
    ["to level of socketed aoe gems"] = "crafted.stat_2551600084",
    ["increased chaos damage"] = "crafted.stat_736967255",
    ["adds to cold damage to attacks"] = "crafted.stat_4067062424",
    ["chance to gain onslaught for 4 seconds on kill"] = "crafted.stat_3023957681",
    ["to melee weapon and unarmed attack range"] = "crafted.stat_2264295449",
    ["adds to lightning damage to spells"] = "crafted.stat_2831165374",
    ["to critical strike multiplier if you've shattered an enemy recently"] = "crafted.stat_536929014",
    ["chance to cause bleeding on hit"] = "crafted.stat_1519615863",
    ["to total mana cost of skills"] = "crafted.stat_3736589033",
    ["shock nearby enemies for seconds when you focus"] = "crafted.stat_3031766858",
    ["to level of socketed projectile gems"] = "crafted.stat_2176571093",
    ["projectiles pierce an additional target"] = "crafted.stat_2067062068",
    ["chance to impale enemies on hit with attacks"] = "crafted.stat_725880290",
    ["increased mana regeneration rate"] = "crafted.stat_789117908",
    ["to evasion rating"] = "crafted.stat_2144192055",
    ["increased global physical damage"] = "crafted.stat_1310194496",
    ["faster start of energy shield recharge"] = "crafted.stat_1782086450",
    ["chance to trigger a socketed spell when you use a skill"] = "crafted.stat_3079007202",
    ["chance to blind enemies on hit"] = "crafted.stat_2301191210",
    ["to armour (local)"] = "crafted.stat_3484657501",
    ["increased armour, evasion and energy shield"] = "crafted.stat_3523867985",
    ["chance to poison on hit (local)"] = "crafted.stat_3885634897",
    ["to all attributes"] = "crafted.stat_1379411836",
    ["energy shield regenerated per second while a rare or unique enemy is nearby"] = "crafted.stat_2238019079",
    ["chance to deal double damage"] = "crafted.stat_1172810729",
    ["chance to avoid being chilled"] = "crafted.stat_3483999943",
    ["mana regenerated per second"] = "crafted.stat_4291461939",
    ["increased projectile speed"] = "crafted.stat_3759663284",
    ["increased movement speed if you haven't been hit recently"] = "crafted.stat_1177358866",
    ["increased projectile damage"] = "crafted.stat_1839076647",
    ["critical strike multiplier while there is a rare or unique enemy nearby"] = "crafted.stat_3992439283",
    ["increased effect of non-damaging ailments on enemies"] = "crafted.stat_782230869",
    ["minions deal increased damage"] = "crafted.stat_1589917703",
    ["to evasion rating (local)"] = "crafted.stat_53045048",
    ["chance to gain arcane surge when you kill an enemy"] = "crafted.stat_573223427",
    ["adds to chaos damage to attacks"] = "crafted.stat_674553446",
    ["increased damage while leeching"] = "crafted.stat_310246444",
    ["of physical attack damage leeched as life"] = "crafted.stat_3593843976",
    ["increased flask charges gained"] = "crafted.stat_1452809865",
    ["to armour and evasion rating"] = "crafted.stat_2316658489",
    ["to level of socketed melee gems"] = "crafted.stat_829382474",
    ["adds to lightning damage (local)"] = "crafted.stat_3336890334",
    ["increased elemental damage if you've dealt a critical strike recently"] = "crafted.stat_2379781920",
    ["increased flask life recovery rate"] = "crafted.stat_51994685",
    ["adds to cold damage (local)"] = "crafted.stat_1037193709",
    ["increased trap throwing speed"] = "crafted.stat_118398748",
    ["chance to shock"] = "crafted.stat_1538773178",
    ["you have vaal pact while focussed"] = "crafted.stat_2022851697",
    ["of damage leeched as life while focussed"] = "crafted.stat_3324747104",
    ["increased totem placement speed"] = "crafted.stat_3374165039",
    ["to accuracy rating (local)"] = "crafted.stat_691932474",
    ["chance to trigger level 1 blood rage when you kill an enemy"] = "crafted.stat_205619502",
    ["increased damage during any flask effect"] = "crafted.stat_2947215268",
    ["increased rarity of items found"] = "crafted.stat_3917489142",
    ["increased brand attachment range"] = "crafted.stat_4223377453",
    ["increased melee damage"] = "crafted.stat_1002362373",
    ["of life regenerated per second during any flask effect"] = "crafted.stat_3500911418",
    ["increased attack speed while a rare or unique enemy is nearby"] = "crafted.stat_314741699",
    ["chance to deal double damage while focussed"] = "crafted.stat_2908886986",
    ["chance to freeze"] = "crafted.stat_2309614417",
    ["of physical damage converted to cold damage"] = "crafted.stat_2133341901",
    ["chance to ignite"] = "crafted.stat_1335054179",
    ["minions have increased maximum life"] = "crafted.stat_770672621",
    ["increased mine laying speed"] = "crafted.stat_1896971621",
    ["chance for your flasks to not consume charges"] = "crafted.stat_311641062",
    ["of physical damage converted to fire damage"] = "crafted.stat_1533563525",
    ["of physical damage converted to lightning damage"] = "crafted.stat_3240769289",
    ["increased cooldown recovery speed"] = "crafted.stat_1004011302",
    ["adds to fire damage (local)"] = "crafted.stat_709508406",
    ["increased damage over time"] = "crafted.stat_967627487",
    ["to cold damage over time multiplier"] = "crafted.stat_3993576199",
    ["of life regenerated per second"] = "crafted.stat_836936635",
    ["to minimum power charges"] = "crafted.stat_1999711879",
    ["to minimum frenzy charges"] = "crafted.stat_658456881",
    ["adds to cold damage to spells"] = "crafted.stat_2469416729",
    ["cannot roll attack modifiers"] = "crafted.stat_4122424929",
    ["to minimum endurance charges"] = "crafted.stat_3706959521",
    ["chaos skills have increased skill effect duration"] = "crafted.stat_289885185",
    ["increased flask effect duration"] = "crafted.stat_3741323227",
    ["to maximum number of zombies"] = "crafted.stat_1652515349",
    ["to maximum number of skeletons"] = "crafted.stat_2428829184",
    ["increased armour"] = "crafted.stat_2866361420",
    ["chance to dodge attack hits while focussed"] = "crafted.stat_2590156965",
    ["non-vaal skills deal increased damage during soul gain prevention"] = "crafted.stat_1583385065",
    ["minions have increased attack speed"] = "crafted.stat_3375935924",
    ["adds to fire damage to spells"] = "crafted.stat_1133016593",
    ["minions have increased cast speed"] = "crafted.stat_4000101551",
    ["of physical damage from hits taken as fire damage"] = "crafted.stat_3342989455",
    ["to armour during soul gain prevention"] = "crafted.stat_1539825365",
    ["cannot roll caster modifiers"] = "crafted.stat_1149326139",
    ["attacks with this weapon penetrate chaos resistance"] = "crafted.stat_3762412853",
    ["to accuracy rating"] = "crafted.stat_803737631",
    ["additional physical damage reduction while focussed"] = "crafted.stat_3753650187",
    ["skills cost no mana while focussed"] = "crafted.stat_849152640",
    ["adds to chaos damage if you've dealt a critical strike recently"] = "crafted.stat_2523334466",
    ["hits can't be evaded"] = "crafted.stat_4126210832",
    ["increased critical strike chance during flask effect"] = "crafted.stat_2008255263",
    ["recover of mana and energy shield when you focus"] = "crafted.stat_2992263716",
    ["you can apply an additional curse"] = "crafted.stat_30642521",
    ["chance to dodge spell hits"] = "crafted.stat_696707743",
    ["chance to trigger level 18 summon spectral wolf on kill"] = "crafted.stat_1785942004",
    ["of physical attack damage leeched as mana"] = "crafted.stat_3237948413",
    ["to non-ailment chaos damage over time multiplier"] = "crafted.stat_1653010703",
    ["chance to avoid being frozen"] = "crafted.stat_1514829491",
    ["chance to trigger socketed spells when you focus"] = "crafted.stat_2062792091",
    ["increased damage per frenzy charge"] = "crafted.stat_902747843",
    ["to quality of socketed gems"] = "crafted.stat_3828613551",
    ["increased evasion rating"] = "crafted.stat_2106365538",
    ["increased duration of ailments you inflict while focussed"] = "crafted.stat_1840751341",
    ["increased damage per power charge"] = "crafted.stat_2034658008",
    ["your critical strike chance is lucky while focussed"] = "crafted.stat_1349659520",
    ["gain of maximum life as extra maximum energy shield"] = "crafted.stat_67280387",
    ["increased effect of fortify on you while focussed"] = "crafted.stat_3267282390",
    ["increased rarity of items dropped by slain rare or unique enemies"] = "crafted.stat_2161689853",
    ["to level of socketed support gems"] = "crafted.stat_4154259475",
    ["increased damage per endurance charge"] = "crafted.stat_3515686789",
    ["chance to avoid being stunned"] = "crafted.stat_4262448838",
    ["increased attack and cast speed while focussed"] = "crafted.stat_2628163981",
    ["chance to avoid elemental ailments"] = "crafted.stat_3005472710",
    ["you have onslaught during soul gain prevention"] = "crafted.stat_1572897579",
    ["chance to block attack damage"] = "crafted.stat_2530372417",
    ["reduced damage taken from damage over time"] = "crafted.stat_1101403182",
    ["of life regenerated per second during flask effect"] = "crafted.stat_871270154",
    ["to maximum number of summoned totems"] = "crafted.stat_429867172",
    ["of damage taken from hits is leeched as life during flask effect"] = "crafted.stat_3824033729",
    ["of evasion rating is regenerated as life per second while focussed"] = "crafted.stat_3244118730",
    ["increased attributes"] = "crafted.stat_3143208761",
    ["chance to avoid being stunned during flask effect"] = "crafted.stat_2312652600",
    ["of damage is taken from mana before life while focussed"] = "crafted.stat_1588539856",
    ["increased movement speed during flask effect"] = "crafted.stat_3182498570",
    ["increased mine damage"] = "crafted.stat_2137912951",
    ["increased trap damage"] = "crafted.stat_2941585404",
    ["chance to avoid elemental damage from hits during soul gain prevention"] = "crafted.stat_720398262",
    ["increased flask mana recovery rate"] = "crafted.stat_1412217137",
    ["you are immune to ailments while focussed"] = "crafted.stat_1766730250",
    ["socketed gems are supported by level blood magic"] = "crafted.stat_3922006600",
    ["increased effect of your curses"] = "crafted.stat_2353576063",
    ["increased rarity of items found during flask effect"] = "crafted.stat_3251705960",
    ["chance to block (shields)"] = "crafted.stat_4253454700",
    ["of lightning damage leeched as life"] = "crafted.stat_80079005",
    ["to weapon range"] = "crafted.stat_350598685",
    ["of fire damage leeched as life"] = "crafted.stat_3848282610",
    ["of cold damage leeched as life"] = "crafted.stat_3999401129",
    ["minions recover of their life when you focus"] = "crafted.stat_3500359417",
    ["life gained for each enemy hit by your attacks"] = "crafted.stat_2797971005",
    ["increased mana cost of skills during flask effect"] = "crafted.stat_683273571",
    ["reduced enemy block chance"] = "crafted.stat_2477381238",
    ["flasks gain a charge when you take a critical strike"] = "crafted.stat_301104070",
    ["reflects physical damage to melee attackers"] = "crafted.stat_3767873853",
    ["increased curse duration"] = "crafted.stat_3824372849",
    ["attack projectiles return to you after hitting targets"] = "crafted.stat_1578737937",
    ["chance to gain a frenzy charge on critical strike"] = "crafted.stat_3032585258",
    ["chance to block attack damage while dual wielding"] = "crafted.stat_2166444903",
    ["suffixes cannot be changed"] = "crafted.stat_3464137628",
    ["chance to block attack damage"] = "crafted.stat_1702195217",
    ["prefixes cannot be changed"] = "crafted.stat_2879723104",
    ["reflects physical damage to attackers on block"] = "crafted.stat_1445684883",
    ["reduced enemy stun threshold with this weapon"] = "crafted.stat_832404842",
    ["item drops on death if equipped by an animated guardian"] = "crafted.stat_3909846940",
    ["chance to block spell damage"] = "crafted.stat_561307714",
    ["increased stun duration on enemies"] = "crafted.stat_2517001139",
    ["increased chill duration on enemies"] = "crafted.stat_3485067555",
    ["increased freeze duration on enemies"] = "crafted.stat_1073942215",
    ["increased ignite duration on enemies"] = "crafted.stat_1086147743",
    ["chance to avoid being shocked"] = "crafted.stat_1871765599",
    ["chance to avoid being knocked back"] = "crafted.stat_2362265695",
    ["increased shock duration on enemies"] = "crafted.stat_3668351662",
    ["chance to avoid being ignited"] = "crafted.stat_1783006896",
    ["cannot roll modifiers with required level above #"] = "crafted.stat_238314698",
}
-- Scan a line for the earliest and longest match from the pattern list
-- If a match is found, returns the corresponding value from the pattern list, plus the remainder of the line and a table of captures
local function scan(line, patternList, plain)
	local bestIndex, bestEndIndex
	local bestPattern = ""
    local makeQuery = {}
	local bestVal, bestStart, bestEnd, bestCaps
	local lineLower = line:lower()
	for pattern, patternVal in pairs(patternList) do
		local index, endIndex, cap1, cap2, cap3, cap4, cap5 = lineLower:find(pattern, 1, plain)
		if index and (not bestIndex or index < bestIndex or (index == bestIndex and (endIndex > bestEndIndex or (endIndex == bestEndIndex and #pattern > #bestPattern)))) then
			bestIndex = index
            table.insert(makeQuery, pattern)
			bestEndIndex = endIndex
			bestPattern = pattern
			bestVal = patternVal
			bestStart = index
			bestEnd = endIndex
			bestCaps = { cap1, cap2, cap3, cap4, cap5 }
		end
	end
	if makeQuery then
		return makeQuery
        --bestEnd + 1, -1), bestCaps
	else
		return nil, line
	end
end

function parseMod(line)
    line = scan(line, modNameList)
    --end scanning
    -- Scan for modifier form
    --ParseRaw("Rarity: Rare\nBeast Slicer\nApex Rapier\n--------\nOne Handed Sword\nQuality: +24% (augmented)\nPhysical Damage: 65-151 (augmented)\nCritical Strike Chance: 5.70%\nAttacks per Second: 1.40\nWeapon Range: 12\n--------\nRequirements:\nLevel: 64\nDex: 176\n--------\nSockets: G-B-G \n--------\nItem Level: 80\n--------\n+35% to Global Critical Strike Multiplier\n--------\nSocketed Movement Skills have no Mana Cost\n+5 Life gained for each Enemy hit by Attacks\nGain 13% of Physical Damage as Extra Fire Damage\nGain 20% of Physical Damage as Extra Cold Damage\n20% chance to Poison on Hit\n101% increased Physical Damage\n20% chance to Blind Enemies on hit\n--------\nShaper Item\n--------\nNote: ~price 1 exa\n")
    return line
end
-- --debug
--if not package.loaded['modulename'] then
--    parseMod("hi")
--end
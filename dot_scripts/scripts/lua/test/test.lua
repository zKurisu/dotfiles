#! /usr/bin/lua
--
-- test.lua
-- test
-- Copyright (Lua) Jie
-- 2023-03-13
--
--
package.path = package.path .. ";/home/jie/.luarocks/share/lua/5.4/?.lua;/usr/share/lua/5.4/pl/?.lua;/home/jie/scripts/lua/?.lua"
require("strict")
dofile("lua/test/dofile.lua")

local inspect = require("inspect")
local utils = require("My.utils")

Account = {balance = 0}
function Account:new(o)
  o = o or {}
  self.__index = self
  setmetatable(o, self)
  return o
end

b = Account:new({hi = "lala"})
b.balance = 10
print(inspect(utils))
utils.printG()
-- print(inspect(b))
-- print(b.hi)

-- perl_code = [=[ 
-- use Data::Dumper;
-- use Test::More;
-- use File::Basename;
--
-- my $file_name = basename( $path );
-- print Dumper($file_name);
-- ]=]

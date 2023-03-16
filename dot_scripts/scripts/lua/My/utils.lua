#! /usr/bin/lua
--
-- utils.lua
-- function
-- Copyright (Lua) Jie
-- 2023-03-14
--
--
local utils = {}

function utils.printG()
  for n in pairs(_G) do print(n) end
end

function utils.hello()
  print("Hello")
end

return utils

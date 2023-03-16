-- LuaRocks configuration

rocks_trees = {
   { name = "user", root = home .. "/.luarocks" };
   { name = "system", root = "/usr" };
}
lua_interpreter = "lua5.2";
variables = {
   LUA_DIR = "/usr";
   LUA_INCDIR = "/usr/include/lua5.2";
   LUA_BINDIR = "/usr/bin";
}
rocks_servers = {
  "https://luarocks.cn/",
  "https://mirrors.tuna.tsinghua.edu.cn/luarocks/",
  "http://luarocks.org/repositories/rocks/"
}



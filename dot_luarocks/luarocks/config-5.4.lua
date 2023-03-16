-- LuaRocks configuration

rocks_trees = {
   { name = "user", root = home .. "/.luarocks" };
   { name = "system", root = "/usr" };
}
lua_interpreter = "lua5.4";
variables = {
   LUA_DIR = "/usr";
   LUA_BINDIR = "/usr/bin";
}
rocks_servers = {
  "https://luarocks.cn/",
  "https://mirrors.tuna.tsinghua.edu.cn/luarocks/",
  "http://luarocks.org/repositories/rocks/"
}



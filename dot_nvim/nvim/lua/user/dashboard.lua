local status_ok, db = pcall(require, "dashboard")
if not status_ok then
  return
end

local home = os.getenv('HOME')
-- get pictures
local status_ok2, _ = pcall(require, "user.myfunc.scandir")
if not status_ok2 then
  return
end

local pictures = scandir(home .. '/Disk/Gitrepo/mybgd_for_nvim')
math.randomseed(os.time())
local picture = pictures[math.random(#pictures)]
  -- linux
  db.preview_command = 'ueberzug'
  --
  db.preview_file_path = home .. '/Disk/Gitrepo/mybgd_for_nvim/' .. picture
  db.preview_file_height = 20
  db.preview_file_width = 70
  db.custom_center = {
      {icon = '  ',
      desc = 'Recently latest session                  ',
      shortcut = 'SPC s l',
      action ='SessionLoad'},
      {icon = '  ',
      desc = 'Recently opened files                   ',
      action =  'DashboardFindHistory',
      shortcut = 'SPC f h'},
      {icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC f f'},
      {icon = '  ',
      desc ='File Browser                            ',
      action =  'Telescope file_browser',
      shortcut = 'SPC f b'},
      {icon = '  ',
      desc = 'Find  word                              ',
      action = 'Telescope live_grep',
      shortcut = 'SPC f w'},
      {icon = '  ',
      desc = 'Open Personal dotfiles                  ',
      action = 'Telescope dotfiles path=' .. home ..'/.dotfiles',
      shortcut = 'SPC f d'},
    }

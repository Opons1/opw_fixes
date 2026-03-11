--modpath
local mp = core.get_modpath("opw_fixes")
--mods
local colorcubes = core.get_modpath("colorcubes")
local unifieddyes = core.get_modpath("unifieddyes")
local exoticores = core.get_modpath("exoticores")
local xdecor = core.get_modpath("xdecor")
--Exoticores modifications to spawn rates and nerfs
if exoticores then dofile(mp.."/exoticores.lua") end
--Colorcubes fix to add recipes for the dyed versions
if colorcubes and unifieddyes then dofile(mp.."/colorcubes.lua") end
--change xdecor bowl recipe for wooden bucket
if xdecor then
  core.clear_craft({
      output = "xdecor:bowl"
  })
  core.register_craft({
      output = "xdecor:bowl 3"
      recipe = {
        {"group:wood","","group:wood"},
        {"","group:slab",""},
        {"","",""},
      }
  })
end

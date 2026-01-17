--modpath
local mp = core.get_modpath("opw_fixes")
--mods
local colorcubes = core.get_modpath("colorcubes")
local unifieddyes = core.get_modpath("unifieddyes")
local exoticores = core.get_modpath("exoticores")
local oak_steampunk = core.get_modpath("oak_steampunk")
--Exoticores modifications to spawn rates and nerfs
if exoticores then dofile(mp.."/exoticores.lua") end
--Colorcubes fix to add recipes for the dyed versions
if colorcubes and unifieddyes then dofile(mp.."/colorcubes.lua") end
--crashes without tubelib
if oak_steampunk then 
  core.unregister_item("oak_steampunk:switch_off")
end

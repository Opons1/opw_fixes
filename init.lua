--modpath
local mp = core.get_modpath("opw_fixes")
--mods
local colorcubes = core.get_modpath("colorcubes")
local unifieddyes = core.get_modpath("unifieddyes")
local exoticores = core.get_modpath("exoticores")
local oak_steampunk = core.get_modpath("oak_steampunk")
local oak = core.get_modpath("oak")
--Exoticores modifications to spawn rates and nerfs
if exoticores then dofile(mp.."/exoticores.lua") end
--Colorcubes fix to add recipes for the dyed versions
if colorcubes and unifieddyes then dofile(mp.."/colorcubes.lua") end
--crashes without tubelib
if oak_steampunk then 
  core.unregister_item("oak_steampunk:switch_off")
end
if oak_steampunk and oak then
  core.register_alias_force("oak_steampunk:oak_tree_trunk", "oak:trunk")
  core.register_alias_force("oak_steampunk:oak_tree_planks", "oak:wood")
  core.register_alias_force("oak_steampunk:oak_tree_leaves", "oak:leaves")
end

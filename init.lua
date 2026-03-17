--modpath
local mp = core.get_modpath("opw_fixes")
--mods
local cucina_vegana = core.get_modpath("cucina_vegana")
local colorcubes = core.get_modpath("colorcubes")
local unifieddyes = core.get_modpath("unifieddyes")
local exoticores = core.get_modpath("exoticores")
local xdecor = core.get_modpath("xdecor")
local industrious = core.get_modpath("industrious")
local screwdriver = core.get_modpath("screwdriver")
local amethyst_new = core.get_modpath("amethyst_new")
local farmtools = core.get_modpath("farmtools")
local basic_materials = core.get_modpath("basic_materials")
local pixelfurniture = core.get_modpath("pixelfurniture")
local industrialtest = core.get_modpath("industrialtest")
local technic = core.get_modpath("technic")
local darkage = core.get_modpath("darkage")
if darkage and technic then
    core.register_craft({
        output = "technic:water_mill",
        recipe = {
            {"darkage:marble", "default:diamond", "darkage:marble"},
            {"group:wood", "technic:machine_casing", "group:wood"},
            {"darkage:marble", "technic:lv_cable", "darkage:marble"},
        }
    })
end
--Exoticores modifications to spawn rates and nerfs
if exoticores then dofile(mp.."/exoticores.lua") end
--Colorcubes fix to add recipes for the dyed versions
if colorcubes and unifieddyes then dofile(mp.."/colorcubes.lua") end
--change xdecor bowl recipe for wooden bucket
if cucina_vegana then 
    core.register_craft({
        output = "cucina_vegana:imitation_cheese",
        recipe = {
            {"dye:orange", "cucina_vegana:imitation_butter", "cucina_vegana:imitation_butter"},
        }
    })
    core.register_craft({
        output = "cucina_vegana:imitation_butter",
        recipe = {
            {"dye:yellow", "cucina_vegana:soy_milk", "cucina_vegana:soy_milk"},
        }
    })
if xdecor and pixelfurniture then
    core.clear_craft({output = "xdecor:woodframed_glass"})
    core.register_craft({
        type = "shapeless",
        output = "xdecor:woodframed_glass",
        recipe = {"pixelfurniture:wooden_window"},
    })
end
if xdecor then
  core.clear_craft({output = "xdecor:bowl"})
  core.clear_craft({output = "xdecor:cushion"})
  core.register_craft({
      output = "xdecor:bowl 3",
      recipe = {
        {"group:wood","","group:wood"},
        {"","group:slab",""},
        {"","",""},
      }
  })
  core.register_craft({
    output = "xdecor:cushion",
    recipe = {
      {"wool:white","wool:white","wool:white"},
      {"","dye:red",""},
      {"","",""},
    }
  })
end
if industrious and screwdriver then
  core.clear_craft({output = "industrious:spade_steel"})
  core.register_craft({
    output = "industrious:spade_steel",
    type = "shapeless",
    recipe = {"screwdriver:screwdriver"}
  })
end
if amethyst_new and industrious then
    core.clear_craft({output = "industrious:trapdoor_bronze"})
    core.register_craft({
        output = "industrious:trapdoor_bronze",
        type = "shapeless",
        recipe = {"amethyst_new:trapdoor_bronze"}
    })
end
if farmtools and industrious and basic_materials then
    core.clear_craft({output = "industrious:steel_hammer"})
    core.clear_craft({output = "industrious:bronze_hammer"})
    core.clear_craft({output = "farmtools:rake_bronze"})
    core.clear_craft({output = "farmtools:rake_steel"})
    core.register_craft({
        output = "industrious:steel_hammer",
        recipe = {
            {"default:steel_ingot","default:steel_ingot","default:steel_ingot"},
            {"default:steel_ingot","group:wood","default:steel_ingot"},
            {"","group:stick",""},
        }
    })
    core.register_craft({
        output = "industrious:bronze_hammer",
        recipe = {
            {"default:bronze_ingot","default:bronze_ingot","default:bronze_ingot"},
            {"default:bronze_ingot","group:wood","default:bronze_ingot"},
            {"","group:stick",""},
        }
    })
    core.register_craft({
        output = "farmtools:rake_bronze",
        recipe = {
            {"default:bronze_ingot","default:bronze_ingot","default:bronze_ingot"},
            {"default:bronze_ingot","basic_materials:steel_bar","default:bronze_ingot"},
            {"","group:stick",""},
        }
    })
    core.register_craft({
        output = "farmtools:rake_steel",
        recipe = {
            {"default:steel_ingot","default:steel_ingot","default:steel_ingot"},
            {"default:steel_ingot","basic_materials:steel_bar","default:steel_ingot"},
            {"","group:stick",""},
        }
    })
end
if industrialtest and technic then
    core.clear_craft({output = "technic:cast_iron_ingot"})
    core.register_craft({
        output = "technic:cast_iron_ingot",
        type = "cooking",
        recipe = "industrialtest:refined_iron_ingot",
        cooktime = 1,
    })
end
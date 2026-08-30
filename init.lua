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
local binocular = core.get_modpath("binoculars")
local toolrank = core.get_modpath("toolranks")
local blazing_tools = core.get_modpath("blazing_tools")
local x_bows_extras = core.get_modpath("x_bows_extras")
local dirt_tools = core.get_modpath("dirt_tools")
local replacer = core.get_modpath("replacer")
local has_techage = core.get_modpath("techage")
local nyftyblocks = core.get_modpath("nyftyblocks")
local has_areas = core.get_modpath("areas")
local has_xp_redo = core.get_modpath("xp_redo")
local has_travelnet = core.get_modpath("travelnet")
local has_digtron = core.get_modpath("digtron")
local has_terumet = core.get_modpath("terumet")
local has_shuriken = core.get_modpath("shuriken")
local has_sumpf = core.get_modpath("sumpf")
local has_lootchests = core.get_modpath("lootchests")
local has_modern_ish = core.get_modpath("modern_ish")
local has_biofuel = core.get_modpath("biofuel")
local has_default = core.get_modpath("default")

if has_terumet then dofile(mp .. "/terumet.lua") end
--dofile(mp .. "/overrides.lua")
if has_techage then dofile(mp .. "/techage.lua") end
if has_digtron then dofile(mp .. "/digtron.lua") end
if has_travelnet then dofile(mp.."/travelnet.lua") end
if has_modern_ish then dofile(mp .. "/modern_ish.lua") end
if has_biofuel then dofile(mp .. "/biofuel.lua") end
if industrious then dofile(mp .. "/industrious.lua") end

core.register_craft({
    output = "bones:bones",
    recipe = {
        {"bonemeal:bone", "default:gravel", "bonemeal:bone"},
    }
})

if has_lootchests then
    core.register_craft({
        output = "default:chest",
        type = "shapeless",
        recipe = {"geomoria_lootchests:chest"}
    })
    core.register_craft({
        output = "default:chest",
        type = "shapeless",
        recipe = {"lootchests_default:ocean_chest"}
    })
end

core.register_craft({
    output = "scifi_nodes:rough",
    recipe = {
        {"scifi_nodes:lighttop", "compression:default_cobble_compressed_level_1"}
    }
})
dofile(mp.."/boom.lua")
local it = {
    castiron = "technic:cast_iron_ingot"
}
if has_sumpf then
    core.clear_craft({
        recipe = {
            {"sumpf:junglestone", "sumpf:junglestone"},
            {"sumpf:junglestone", "sumpf:junglestone"}
        },
    })
    core.register_craft({
        output = "sumpf:junglestonebrick 4",
        recipe = {
            {"sumpf:junglestone", "sumpf:junglestone"},
            {"sumpf:junglestone", "sumpf:junglestone"}
        }
    })
end
if has_shuriken then
    local shurikens = {
        "bronze",
        "diamond",
        "gold",
        "mese",
        "steel",
        "stone"
    }

    local items = {
        "default:bronze_ingot",
        "default:diamond",
        "default:gold_ingot",
        "default:mese_crystal",
        "default:steel_ingot",
        "group:cobble"
    }

    for index, shuriken in ipairs(shurikens) do
        local item = "shuriken:" .. shuriken
        local ig = items[index]

        core.clear_craft({output = item})

        core.register_craft({
            output = item .. " 10",
            recipe = {
                {"", ig, ""},
                {ig, it.castiron, ig},
                {"", ig, ""}
            }
        })
    end
end
if nyftyblocks then
    core.clear_craft({output = "nyftyblocks:metal_frame"})
    core.register_craft({
        output = "nyftyblocks:metal_frame 4",
        recipe = {
            {it.castiron, it.castiron, it.castiron},
            {it.castiron, "", it.castiron},
            {it.castiron, it.castiron, it.castiron},
        }
    })
end
if has_techage then
    if nyftyblocks then
        core.clear_craft({output = "nyftyblocks:terracotta"})
        techage.furnace.register_recipe({
	        output = "nyftyblocks:terracotta 4",
	        recipe = {"default:clay 4"},
	        time = 1,
        }) 
    end
end
if darkage then
    core.override_item("darkage:chalked_bricks_with_plaster", {
        drop = "darkage:chalked_bricks_with_plaster"
    })
    core.override_item("darkage:cobble_with_plaster", {
        drop = "darkage:cobble_with_plaster"
    })
end
if replacer then
    core.clear_craft({output = "replacer:replacer"})
    core.clear_craft({output = "replacer:replacer_technic"})
    core.register_craft({
        output = "replacer:replacer_technic",
        recipe = {
            {"technic_many_machines:radiant_alloy_plate", "technic:control_logic_unit", "technic_many_machines:radiant_alloy_plate"},
            {"technic:mining_drill_mk3", "technic:blue_energy_crystal", "technic:constructor_mk3_off"},
            {"technic_many_machines:radiant_alloy_plate", "mesecons_detector:node_detector_off", "technic_many_machines:radiant_alloy_plate"},
        }
    })
end
if x_bows_extras then
    core.clear_craft({output = "x_bows_extras:arrow_cluster"})
    core.register_craft({
        output = "x_bows_extras:arrow_cluster",
        recipe = {
            {"x_bows:quiver", "default:mese_crystal", "x_bows:quiver"},
            {"x_bows:quiver", "default:stick", "x_bows:quiver"},
            {"x_bows:quiver", "wool:white", "x_bows:quiver"},
        }
    })
    core.clear_craft({output = "x_bows_extras:arrow_diamond_tipped_poison"})
    core.register_craft({
        output = "x_bows_extras:arrow_diamond_tipped_poison",
        type = "shapeless",
        recipe = {"underworlds:bucket_poisonous_water", "x_bows:arrow_diamond"},
        replacements = {
            {"underworlds:bucket_poisonous_water", "bucket:bucket_empty"}
        }
    })
    core.clear_craft({output = "x_bows_extras:arrow_healing"})
    core.register_craft({
        output = "x_bows_extras:arrow_healing 4",
        type = "shapeless",
        recipe = {
            "x_bows:arrow_wood", "livingcaves:healingsoup", "x_bows:arrow_wood", "x_bows:arrow_wood"
        }
    })
    core.clear_craft({output = "x_bows_extras:arrow_lightning"})
    core.register_craft({
        output = "x_bows_extras:arrow_lightning",
        recipe = {
            {"", "birthstones:topaz", ""},
            {"", "group:stick", ""},
            {"", "farming:string", ""},
        }
    })
    core.clear_craft({output = "x_bows_extras:arrow_rip"})
    core.clear_craft({output = "x_bows_extras:arrow_teleport"})
    core.register_craft({
        output = "x_bows_extras:arrow_teleport",
        recipe = {
            {"", "teleport_potion:potion", ""},
            {"", "group:stick", ""},
            {"", "farming:string", ""},
        }
    })
    core.clear_craft({output = "x_bows_extras:bazooka"})
    core.register_craft({
        output = "x_bows_extras:bazooka",
        recipe = {
            {"", "technic:cast_iron_block", "default:coalblock"},
            {"technic:cast_iron_block", "mesecons_pistons:piston_normal_off", "group:stick"},
            {"mesecons_button:button_off", "group:stick", ""},
        }
    })
    core.clear_craft({output = "x_bows_extras:bazooka_bullet"})
    core.register_craft({
        output = "x_bows_extras:bazooka_bullet",
        recipe = {
            {"dye:dark_green", "technic:composite_plate", "techage:gun_powder"},
            {"technic:composite_plate", "tnt:tnt", "technic:composite_plate"},
            {"techage:gun_powder", "technic:composite_plate", "dye:yellow"},
        }
    })
end
if toolrank then
    if blazing_tools then
        toolranks.add_tool("blazing_tools:axe_blazing")
        toolranks.add_tool("blazing_tools:pick_blazing")
        toolranks.add_tool("blazing_tools:shovel_blazing")
        toolranks.add_tool("blazing_tools:sword_blazing")
        toolranks.add_tool("blazing_tools:multitool_blazing")
    end
    if dirt_tools then
        toolranks.add_tool("dirt_tools:axe")
        toolranks.add_tool("dirt_tools:pick")
        toolranks.add_tool("dirt_tools:shovel")
        toolranks.add_tool("dirt_tools:sword")
    end
end
if binocular then
    function binoculars.update_player_property(player)
	    local new_zoom_fov = 15
	    if player:get_properties().zoom_fov ~= new_zoom_fov then
		    player:set_properties({zoom_fov = new_zoom_fov})
	    end
    end
end

local twchests = core.get_modpath("twchests")
if technic and twchests then
    core.clear_craft({output = "twchests:chest_bottomless"})
    core.clear_craft({output = "twchests:chest_bottomless_locked"})
    core.register_craft({
        output = "twchests:chest_bottomless",
        recipe = {
            {"technic:mithril_chest", "default:diamondblock", "technic:mithril_chest"},
            {"default:diamondblock", "default:diamondblock", "default:diamondblock"},
            {"technic:mithril_chest", "default:diamondblock", "technic:mithril_chest"},
        }
    })
    core.register_craft({
            type = "shapeless",
            output = "twchests:chest_bottomless_locked",
            recipe = {"default:steel_ingot", "twchests:chest_bottomless"},
        })
            
end
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
if has_areas and has_xp_redo then dofile(mp.."/areas.lua") end
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
end
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
-- Override core.sound_play to prevent server crashes
local core_sound_play = core.sound_play
core.sound_play = function(spec, parameters, ephermal)
	local obj_arg_type = type(parameters.object)
	if obj_arg_type == "userdata" or obj_arg_type == "nil" then
		return core_sound_play(spec, parameters, ephermal)
	elseif obj_arg_type == "table" and type(parameters.object.get_pos) == "function" then
		return core_sound_play(spec, {
				gain = parameters.gain,
				pitch = parameters.pitch,
				fade = parameters.fade,
				start_time = parameters.start_time,
				loop = parameters.loop,
				pos = parameters.object:get_pos(),
				object = nil,
				to_player = parameters.to_player,
				exclude_player = parameters.exclude_player,
				max_hear_distance = parameters.max_hear_distance
		}, ephermal)
	end
end

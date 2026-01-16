--for color cubes to have recipes
local function add_unicolor_groups(name, color)
  local node_def = core.registered_items[name]
  if not node_def then return end
  --this table copy part was assisted by ai, before i thought making a local would make a copy of a table.
  local groups = {}
  if node_def.groups then
      for k, v in pairs(node_def.groups) do
           groups[k] = v
      end
  end
  groups["unicolor_" .. color] = 1
  groups["not_in_creative_inventory"] = 0
  core.override_item(name, {
    groups = groups
  })
end

add_unicolor_groups("dye:spring", "aqua")
add_unicolor_groups("dye:black", "black")
add_unicolor_groups("dye:blue", "blue")
add_unicolor_groups("dye:dark_orange", "dark_orange")
add_unicolor_groups("dye:magenta", "magenta")
add_unicolor_groups("dye:violet", "violet")
add_unicolor_groups("dye:dark_green", "dark_green")
add_unicolor_groups("dye:green", "green")
add_unicolor_groups("dye:chartreuse", "lime")
add_unicolor_groups("dye:yellow", "yellow")
add_unicolor_groups("dye:red", "red")
add_unicolor_groups("dye:orange", "orange")
add_unicolor_groups("dye:white", "white")
add_unicolor_groups("dye:cyan", "cyan")
add_unicolor_groups("dye:dark_grey", "darkgrey")
add_unicolor_groups("dye:grey", "grey")
add_unicolor_groups("dye:pink", "light_red")
add_unicolor_groups("dye:azure", "sky_blue")
add_unicolor_groups("dye:rose", "red_violet")
--recipes for white_single, white_light, and white_window
local w = "dye:white"
local t = "default:torch"
local b = "dye:black"
local g = "default:glass"
core.register_craft({
  type = "shaped",
  output = "colorcubes:white_single",
  recipe = {
      {w, w, w},
      {w, b, w},
      {w, w, w},
    } 
  }
)
core.register_craft({
    type = "shaped",
    output = "colorcubes:white_window",
    recipe = {
      {w, w, w},
      {w, g, w},
      {w, w, w}
    }
  }
)
core.register_craft({
    type = "shaped",
    output = "colorcubes:white_light",
    recipe = {
      {w, w, w},
      {w, t, w},
      {w, w, w}
    }
  }
)

travelnet.register_travelnet_box({
	nodename = "opw_fixes:travelnet_protected",
	color = "#5b6b9c",
    recipe = {
        {"group:travelnet", "default:copper_ingot"},
    },
})
core.override_item("opw_fixes:travelnet_protected", {
    on_punch = function(pos, node, puncher)
        local player_name = puncher:get_player_name()
        local is_protected = core.is_protected(pos, player_name)
        if not is_protected then
            local meta = core.get_meta(pos)
            travelnet.show_current_formspec(pos, meta, player_name)
        end
    end,
    on_rightclick = function(pos, node, player)
        local player_name = player:get_player_name()
        local is_protected = core.is_protected(pos, player_name)
        if not is_protected then
            local meta = core.get_meta(pos)
            travelnet.show_current_formspec(pos, meta, player_name)
        end
    end,
    description = "Protected Travelnet-Box"
})


if core.get_modpath("birthstones") then
    core.clear_craft({recipe = {
        {"default:glass", "default:steel_ingot", "default:glass"},
        {"default:glass", "default:mese", "default:glass"},
        {"default:glass", "default:steel_ingot", "default:glass"}
    }})
    core.register_craft({
        output = "travelnet:travelnet",
        recipe = {
            {"default:glass", "birthstones:opal", "default:glass"},
            {"default:glass", "default:mese", "default:glass"},
            {"default:glass", "birthstones:opal", "default:glass"}
        }
    })
end
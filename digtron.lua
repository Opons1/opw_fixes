--remaking all the recipes yay
local function clr(item)
    core.clear_craft({output = item})
end
if core.get_modpath("technic") and core.get_modpath("technic_many_machines") then
    local nodes = {
        "digtron:digtron_core",
        "digtron:auto_controller",
    }
    for _, item in ipairs(nodes) do
        clr(item)
    end

    local function reg_craft(output, recipe)
        core.register_craft({
            output = output,
            recipe = recipe
        })
    end

    reg_craft("digtron:digtron_core", {
        {"technic:graphite", "default:steel_ingot", "technic:graphite"},
        {"default:steel_ingot", "default:mese_crystal_fragment", "default:steel_ingot"},
        {"technic:graphite", "default:steel_ingot", "technic:graphite"},
    })

    reg_craft("digtron:auto_controller", {
        {"default:mese_crystal", "technic_many_machines:lcd", "default:mese_crystal"},
        {"default:mese_crystal", "digtron:controller", "default:mese_crystal"},
        {"default:mese_crystal", "default:mese_crystal", "default:mese_crystal"},

    })
end
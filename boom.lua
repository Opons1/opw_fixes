local function make_unblastable(node)
    if core.registered_nodes[node] then 
        core.override_item(node, {
            on_blast = function(pos)
                return
            end
        })
    end
end
local nodes = {
    "digtron:auto_controller",
    "digtron:axle",
    "digtron:battery_holder",
    "digtron:builder",
    "digtron:combined_storage",
    "digtron:controller",
    "digtron:corner_panel",
    "digtron:digger",
    "digtron:dual_digger",
    "digtron:dual_soft_digger",
    "digtron:duplicator",
    "digtron:edge_panel",
    "digtron:empty_crate",
    "digtron:empty_locked_crate",
    "digtron:fuelstore",
    "digtron:intermittent_digger",
    "digtron:intermittent_soft_digger",
    "digtron:inventory",
    "digtron:inventory_ejector",
    "digtron:light",
    "digtron:master_builder",
    "digtron:panel",
    "digtron:power_connector",
    "digtron:pusher",
    "digtron:soft_digger",
    "digtron:structure",
    "techage:ta3_digtron_battery_pas",
    "techage:ta3_digtron_battery_act",
}

for _, node in ipairs(nodes) do
    make_unblastable(node)
end


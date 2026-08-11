local function is_convertible(inputstack)
    local input = inputstack:get_name()
	if biomass.convertible_items[input] then
			return true
		end
	if food_fuel then
		if biomass.food_waste[input] then
			return true
		end
	end
	for _, v in pairs(biomass.convertible_groups) do
		if minetest.get_item_group(input, v) > 0 then
			return true
		end
	end
	return false
end


if core.get_modpath("techage") then
    techage.register_node({"biofuel:refinery"}, {
        on_push_item = function(pos, in_dir, stack)
            if is_convertible(stack) then
                local meta = core.get_meta(pos)
                local inv = meta:get_inventory()
                return techage.put_items(inv, "src", stack)
            end
        end,
        on_pull_item = function(pos, out_dir, count)
            local meta = minetest.get_meta(pos)
            local inv = meta:get_inventory()
            return techage.get_items(pos, inv, "dst", count)
        end,
        on_unpull_item = function(pos, out_dir, stack)
            local meta = minetest.get_meta(pos)
            local inv = meta:get_inventory()
            return techage.put_items(inv, "dst", stack)
        end,
    })
end


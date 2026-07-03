local S = core.get_translator("areas")
local function calculate_area_amount(xp)
    local orig = 4
    local mult = 1000
    local num = math.floor(math.sqrt(xp/mult)) + orig
    return num
end
--code taken from areas starts here
core.register_on_mods_loaded(function()
	areas:registerProtectionCondition(function(pos1, pos2, name) 
        local xp = xp_redo.get_xp(name)
        local count = 0
	    for _, area in pairs(areas.areas) do
		    if area.owner == name then
			    count = count + 1
		    end
	    end
        local maxcount = calculate_area_amount(xp)
        if count < maxcount then
            return true
        end
	end)
end)

core.override_chatcommand("area_info", {
    func = function(name)
        local lines = {}
		local privs = minetest.get_player_privs(name)
		-- Short (and fast to access) names
        local xp = xp_redo.get_xp(name)
		local cfg = areas.config
		local self_prot  = cfg.self_protection
		local prot_priv  = cfg.self_protection_privilege
		local limit      = calculate_area_amount(xp)
		local limit_high = cfg.self_protection_max_areas_high
		local size_limit = cfg.self_protection_max_size
		local size_limit_high = cfg.self_protection_max_size_high

		local has_high_limit = privs.areas_high_limit
		local has_prot_priv = not prot_priv or privs[prot_priv]
		local can_prot = privs.areas or (self_prot and has_prot_priv)
		local max_count = can_prot and
			(has_high_limit and limit_high or limit) or 0
		local max_size = has_high_limit and
			size_limit_high or size_limit
		-- Self protection information
		local self_prot_line = self_prot and S("Self protection is enabled.") or
					S("Self protection is disabled.")
		table.insert(lines, self_prot_line)
		-- Privilege information
		local priv_line = has_prot_priv and
					S("You have the necessary privilege (\"@1\").", prot_priv) or
					S("You don't have the necessary privilege (\"@1\").", prot_priv)
		table.insert(lines, priv_line)
		if privs.areas then
			table.insert(lines, S("You are an area"..
				" administrator (\"areas\" privilege)."))
		elseif has_high_limit then
			table.insert(lines,
				S("You have extended area protection"..
				" limits (\"areas_high_limit\" privilege)."))
		end

		-- Area count
		local area_num = 0
		for id, area in pairs(areas.areas) do
			if area.owner == name then
				area_num = area_num + 1
			end
		end
		table.insert(lines, S("You have @1 areas.", area_num))

		-- Area limit
		local area_limit_line = privs.areas and
			S("Limit: no area count limit") or
			S("Limit: @1 areas", max_count)
		table.insert(lines, area_limit_line)

		-- Area size limits
		local function size_info(str, size)
			table.insert(lines, S("@1 spanning up to @2x@3x@4.",
				str, size.x, size.y, size.z))
		end
		local function priv_limit_info(lpriv, lmax_count, lmax_size)
			size_info(S("Players with the \"@1\" privilege"..
				" can protect up to @2 areas", lpriv, lmax_count),
				lmax_size)
		end
		if self_prot then
			if privs.areas then
				priv_limit_info(prot_priv,
					limit, size_limit)
				priv_limit_info("areas_high_limit",
					limit_high, size_limit_high)
			elseif has_prot_priv then
				size_info(S("You can protect areas"), max_size)
			end
		end

		return true, table.concat(lines, "\n")
    end
})

if core.get_modpath("protector") then
	local old_can_protect_areas = areas.canPlayerAddArea
	function areas:canPlayerAddArea(pos1, pos2, name)
		local can_skip = core.check_player_privs(name, "protection_bypass")
		if not can_skip then
			local r = protector.radius
			local bottomleftcheck = {}
			local toprightcheck = {}
			for i, coord in ipairs({"x", "y", "z"}) do
				if pos1[coord] > pos2[coord] then
					toprightcheck[coord] = pos1[coord] + r
					bottomleftcheck[coord] = pos2[coord] - r
				else
					toprightcheck[coord] = pos2[coord] + r
					bottomleftcheck[coord] = pos1[coord] - r
				end
			end
			--thanks to tenplus1 for original code in protector redo mod(i copied this from there)
			local pos = core.find_nodes_in_area(bottomleftcheck, toprightcheck,
				{"protector:protect", "protector:protect2", "protector:protect_hidden"})

			for n = 1, #pos do
				local meta = core.get_meta(pos[n])
				local owner = meta:get_string("owner") or ""
				local members = meta:get_string("members") or ""
				local memberlist
				-- node change and digger isn't owner
				if owner ~= name then
					local member_found
					memberlist = members:split(" ")
					for _, n in pairs(memberlist) do
						if n == name then 
							member_found = true
						end
					end	
					if not member_found then
						return false, "This area is already protected by a protector block!"
					end	
				end
			end
		end
    	return old_can_protect_areas(self, pos1, pos2, name)	
	end
	local old_can_dig = protector.can_dig
	protector.can_dig = function(r, pos, digger, onlyowner, infolevel)
		local result = old_can_dig(r, pos, digger, onlyowner, infolevel)
		if infolevel == 3 and result == true then
			local r = protector.radius
			local corner1 = {x = pos.x + r, y = pos.y + r, z = pos.z + r}
			local corner2 = {x = pos.x - r, y = pos.y - r, z = pos.z - r}
			local can, id = areas:canInteractInArea(corner1, corner2, digger)
			if not can then
				local area = areas.areas[id]
				result = false
				core.chat_send_player(digger, "The area intersects with " .. area.name .. " " .. id .. " " .. " by " .. area.owner)
			end
		end
		return result
	end
end

core.register_on_joinplayer(function(player)
    -- Leave the first 3 arguments empty so we don't alter the inventory slot visuals.
    -- The 4th argument controls tooltip background color.
    -- The 5th argument controls tooltip text color.
    local tooltip_style = "listcolors[;;;#4a148c;#ffffff]"
    
    -- Inject it dynamically into every formspec the player opens
    player:set_formspec_prepend(tooltip_style)
end)

core.clear_craft({output = "industrious:ice_block"})

core.register_craft({
    output = "industrious:ice_block",
    recipe = {
        {"default:ice", "default:ice", "default:ice"},
        {"default:ice", "", "default:ice"},
        {"default:ice", "default:ice", "default:ice"}, 
    }
})

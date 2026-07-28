--[[
core.register_craft({
    output = "",
    recipe = {
        {"", "", ""},
        {"", "", ""},
        {"", "", ""},
    }
})
core.register_craft({
    output = "",
    recipe = {{""}}
})
]]


local m = {
    iron = "default:steel_ingot",
    bronze = "default:bronze_ingot",
    gold = "default:gold_ingot",
    bars = {
        iron = "xpanes:bar_flat",
        bronze = "xpanes:bronze_bar_flat",
        gold = "xpanes:gold_bar_flat"
    },
    bucket = "bucket:bucket_empty"

}
--drains
core.register_craft({
    output = "modern_ish:util_drain",
    recipe = {
        {m.iron, m.iron, m.iron},
        {m.iron, m.bars.iron, m.iron},
        {m.iron, m.bucket, m.iron},
    }
})

core.register_craft({
    output = "modern_ish:util_drain_wall 2",
    recipe = {{"modern_ish:util_drain"}}
})

core.register_craft({
    output = "modern_ish:util_drain",
    recipe = {{"modern_ish:util_drain_wall", "modern_ish:util_drain_wall"}}
})

core.register_craft({
    output = "modern_ish:util_drain_bronze",
    recipe = {
        {m.bronze, m.bronze, m.bronze},
        {m.bronze, m.bars.bronze, m.bronze},
        {m.bronze, m.bucket, m.bronze},
    }
})

core.register_craft({
    output = "modern_ish:util_drain_wall_bronze 2",
    recipe = {{"modern_ish:util_drain_bronze"}}
})

core.register_craft({
    output = "modern_ish:util_drain_bronze",
    recipe = {{"modern_ish:util_drain_wall_bronze", "modern_ish:util_drain_wall_bronze"}}
})

core.register_craft({
    output = "modern_ish:util_drain_gold",
    recipe = {
        {m.gold, m.gold, m.gold},
        {m.gold, m.bars.gold, m.gold},
        {m.gold, m.bucket, m.gold},
    }
})

core.register_craft({
    output = "modern_ish:util_drain_wall_gold 2",
    recipe = {{"modern_ish:util_drain_gold"}}
})

core.register_craft({
    output = "modern_ish:util_drain_gold",
    recipe = {{"modern_ish:util_drain_wall_gold", "modern_ish:util_drain_wall_gold"}}
})
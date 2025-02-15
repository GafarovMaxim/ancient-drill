--[[
data:extend({

    {
        type = "bool-setting",
        name = "universal-setting",
        setting_type = "startup",
        default_value = true,
        order = "a",
    }
})
]]

if mods["space-age"] then
    data:extend({
        {
            type = "bool-setting",
            name = "big-mining-drill-ingredient",
            setting_type = "startup",
            default_value = false,
            order = "c",
        }
    })
end
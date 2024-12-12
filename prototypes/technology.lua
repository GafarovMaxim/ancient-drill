local function create_ancient_drill_technology()
    local technology = {
        type = "technology",
        name = "ancient-drill",
        icon = "__AncientDrill__/graphics/technology/ancient-drill.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ancient-drill"
            },
        },
        prerequisites = {"electric-engine", "automation-3", "production-science-pack", "utility-science-pack", },
        unit = {
            count = 1000,
            ingredients = {
                {"automation-science-pack", 2},
                {"logistic-science-pack", 2},
                {"chemical-science-pack", 2},
				{"utility-science-pack", 2},
                {"production-science-pack", 2},
            },
            time = 20
        },
        order = "c-g-b-z",
    }

    if mods["space-age"] then
        technology.prerequisites = {"electromagnetic-science-pack", "big-mining-drill", "turbo-transport-belt"}
        table.insert(technology.unit.ingredients, {"electromagnetic-science-pack", 2})
		table.insert(technology.unit.ingredients, {"metallurgic-science-pack", 2})
    end
    
    return technology
end

data:extend({create_ancient_drill_technology()})
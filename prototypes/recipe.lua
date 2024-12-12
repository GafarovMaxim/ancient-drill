local function create_ancient_drill_recipe()
    local base_recipe = {
        type = "recipe",
        name = "ancient-drill",
		category = "crafting-with-fluid",
        energy_required = 60,
        ingredients = {
            { type = "item", name = "processing-unit", amount = 50 },
            { type = "item", name = "iron-gear-wheel", amount = 100 },
            { type = "item", name = "steel-plate", amount = 300 },
            { type = "item", name = "electric-engine-unit", amount = 50 },
			{ type = "fluid", name = "lubricant", amount = 300},
        },
        results = { { type = "item", name = "ancient-drill", amount = 1 } },
        enabled = false,
    }
    
    local recipe = table.deepcopy(base_recipe) -- Создаем копию базового рецепта

    if mods["space-age"] then
        recipe.surface_conditions = {
            {
                property = "magnetic-field",
                min = 99
            }
        }
        recipe.ingredients = {
            { type = "item", name = "scrap", amount = 100 },
            { type = "item", name = "iron-gear-wheel", amount = 100 },
            { type = "item", name = "holmium-plate", amount = 25 },
            { type = "item", name = "electric-engine-unit", amount = 25 },
            { type = "item", name = "tungsten-plate", amount = 100 },
			{ type = "fluid", name = "lubricant", amount = 300},
        }
    end
    
    return recipe
end


data:extend({create_ancient_drill_recipe()})
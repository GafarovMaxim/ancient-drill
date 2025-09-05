local function create_ancient_drill_recipe()
    local recipe = {
        type = "recipe",
        name = "ancient-drill",
        category = "crafting-with-fluid",
        energy_required = 60,
        results = { { type = "item", name = "ancient-drill", amount = 1 } },
        enabled = false,
    }

    local base_ingredients = {
        { type = "item", name = "processing-unit", amount = 200 },
        { type = "item", name = "iron-gear-wheel", amount = 500 },
        { type = "item", name = "steel-plate", amount = 300 },
        { type = "item", name = "electric-engine-unit", amount = 50 },
        { type = "fluid", name = "lubricant", amount = 300 },
    }

    local k2so = {
        ["Krastorio2-spaced-out"] = {
            default = {
				{ type = "item", name = "kr-imersium-plate", amount = 200 },
                { type = "item", name = "kr-imersium-gear-wheel", amount = 200 },
                { type = "item", name = "holmium-plate", amount = 300 },
                { type = "item", name = "tungsten-plate", amount = 600 },
				{ type = "item", name = "kr-charged-matter-stabilizer", amount = 20 },
                { type = "item", name = "kr-ai-core", amount = 15 },
                { type = "fluid", name = "lubricant", amount = 300 },
            },
            big_drill = {
				{ type = "item", name = "kr-imersium-plate", amount = 200 },
                { type = "item", name = "kr-imersium-gear-wheel", amount = 200 },
                { type = "item", name = "holmium-plate", amount = 300 },
                { type = "item", name = "big-mining-drill", amount = 3 },
				{ type = "item", name = "kr-charged-matter-stabilizer", amount = 20 },
                { type = "item", name = "kr-ai-core", amount = 15 },
                { type = "fluid", name = "lubricant", amount = 300 },
            }
        },
        ["space-age"] = {
            default = {
                { type = "item", name = "scrap", amount = 500 },
                { type = "item", name = "iron-gear-wheel", amount = 600 },
                { type = "item", name = "holmium-plate", amount = 250 },
                { type = "item", name = "electric-engine-unit", amount = 50 },
				{ type = "item", name = "processing-unit", amount = 200 },
                { type = "item", name = "tungsten-plate", amount = 250 },
                { type = "fluid", name = "lubricant", amount = 300 },
            },
            big_drill = {
                { type = "item", name = "scrap", amount = 500 },
                { type = "item", name = "iron-gear-wheel", amount = 600 },
                { type = "item", name = "holmium-plate", amount = 250 },
                { type = "item", name = "electric-engine-unit", amount = 50 },
				{ type = "item", name = "processing-unit", amount = 200 },
                { type = "item", name = "big-mining-drill", amount = 2 },
                { type = "fluid", name = "lubricant", amount = 300 },
            }
        },
        ["Krastorio2"] = {
            default = {
				{ type = "item", name = "kr-imersium-plate", amount = 300 },
                { type = "item", name = "kr-imersium-gear-wheel", amount = 300 },
				{ type = "item", name = "kr-charged-matter-stabilizer", amount = 20 },
				{ type = "item", name = "electric-engine-unit", amount = 40 },
				{ type = "item", name = "processing-unit", amount = 100 },
                { type = "item", name = "kr-ai-core", amount = 15 },
                { type = "fluid", name = "lubricant", amount = 300 },
            }
        }
    }

    local magnetic_surface = {
        { property = "magnetic-field", min = 99 }
    }

    -- Проверка: K2SO или (K2 + Space Age)
    local is_k2so_like = mods["Krastorio2-spaced-out"] or (mods["Krastorio2"] and mods["space-age"])

    if is_k2so_like then
        recipe.surface_conditions = magnetic_surface
        recipe.ingredients = settings.startup["big-mining-drill-ingredient"].value
            and k2so["Krastorio2-spaced-out"].big_drill
            or  k2so["Krastorio2-spaced-out"].default

    elseif mods["space-age"] then
        recipe.surface_conditions = magnetic_surface
        recipe.ingredients = settings.startup["big-mining-drill-ingredient"].value
            and k2so["space-age"].big_drill
            or  k2so["space-age"].default

    elseif mods["Krastorio2"] then
        recipe.ingredients = k2so["Krastorio2"].default

    else
        recipe.ingredients = base_ingredients
    end

    return recipe
end

data:extend({create_ancient_drill_recipe()})

local ingredients

if mods["Krastorio2-spaced-out"] then
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"utility-science-pack", 1},
    {"production-science-pack", 1},
    {"metallurgic-science-pack", 1},
    {"electromagnetic-science-pack", 1},
    {"kr-matter-tech-card", 1},
    {"kr-singularity-tech-card", 1}
  }
elseif mods["Krastorio2"] then
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"utility-science-pack", 1},
    {"production-science-pack", 1},
    {"kr-matter-tech-card", 1},
    {"kr-singularity-tech-card", 1}
  }
elseif mods["space-age"] then
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"utility-science-pack", 1},
    {"production-science-pack", 1},
    {"space-science-pack", 1},
    {"metallurgic-science-pack", 1},
    {"electromagnetic-science-pack", 1}
  }
else
  ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"utility-science-pack", 1},
    {"production-science-pack", 1},
    {"space-science-pack", 1}
  }
end

local prerequisites

-- Подбираем зависимости без циклов
local prerequisites
if mods["skewer-deep-mining-drill-standalone"] and mods["space-age"] then
  prerequisites = {"deep_mining", "holmium-processing", "big-mining-drill", "turbo-transport-belt"}
elseif mods["skewer-deep-mining-drill-standalone"] then
  prerequisites = {"deep_mining", "electric-engine", "automation-3"}
elseif mods["space-age"] then
  prerequisites = {"holmium-processing","big-mining-drill", "turbo-transport-belt"}
elseif mods["boblogistics"] and settings.startup["bobmods-logistics-beltoverhaul"].value == true then
  prerequisites = {"electric-engine", "automation-4"}
else
  prerequisites = {"electric-engine", "automation-3"}
end

local function create_ancient_drill_technology()
  local technology = {
    type = "technology",
    name = "ancient-drill",
    icon = "__AncientDrill__/graphics/technology/ancient-drill.png",
    icon_size = 256,
    effects = {{type = "unlock-recipe", recipe = "ancient-drill"}},
    prerequisites = prerequisites,
    unit = {
      count = 2500,
      ingredients = ingredients,
      time = 20
    },
    order = "c-g-b-z"
  }
  return technology
end

data:extend({create_ancient_drill_technology()})

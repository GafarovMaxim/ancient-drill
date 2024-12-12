local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local ancient_drill_entity = {
    {
        type = "mining-drill",
        name = "ancient-drill",
        icon = "__AncientDrill__/graphics/entity/ancient-drill-large.png",
        icon_size = 32,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 25, result = "ancient-drill"},
        max_health = 4000,
        corpse = "big-remnants",
        dying_explosion = "big-explosion",
        collision_box = {{-5.3, -5.3}, {5.3, 5.3}},
        selection_box = {{-5.5, -5.5}, {5.5, 5.5}},
        energy_source = { type = "electric", emissions_per_minute = { pollution = 200 }, usage_priority = "secondary-input" },
        energy_usage = "10000kW",
		resource_categories = {"basic-solid"},
		mining_power = 5,
		mining_speed = 20,
		output_priority = "primary-output",resource_drain_rate_percent = 50,
		storage_output_offset = {0, 5.6},
        vector_to_place_result = {0, 5.6},
		fast_replaceable_group = "mining-drill",
        module_slots = 4,
		storage_slots = 1,
		allowed_effects = {"consumption", "speed",  "pollution", "productivity"},
        resource_searching_radius = 12.49,
		radius_visualisation_picture = {
            filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
            width = 12,
            height = 12,
        },
        monitor_visualization_tint = {r = 78, g = 173, b = 255},
        working_sound = {
            sound = {
                filename = "__base__/sound/electric-mining-drill.ogg",
                volume = 2.5,
            },
            max_sounds_per_type = 4,
            fade_in_ticks = 4,
            fade_out_ticks = 20,
        },
        vehicle_impact_sound = sounds.generic_impact,
		open_sound = sounds.drill_open,
        close_sound = sounds.drill_close,
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__AncientDrill__/graphics/entity/ancient-drill-hr-shadow.png",
                        priority = "high",
                        width = 1400,
                        height = 1400,
                        frame_count = 1,
                        repeat_count = 120,
                        animation_speed = 0.5,
                        draw_as_shadow = true,
                        scale = 0.5,
                    },
                    {
                        priority = "high",
                        width = 704,
                        height = 704,
                        frame_count = 120,
                        animation_speed = 0.5,
                        scale = 0.5,
                        stripes = {
                            {
                                filename = "__AncientDrill__/graphics/entity/ancient-drill-hr-animation-1.png",
                                width_in_frames = 8,
                                height_in_frames = 8,
                            },
                            {
                                filename = "__AncientDrill__/graphics/entity/ancient-drill-hr-animation-2.png",
                                width_in_frames = 8,
                                height_in_frames = 8,
                            },
                        },
                    },
                },
            },
            working_visualisations = {
                {
                    fadeout = true,
                    animation = {
                        priority = "high",
                        width = 704,
                        height = 400,
                        shift = util.by_pixel_hr(0, 92),
                        frame_count = 120,
                        animation_speed = 0.5,
                        scale = 0.5,
                        draw_as_light = true,
                        blend_mode = "additive",
                        stripes = {
                            {
                                filename = "__AncientDrill__/graphics/entity/ancient-drill-hr-animation-emission-1.png",
                                width_in_frames = 8,
                                height_in_frames = 8,
                            },
                            {
                                filename = "__AncientDrill__/graphics/entity/ancient-drill-hr-animation-emission-2.png",
                                width_in_frames = 8,
                                height_in_frames = 8,
                            },
                        },
                    },
                    reset_animation_when_frozen = true,
                },
            },
        },
    },
}

if mods["space-age"] then
  ancient_drill_entity[1].heating_energy = "600kW"
  ancient_drill_entity[1].allowed_effects = {"consumption", "speed",  "pollution", "productivity", "quality"}
  ancient_drill_entity[1].storage_output_offset = {0, 5.6}
  ancient_drill_entity[1].drops_full_belt_stacks = true
  ancient_drill_entity[1].resource_categories = {"basic-solid", "hard-solid"}
else
  ancient_drill_entity[1].heating_energy = "0W"
end

data:extend(ancient_drill_entity)